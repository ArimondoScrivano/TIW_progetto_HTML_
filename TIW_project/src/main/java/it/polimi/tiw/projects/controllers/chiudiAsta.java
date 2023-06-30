package it.polimi.tiw.projects.controllers;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;

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

import it.polimi.tiw.projects.beans.Asta;
import it.polimi.tiw.projects.beans.User;
import it.polimi.tiw.projects.dao.AstaDAO;

@WebServlet("/chiudiAsta")
public class chiudiAsta extends HttpServlet{
	private static final long serialVersionUID = 1L;
	private TemplateEngine templateEngine;
	private Connection connection = null;
	
	

	public chiudiAsta() {
		super();
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
			e.printStackTrace();
		}
		try {
			connection = DriverManager.getConnection(url, user, password);
		} catch (SQLException e) {
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
		// If the user is not logged in (not present in session) redirect to the login
        String loginpath = getServletContext().getContextPath() + "/index.html";
        HttpSession session = request.getSession();
        if (session.isNew() || session.getAttribute("user") == null) {
            response.sendRedirect(loginpath);
            return;
        }
        //Utente in sessione
      	User user= (User)session.getAttribute("user");
        
      	String idAstaS = request.getParameter("idAsta");
		if(idAstaS==null || idAstaS.isEmpty()) {
			String path = "/WEB-INF/ErrorPage.html";
			ServletContext servletContext = getServletContext();
			final WebContext ctx = new WebContext(request, response, servletContext, request.getLocale());
			ctx.setVariable("errorMsg", "Errore: id asta non trovato!");
			templateEngine.process(path, ctx, response.getWriter());
			return;
		}
		
		//Recupero l'id dell'asta
		int astaId=0;
		try {
			astaId=Integer.parseInt(idAstaS);
		}catch (NumberFormatException e) {
			String path = "/WEB-INF/ErrorPage.html";
			ServletContext servletContext = getServletContext();
			final WebContext ctx = new WebContext(request, response, servletContext, request.getLocale());
			ctx.setVariable("errorMsg", "Errore parametri! Id asta deve essere un numero!");
			templateEngine.process(path, ctx, response.getWriter());
			return;
		}
		
		//Recupero data e ora attuale per controllo di chiusura
		Date dataInizio = new Date();
		long data = dataInizio.getTime();
		Timestamp RealTimeDate = new Timestamp(data);
		AstaDAO AstaDAO= new AstaDAO(connection);
		Asta a= new Asta();
		try {
			a= AstaDAO.findAstaById(astaId);
		}catch (SQLException e){
			String path = "/WEB-INF/ErrorPage.html";
			ServletContext servletContext = getServletContext();
			final WebContext ctx = new WebContext(request, response, servletContext, request.getLocale());
			ctx.setVariable("errorMsg", "Errore lato server");
			templateEngine.process(path, ctx, response.getWriter());
			return;
		}
		
		if(a.getDateExpiration().compareTo(RealTimeDate)<0 && user.getIdUtente()==a.getIdCreator()) {
			try {
				AstaDAO.updateStato(astaId);
			}catch (SQLException e) {
				String path = "/WEB-INF/ErrorPage.html";
				ServletContext servletContext = getServletContext();
				final WebContext ctx = new WebContext(request, response, servletContext, request.getLocale());
				ctx.setVariable("errorMsg", "Errore lato server");
				templateEngine.process(path, ctx, response.getWriter());
				return;
			}
			String parametro = idAstaS;
			String urlDestinazione = getServletContext().getContextPath()+"/goToDettaglioAsta?id=" + parametro;
			response.sendRedirect(urlDestinazione);
			return;
		}else {
			//Non è possibile chiudere l'asta
			String path = "/WEB-INF/ErrorPage.html";
			ServletContext servletContext = getServletContext();
			final WebContext ctx = new WebContext(request, response, servletContext, request.getLocale());
			ctx.setVariable("errorMsg", "Errore! Azione non autorizzata!");
			templateEngine.process(path, ctx, response.getWriter());
			return;
		}
		
		
		
		
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
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
