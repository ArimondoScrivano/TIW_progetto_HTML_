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
import it.polimi.tiw.projects.dao.OffertaDAO;


@WebServlet("/checkOfferta")
public class checkOfferta extends HttpServlet{
	private static final long serialVersionUID = 1L;
	private TemplateEngine templateEngine;
	private Connection connection = null;
	
	

	public checkOfferta() {
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
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			connection = DriverManager.getConnection(url, user, password);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		this.templateEngine = new TemplateEngine();
		ServletContextTemplateResolver templateResolver = new ServletContextTemplateResolver(servletContext);
		templateResolver.setTemplateMode(TemplateMode.HTML);
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
      
		//ok, controlli superati
		String prezzoOfferta = request.getParameter("offerta");
		String idAstaS= request.getParameter("idAsta");
		if(prezzoOfferta.isEmpty() || prezzoOfferta==null || idAstaS.isEmpty() || idAstaS==null ) {
			String path = "/WEB-INF/ErrorPage.html";
			ServletContext servletContext = getServletContext();
			final WebContext ctx = new WebContext(request, response, servletContext, request.getLocale());
			ctx.setVariable("errorMsg", "Errore inserimento parametri");
			templateEngine.process(path, ctx, response.getWriter());
			return;
		}
		
		double prezzoOff=0.0;
		int idAsta=0;
		try {
			idAsta=Integer.parseInt(idAstaS);
			prezzoOff= Double.parseDouble(prezzoOfferta);
		}catch(NumberFormatException e) {
			String path = "/WEB-INF/ErrorPage.html";
			ServletContext servletContext = getServletContext();
			final WebContext ctx = new WebContext(request, response, servletContext, request.getLocale());
			ctx.setVariable("errorMsg", "Errore inserimento parametri! Numero richiesto!");
			templateEngine.process(path, ctx, response.getWriter());
			return;
		}
		
		//controllo validità offerta
		AstaDAO AstaDAO= new AstaDAO(connection);
		Asta a= new Asta();
		try {
			a= AstaDAO.findAstaById(idAsta);
		} catch (SQLException e) {
			String path = "/WEB-INF/ErrorPage.html";
			ServletContext servletContext = getServletContext();
			final WebContext ctx = new WebContext(request, response, servletContext, request.getLocale());
			ctx.setVariable("errorMsg", "Errore lato server");
			templateEngine.process(path, ctx, response.getWriter());
			return;
		}
      
      
		//insufficient price
		if(prezzoOff < (a.getCurrentPrice()+ a.getMinimumIncrease())) {
			String path = "/WEB-INF/ErrorPage.html";
			ServletContext servletContext = getServletContext();
			final WebContext ctx = new WebContext(request, response, servletContext, request.getLocale());
			ctx.setVariable("errorMsg", "Prezzo troppo basso!");
			templateEngine.process(path, ctx, response.getWriter());
			return;
		}
		
		OffertaDAO OffertaDAO= new OffertaDAO(connection);
		try {
			Date dataExpiration = new Date();
			long data = dataExpiration.getTime();
			Timestamp actualTime = new Timestamp(data);
		
			//Utente che crea l'offerta
  			User user= (User)session.getAttribute("user");
  	        int idUtente= user.getIdUtente();
  	      if(idUtente!=a.getIdCreator()) {
	        	OffertaDAO.createNewOfferta(idAsta, idUtente, prezzoOff , actualTime);
	        }else {
	        	String path = "/WEB-INF/ErrorPage.html";
				ServletContext servletContext = getServletContext();
				final WebContext ctx = new WebContext(request, response, servletContext, request.getLocale());
				ctx.setVariable("errorMsg", "Non puoi offrire per la tua asta!");
				templateEngine.process(path, ctx, response.getWriter());
				return;
	        }
		}catch(SQLException e) {
			String path = "/WEB-INF/ErrorPage.html";
			ServletContext servletContext = getServletContext();
			final WebContext ctx = new WebContext(request, response, servletContext, request.getLocale());
			ctx.setVariable("errorMsg", "Errore lato server");
			templateEngine.process(path, ctx, response.getWriter());
			return;
		} 
		String parametro = idAstaS;
		String urlDestinazione = getServletContext().getContextPath()+"/goToPageOfferta?id=" + parametro;
		response.sendRedirect(urlDestinazione);
     
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
