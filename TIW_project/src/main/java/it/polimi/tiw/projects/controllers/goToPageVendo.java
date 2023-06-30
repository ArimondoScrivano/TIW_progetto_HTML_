package it.polimi.tiw.projects.controllers;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.TimeUnit;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.thymeleaf.TemplateEngine;
import org.thymeleaf.context.WebContext;
import org.thymeleaf.templatemode.TemplateMode;
import org.thymeleaf.templateresolver.ServletContextTemplateResolver;

import it.polimi.tiw.projects.beans.Articolo;
import it.polimi.tiw.projects.beans.User;
import it.polimi.tiw.projects.beans.Asta;
import it.polimi.tiw.projects.dao.ArticoloDAO;
import it.polimi.tiw.projects.dao.AstaDAO;
import it.polimi.tiw.projects.dao.ListaArticoliDAO;


@WebServlet("/goToPageVendo")
public class goToPageVendo extends HttpServlet{
	private static final long serialVersionUID = 1L;
	private Connection connection = null;
	TemplateEngine templateEngine;


	public goToPageVendo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public void init() {
		ServletContext servletContext = getServletContext();
		String driver = servletContext.getInitParameter("dbDriver");
		String url = servletContext.getInitParameter("dbUrl");
		String user = servletContext.getInitParameter("dbUser");
		String password = servletContext.getInitParameter("dbPassword");
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			connection = DriverManager.getConnection(url, user, password);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		ServletContextTemplateResolver templateResolver = new ServletContextTemplateResolver(servletContext);
		templateResolver.setTemplateMode(TemplateMode.HTML);
		this.templateEngine = new TemplateEngine();
		this.templateEngine.setTemplateResolver(templateResolver);
		templateResolver.setSuffix(".html");
	}
	

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
        String loginpath = getServletContext().getContextPath() + "/index.html";
        HttpSession session = request.getSession();
        if (session.isNew() || session.getAttribute("user") == null) {
            response.sendRedirect(loginpath);
            return;
        }
        
        String path = "/WEB-INF/Vendo.html";
        
        User user = (User)session.getAttribute("user");
        int idUtente= user.getIdUtente();
        ArticoloDAO ArticoloDAO = new ArticoloDAO(connection);
        List<Articolo> articoliDaInserire = new ArrayList<>();
        try {
			articoliDaInserire=ArticoloDAO.getArticoliDisponibili(idUtente);
		} catch (SQLException e) {
			path = "/WEB-INF/ErrorPage.html";
			ServletContext servletContext = getServletContext();
			final WebContext ctx = new WebContext(request, response, servletContext, request.getLocale());
			ctx.setVariable("errorMsg", "Errore lato server");
			templateEngine.process(path, ctx, response.getWriter());
			return;
		}
        
        //Recupero lista di aste non chiuse create dall'utente
        AstaDAO ricercaAste = new AstaDAO(connection);
        List<Asta> asteNonChiuse = new ArrayList<>();
        try {
			asteNonChiuse = ricercaAste.findAsteNonChiuse(idUtente);
		} catch (SQLException e) {
			path = "/WEB-INF/ErrorPage.html";
			ServletContext servletContext = getServletContext();
			final WebContext ctx = new WebContext(request, response, servletContext, request.getLocale());
			ctx.setVariable("errorMsg", "Errore lato server");
			templateEngine.process(path, ctx, response.getWriter());
			return;
		}
        
       List<Long> ListaGiorniMancantiANC= new ArrayList<>();
       List<Long> ListaOreMancantiANC= new ArrayList<>();
       
       List<List<Articolo>> ListaArticoliA= new ArrayList<>();
       ListaArticoliDAO ListaArticoliDAO= new ListaArticoliDAO(connection);
       
       if(asteNonChiuse!=null) {
    	   for(Asta a: asteNonChiuse) {
    		   // Calcola la differenza di tempo in millisecondi
    		   long diffInMilliseconds = a.getDateExpiration().getTime() - user.getLoginTime().getTime();

    		   // Calcola la differenza in giorni e ore
    		   long diffInDays = TimeUnit.MILLISECONDS.toDays(diffInMilliseconds);
    		   long diffInHours = TimeUnit.MILLISECONDS.toHours(diffInMilliseconds) % 24;
    		   ListaGiorniMancantiANC.add(diffInDays);
    		   ListaOreMancantiANC.add(diffInHours);
    		   try {
    			   List<Integer> ListaarticoliID=ListaArticoliDAO.listaArticoli(a.getIdAsta());
    			   List<Articolo> ArticoliA= new ArrayList<>();
    			   for(int j=0; j<ListaarticoliID.size(); j++) {
    				   ArticoliA.add(ArticoloDAO.getArticoloById(ListaarticoliID.get(j)));
    			   }
    			   ListaArticoliA.add(ArticoliA);
    		   }catch (SQLException e) {
    			   path = "/WEB-INF/ErrorPage.html";
    			   ServletContext servletContext = getServletContext();
    			   final WebContext ctx = new WebContext(request, response, servletContext, request.getLocale());
    			   ctx.setVariable("errorMsg", "Errore lato server");
    			   templateEngine.process(path, ctx, response.getWriter());
    			   return;
    		   }	
    	   }
       }
        
        
        //Recupero lista di aste chiuse create dall'utente
        List<Asta> asteChiuse = new ArrayList<>();
        try {
			asteChiuse = ricercaAste.findAsteChiuse(idUtente);
		} catch (SQLException e) {
			path = "/WEB-INF/ErrorPage.html";
			ServletContext servletContext = getServletContext();
			final WebContext ctx = new WebContext(request, response, servletContext, request.getLocale());
			ctx.setVariable("errorMsg", "Errore lato server");
			templateEngine.process(path, ctx, response.getWriter());
			return;
		}
       
        List<List<Articolo>> ListaArticoliB= new ArrayList<>();
        
        if(asteChiuse!=null) {
        	for(Asta a: asteChiuse) {
        		try {
        			List<Integer> ListaarticoliID=ListaArticoliDAO.listaArticoli(a.getIdAsta());
        			List<Articolo> ArticoliB= new ArrayList<>();
        			for(int j=0; j<ListaarticoliID.size(); j++) {
        				ArticoliB.add(ArticoloDAO.getArticoloById(ListaarticoliID.get(j)));        		
        			}
        			ListaArticoliB.add(ArticoliB);
        		}catch (SQLException e) {
        			path = "/WEB-INF/ErrorPage.html";
        			ServletContext servletContext = getServletContext();
        			final WebContext ctx = new WebContext(request, response, servletContext, request.getLocale());
        			ctx.setVariable("errorMsg", "Errore lato server");
        			templateEngine.process(path, ctx, response.getWriter());
        			return;
        		}
         	
        	}
        }
        
		ServletContext servletContext = getServletContext();
		final WebContext ctx = new WebContext(request, response, servletContext, request.getLocale());
		ctx.setVariable("listaArticoli", articoliDaInserire);
		ctx.setVariable("asteNonChiuse", asteNonChiuse);
		ctx.setVariable("ListaGiorniMancantiANC", ListaGiorniMancantiANC);
		ctx.setVariable("ListaOreMancantiANC", ListaOreMancantiANC);
		ctx.setVariable("ListaArticoliA", ListaArticoliA);

		ctx.setVariable("asteChiuse", asteChiuse);
		ctx.setVariable("ListaArticoliB", ListaArticoliB);

		templateEngine.process(path, ctx, response.getWriter());
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
	
	public void destroy() {
		try {
			if (connection != null) {
				connection.close();
			}
		} catch (SQLException sqle) {
		}
	}

}

	

