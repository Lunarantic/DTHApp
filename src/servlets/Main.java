package servlets;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.DatabaseUtil;

public class Main extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
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
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		
		if (action == null) {
			request.getSession().getServletContext().getRequestDispatcher("/jsp/index.jsp").forward(request, response);
		} else if (action.equals("login")) {
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			
			if(username.isEmpty() || password.isEmpty()) {
				request.getSession().getServletContext().getRequestDispatcher("/jsp/index.jsp").forward(request, response);
			} else {
				Cookie loginCookie = new Cookie("username",username);
				loginCookie.setMaxAge(30*60); // 30 mins
				response.addCookie(loginCookie);
				request.getSession().getServletContext().getRequestDispatcher("/jsp/login_success.jsp").forward(request, response);
			}
		} else {
			request.getSession().getServletContext().getRequestDispatcher("/jsp/index.jsp").forward(request, response);
		}
	}
}


