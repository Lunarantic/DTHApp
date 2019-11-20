package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import util.DatabaseUtil;

public class Main extends HttpServlet {
	private static final long serialVersionUID = 1L;
//	private static final String username = "Rahul";
//	private static final String password = "journaldev";
    
    public Main() {
        super();
    }

	public void init(ServletConfig config) throws ServletException {
		DatabaseUtil.setConnection();
	}

	public void destroy() {
		DatabaseUtil.closeConnection();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		if(username.isEmpty() || password.isEmpty() )
		{
//			RequestDispatcher req = request.getRequestDispatcher("login.jsp");
//			System.out.println("No username");
//			req.include(request, response);
//			HttpSession session = request.getSession();
//			session.setAttribute("username", username);
			RequestDispatcher req = request.getRequestDispatcher("./");
			System.out.println("No username");
			req.forward(request, response);
		}
		else
		{
			Cookie loginCookie = new Cookie("username",username);
			//setting cookie to expiry in 30 mins
			loginCookie.setMaxAge(30*60);
			System.out.println("Login Success");
			response.addCookie(loginCookie);
			response.sendRedirect("./welcome");
		}
	}
}


