package it.polimi.tiw.projects.controllers;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

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

import it.polimi.tiw.projects.beans.User;
import it.polimi.tiw.projects.beans.Articolo;
import it.polimi.tiw.projects.beans.Asta;
import it.polimi.tiw.projects.dao.ArticoloDAO;
import it.polimi.tiw.projects.dao.AstaDAO;
import it.polimi.tiw.projects.dao.ListaArticoliDAO;
import it.polimi.tiw.projects.dao.OffertaDAO;
import it.polimi.tiw.projects.dao.UserDAO;



@WebServlet("/goToPageAcquisto")
public class goToPageAcquisto extends HttpServlet{
	private static final long serialVersionUID = 1L;
	private TemplateEngine templateEngine;
	private Connection connection = null;
	private List<Asta> aste;
	
	public goToPageAcquisto() {
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
		this.aste=new ArrayList<>();
		
		ServletContextTemplateResolver templateResolver = new ServletContextTemplateResolver(servletContext);
		templateResolver.setTemplateMode(TemplateMode.HTML);
		this.templateEngine = new TemplateEngine();
		this.templateEngine.setTemplateResolver(templateResolver);
		templateResolver.setSuffix(".html");
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// If the user is not logged in (not present in session) redirect to the login
        String loginpath = getServletContext().getContextPath() + "/index.html";
        HttpSession session = request.getSession();
        if (session.isNew() || session.getAttribute("user") == null) {
            response.sendRedirect(loginpath);
            return;
        }
        //Ricerco offerte aggiudicate dall'utente
        //Utente in sessione
        User user= (User)session.getAttribute("user");
        int idUtente = user.getIdUtente();
        
        
        List<Asta> AstePotVinte= new ArrayList<>();
        AstaDAO AstaDAO= new AstaDAO(connection);
        
        //recupero Aste Potenzialmente vinte dall'utente in sessione
        try {
			AstePotVinte= AstaDAO.findAsteChiusePerAcquisto(idUtente);
		} catch (SQLException e) {
			String path = "/WEB-INF/ErrorPage.html";
			ServletContext servletContext = getServletContext();
			final WebContext ctx = new WebContext(request, response, servletContext, request.getLocale());
			ctx.setVariable("errorMsg", "Errore lato server");
			templateEngine.process(path, ctx, response.getWriter());
			return;
		}
        
        //recupero Aste vinte dall'utente in sessione
        List<Asta> AsteVinte= new ArrayList<>();
        OffertaDAO OffertaDAO= new OffertaDAO(connection);
        List<List<Articolo>> listaArticoli = new ArrayList<>();
        List<String> ListaCreatori= new ArrayList<>();

        if(AstePotVinte!=null) {
        	try {
        		AsteVinte= OffertaDAO.getAsteVinte(AstePotVinte,idUtente);
        	} catch (SQLException e) {
        		String path = "/WEB-INF/ErrorPage.html";
        		ServletContext servletContext = getServletContext();
        		final WebContext ctx = new WebContext(request, response, servletContext, request.getLocale());
        		ctx.setVariable("errorMsg", "Errore lato server");
        		templateEngine.process(path, ctx, response.getWriter());
        		return;
        	}
        
        	if(AsteVinte!=null) {
        		//recupero lista creatori delle aste vinte dall'utente
        		UserDAO uDAO= new UserDAO(connection); 
        		try {
        			for(int i=0; i<AsteVinte.size(); i++) {
        				User creator= new User();
        				creator= uDAO.getDetailsUtente(AsteVinte.get(i).getIdCreator());
        				ListaCreatori.add(creator.getUsername());
        			}
        		} catch (SQLException e) {
        			String path = "/WEB-INF/ErrorPage.html";
        			ServletContext servletContext = getServletContext();
        			final WebContext ctx = new WebContext(request, response, servletContext, request.getLocale());
        			ctx.setVariable("errorMsg", "Errore lato server");
        			templateEngine.process(path, ctx, response.getWriter());
        			return;
        		}
        
        		//Recupero le liste di Articoli per ogni asta
        		ListaArticoliDAO ListaArticoliDAO= new ListaArticoliDAO(connection);
        		ArticoloDAO ArticoloDAO= new ArticoloDAO(connection);
        		for(int i=0; i<AsteVinte.size(); i++) {
        			List<Integer> ArticoliID= new ArrayList<>();
        			try {
        				ArticoliID= ListaArticoliDAO.listaArticoli(AsteVinte.get(i).getIdAsta());
        				List<Articolo> listaAdAsta= new ArrayList<>();
        				for(int j=0; j< ArticoliID.size(); j++) {
        					listaAdAsta.add(ArticoloDAO.getArticoloById(ArticoliID.get(j)));
        				}
        				listaArticoli.add(listaAdAsta);
        			}catch (SQLException e) {
        				String path = "/WEB-INF/ErrorPage.html";
        				ServletContext servletContext = getServletContext();
        				final WebContext ctx = new WebContext(request, response, servletContext, request.getLocale());
        				ctx.setVariable("errorMsg", "Errore lato server");
        				templateEngine.process(path, ctx, response.getWriter());
        				return;
        			}
            
        		}
        	}
        }

        String path = "/WEB-INF/Acquisto.html";
		ServletContext servletContext = getServletContext();
		final WebContext ctx = new WebContext(request, response, servletContext, request.getLocale());
		ctx.setVariable("Asta", AsteVinte);
		ctx.setVariable("ListaCreatori", ListaCreatori);
		ctx.setVariable("ListaArticoli", listaArticoli);
		if(aste!=null) {
			ctx.setVariable("listaAste", this.aste);
		}
		templateEngine.process(path, ctx, response.getWriter());
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		//RicercaParolaChiave
		String loginpath = getServletContext().getContextPath() + "/index.html";
		String keyword = request.getParameter("keyword");
		HttpSession session = request.getSession();
		if (session.isNew() || session.getAttribute("user") == null) {
            response.sendRedirect(loginpath);
            return;
        }
		//Controllo che non manchino parametri
		if (keyword == null || keyword.isEmpty()) {
			String paginaPrecedente = request.getHeader("Referer");
			String requestURL = request.getRequestURL().toString(); // Restituisce l'URL completo della richiesta
		    String requestURI = request.getRequestURI(); // Restituisce l'URI della richiesta

		    // Ottenere la parte desiderata della stringa URL
		    int endIndex = requestURL.indexOf(requestURI);
		    String baseUrl = requestURL.substring(0, endIndex);
			if(paginaPrecedente.equals(baseUrl+getServletContext().getContextPath()+"/goToHomePage")) {
				String path = "/WEB-INF/ErrorPage.html";
				ServletContext servletContext = getServletContext();
				final WebContext ctx = new WebContext(request, response, servletContext, request.getLocale());
				ctx.setVariable("errorMsg", "Errore!");
				templateEngine.process(path, ctx, response.getWriter());
			}else {
				String path = "/WEB-INF/ErrorPage.html";
				ServletContext servletContext = getServletContext();
				final WebContext ctx = new WebContext(request, response, servletContext, request.getLocale());
				ctx.setVariable("errorMsg", "Errore inserimento parametri");
				templateEngine.process(path, ctx, response.getWriter());
			}
			return;
		}
		
		AstaDAO asteDisponibili = new AstaDAO(connection);
		List<Asta> a = null;
		try {
			User user= (User)session.getAttribute("user");
	        int idUtente= user.getIdUtente();
	        Date dataInizio = new Date();
			long data = dataInizio.getTime();
			Timestamp actualTime = new Timestamp(data);
			a = asteDisponibili.ricercaPerParolaChiave(keyword,idUtente, actualTime);
		} catch (SQLException e) {
			String path = "/WEB-INF/ErrorPage.html";
			ServletContext servletContext = getServletContext();
			final WebContext ctx = new WebContext(request, response, servletContext, request.getLocale());
			ctx.setVariable("errorMsg", "Errore lato server");
			templateEngine.process(path, ctx, response.getWriter());
			return;
		}
		this.aste=a;
		
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
