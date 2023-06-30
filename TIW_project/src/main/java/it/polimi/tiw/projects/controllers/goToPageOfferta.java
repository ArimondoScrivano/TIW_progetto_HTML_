package it.polimi.tiw.projects.controllers;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;
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

import it.polimi.tiw.projects.beans.Articolo;
import it.polimi.tiw.projects.beans.Asta;
import it.polimi.tiw.projects.beans.Offerta;
import it.polimi.tiw.projects.beans.User;
import it.polimi.tiw.projects.dao.ArticoloDAO;
import it.polimi.tiw.projects.dao.AstaDAO;
import it.polimi.tiw.projects.dao.ListaArticoliDAO;
import it.polimi.tiw.projects.dao.OffertaDAO;

@WebServlet("/goToPageOfferta")
public class goToPageOfferta extends HttpServlet{
	private static final long serialVersionUID = 1L;
	private TemplateEngine templateEngine;
	private Connection connection = null;
	
	

	public goToPageOfferta() {
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
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		doGet(request, response);		 
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
        
		String itemId = request.getParameter("id");
		if(itemId==null || itemId.isEmpty()) {
			String path = "/WEB-INF/ErrorPage.html";
			ServletContext servletContext = getServletContext();
			final WebContext ctx = new WebContext(request, response, servletContext, request.getLocale());
			ctx.setVariable("errorMsg", "Errore inserimento parametri");
			templateEngine.process(path, ctx, response.getWriter());
			return;
		}
		 
		int astaId=0;
		try {
			astaId=Integer.parseInt(itemId);
		}catch (NumberFormatException e) {
			String path = "/WEB-INF/ErrorPage.html";
			ServletContext servletContext = getServletContext();
			final WebContext ctx = new WebContext(request, response, servletContext, request.getLocale());
			ctx.setVariable("errorMsg", "Errore inserimento parametri");
			templateEngine.process(path, ctx, response.getWriter());
			return;
		}
		
	
		AstaDAO AstaDAO= new AstaDAO(connection);
		User user= (User)session.getAttribute("user");
        int idUtente= user.getIdUtente();
        try {
        	Asta a= AstaDAO.findAstaById(astaId);
        	if(a.getIdCreator()==idUtente || a.getState().equals("closed")) {
        		String path = "/WEB-INF/ErrorPage.html";
    			ServletContext servletContext = getServletContext();
    			final WebContext ctx = new WebContext(request, response, servletContext, request.getLocale());
    			ctx.setVariable("errorMsg", "Errore! Utente non autorizzato!");
    			templateEngine.process(path, ctx, response.getWriter());
    			return;
        	}
        }catch (SQLException e) {
        	String path = "/WEB-INF/ErrorPage.html";
			ServletContext servletContext = getServletContext();
			final WebContext ctx = new WebContext(request, response, servletContext, request.getLocale());
			ctx.setVariable("errorMsg", "Errore lato server");
			templateEngine.process(path, ctx, response.getWriter());
			return;
        }

		List<Articolo> ArticoliSelAsta= new ArrayList<>();
		List<Offerta> OffertaSelAsta= new ArrayList<>();
		try {
			//recuperiamo gli id di tutti gli articoli dell'asta cliccata
			ListaArticoliDAO listaArticoliDao= new ListaArticoliDAO(connection);
			List<Integer> listaArticoliID= new ArrayList<>();
			listaArticoliID.addAll(listaArticoliDao.listaArticoli(astaId));
			
			//recuperiamo tutti gli articoli dati i loro ID
			ArticoloDAO articoloDAO= new ArticoloDAO(connection);
			
			for(int i=0; i<listaArticoliID.size(); i++) {
				ArticoliSelAsta.add(articoloDAO.getArticoloById(listaArticoliID.get(i)));
			}
		
			//recuperiamo le offerte data quell'asta
			OffertaDAO OffertaDAO= new OffertaDAO(connection);
			try {
				OffertaSelAsta= OffertaDAO.getListOffertebyId(astaId);
			}catch (SQLException  e){
				String path = "/WEB-INF/ErrorPage.html";
				ServletContext servletContext = getServletContext();
				final WebContext ctx = new WebContext(request, response, servletContext, request.getLocale());
				ctx.setVariable("errorMsg", "Errore lato server");
				templateEngine.process(path, ctx, response.getWriter());
				return;
			}
			
			
		}catch (SQLException  e){
			String path = "/WEB-INF/ErrorPage.html";
			ServletContext servletContext = getServletContext();
			final WebContext ctx = new WebContext(request, response, servletContext, request.getLocale());
			ctx.setVariable("errorMsg", "Errore lato server");
			templateEngine.process(path, ctx, response.getWriter());
			return;
		}
		
        String path = "/WEB-INF/Offerta.html";
		ServletContext servletContext = getServletContext();
		final WebContext ctx = new WebContext(request, response, servletContext, request.getLocale());
		ctx.setVariable("articoli", ArticoliSelAsta);
		ctx.setVariable("idAsta",astaId);
		ctx.setVariable("offerte", OffertaSelAsta);
		templateEngine.process(path, ctx, response.getWriter());
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
