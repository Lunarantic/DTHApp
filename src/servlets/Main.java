package servlets;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controllers.PackageUtil;
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

	private void serve(String resource, HttpServletRequest request, HttpServletResponse response) {
		try {
			request.getSession().getServletContext().getRequestDispatcher(resource).forward(request, response);
		} catch (ServletException | IOException e) {
			e.printStackTrace();
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		
		if (action == null) {
			serve("/jsp/index.jsp", request, response);
		} else if (action.equals("login")) {
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			
			if(username.isEmpty() || password.isEmpty()) {
				serve("/jsp/index.jsp", request, response);
			} else {
				Cookie loginCookie = new Cookie("username",username);
				loginCookie.setMaxAge(30*60); // 30 mins
				response.addCookie(loginCookie);
				serve("/jsp/login_success.jsp", request, response);
			}
		} else if (action.equals("home")) {
			String target = request.getParameter("target");
			
			if (target == null) {
				serve("/jsp/login_success.jsp", request, response);
			} else if (target.equals("buystb")) {
				serve("/jsp/buystb.jsp", request, response);
			} else if (target.equals("buypkg")) {
				serve("/jsp/buypackage.jsp", request, response);
			} else if (target.equals("viewbills")) {
				serve("/jsp/viewbills.jsp", request, response);
			} else {
				serve("/jsp/login_success.jsp", request, response);
			}
		} else if (action.equals("buypkg")) {
			//
			System.out.println("ddd");
			String pkgID = request.getParameter("pkgID");
			String cusID = request.getParameter("cusID");
			System.out.println(pkgID);
			System.out.println(cusID);
			PackageUtil pkg = new PackageUtil();
			try {
				pkg.purchasePkg(pkgID, cusID);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			serve("/jsp/buypackage.jsp", request, response);
		} else if (action.equals("logout")) {
			serve("/jsp/index.jsp", request, response);
		} else {
			serve("/jsp/index.jsp", request, response);
		}
	}
}


