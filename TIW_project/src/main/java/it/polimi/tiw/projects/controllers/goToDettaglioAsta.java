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

import it.polimi.tiw.projects.beans.Offerta;
import it.polimi.tiw.projects.beans.User;
import it.polimi.tiw.projects.beans.Asta;
import it.polimi.tiw.projects.dao.AstaDAO;
import it.polimi.tiw.projects.dao.UserDAO;
import it.polimi.tiw.projects.dao.OffertaDAO;

@WebServlet("/goToDettaglioAsta")
public class goToDettaglioAsta extends HttpServlet{
	private static final long serialVersionUID = 1L;
	private TemplateEngine templateEngine;
	private Connection connection = null;
	
	

	public goToDettaglioAsta() {
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
        //Utente in sessione
      	User user= (User)session.getAttribute("user");
        
		String idAstaS = request.getParameter("id");
		if(idAstaS==null || idAstaS.isEmpty()) {
			String path = "/WEB-INF/ErrorPage.html";
			ServletContext servletContext = getServletContext();
			final WebContext ctx = new WebContext(request, response, servletContext, request.getLocale());
			ctx.setVariable("errorMsg", "Errore inserimento parametri!");
			templateEngine.process(path, ctx, response.getWriter());
			return;
		}
		 
		int astaId=0;
		try {
			astaId=Integer.parseInt(idAstaS);
		}catch (NumberFormatException e) {
			String path = "/WEB-INF/ErrorPage.html";
			ServletContext servletContext = getServletContext();
			final WebContext ctx = new WebContext(request, response, servletContext, request.getLocale());
			ctx.setVariable("errorMsg", "Errore inserimento parametri!");
			templateEngine.process(path, ctx, response.getWriter());
			return;
		}
		
		//Controllo che il creatore dell'asta e asta id coincidano
		AstaDAO AstaDAO = new AstaDAO(connection);
		Asta asta = new Asta();
		try {
			asta=AstaDAO.findAstaById(astaId);
			if(asta.getIdCreator()!=user.getIdUtente()) {
				String path = "/WEB-INF/ErrorPage.html";
				ServletContext servletContext = getServletContext();
				final WebContext ctx = new WebContext(request, response, servletContext, request.getLocale());
				ctx.setVariable("errorMsg", "Errore! Utente non autorizzato!");
				templateEngine.process(path, ctx, response.getWriter());
				return;
			}
		} catch (SQLException e) {
			String path = "/WEB-INF/ErrorPage.html";
			ServletContext servletContext = getServletContext();
			final WebContext ctx = new WebContext(request, response, servletContext, request.getLocale());
			ctx.setVariable("errorMsg", "Errore lato server");
			templateEngine.process(path, ctx, response.getWriter());
			return;
		}
		
		OffertaDAO OffertaDAO = new OffertaDAO(connection);
		UserDAO UserDAO = new UserDAO(connection);
		if(asta.getState().equals("open")) {
			//asta aperta
			
			List<Offerta> listOfferte = new ArrayList<>();
			try {
				listOfferte=OffertaDAO.getListOffertebyId(astaId);
			} catch (SQLException e) {
				String path = "/WEB-INF/ErrorPage.html";
				ServletContext servletContext = getServletContext();
				final WebContext ctx = new WebContext(request, response, servletContext, request.getLocale());
				ctx.setVariable("errorMsg", "Errore lato server");
				templateEngine.process(path, ctx, response.getWriter());
				return;
			}
			//Recupero nome utente data l'offerta
			List<User> nomeUtenteOfferta = new ArrayList<>();
			
			if(listOfferte!=null) {
				for(Offerta o : listOfferte) {
				int idUtenteOfferta = o.getidUtente();
				User userOfferta = new User();
				try {
					userOfferta=UserDAO.getDetailsUtente(idUtenteOfferta);
					nomeUtenteOfferta.add(userOfferta);
				} catch (SQLException e) {
					String path = "/WEB-INF/ErrorPage.html";
					ServletContext servletContext = getServletContext();
					final WebContext ctx = new WebContext(request, response, servletContext, request.getLocale());
					ctx.setVariable("errorMsg", "Errore lato server");
					templateEngine.process(path, ctx, response.getWriter());
					return;
				}
				}
			}
			
			//Redirect alla pagina
			String path = "/WEB-INF/DettaglioAsta.html";
			ServletContext servletContext = getServletContext();
			final WebContext ctx = new WebContext(request, response, servletContext, request.getLocale());
			ctx.setVariable("asta", asta);
			ctx.setVariable("idAsta", asta.getIdAsta());
			ctx.setVariable("listOfferte", listOfferte);
			ctx.setVariable("nomeUtente",nomeUtenteOfferta);
			ctx.setVariable("nomeCreatore", user.getUsername());
			templateEngine.process(path, ctx, response.getWriter());
		}else {
						
			User U= new User();			
			try {
			
				U= UserDAO.getDetailsUtente(OffertaDAO.findidUtenteMaxOfferta(astaId));
			}catch (SQLException e) {
				String path = "/WEB-INF/ErrorPage.html";
				ServletContext servletContext = getServletContext();
				final WebContext ctx = new WebContext(request, response, servletContext, request.getLocale());
				ctx.setVariable("errorMsg", "Errore lato server");
				templateEngine.process(path, ctx, response.getWriter());
				return;
			}
			
			String path = "/WEB-INF/DettaglioAsta.html";
			ServletContext servletContext = getServletContext();
			final WebContext ctx = new WebContext(request, response, servletContext, request.getLocale());
			ctx.setVariable("asta", asta);
			ctx.setVariable("nomeCreatore", user.getUsername());
			
			if(U!=null) {
				ctx.setVariable("nomeAggiudicatario", U.getUsername());
				ctx.setVariable("indirizzoSpedizione", U.getShippingAddress());
				ctx.setVariable("prezzo", asta.getCurrentPrice());
			}else {
				ctx.setVariable("nomeAggiudicatario", "Nessuno");
				ctx.setVariable("indirizzoSpedizione", "Nessuno");
				ctx.setVariable("prezzo", "Non venduto");
			}
			templateEngine.process(path, ctx, response.getWriter());
		}
		
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
