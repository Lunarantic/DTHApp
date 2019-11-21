package servlets;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.LoginValidation;
import util.DatabaseUtil;
import util.SessionStorage;

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
			if (SessionStorage.getSession(request.getSession().getId()) != null) {
				serve("/jsp/login_success.jsp", request, response);
			} else {
				serve("/jsp/index.jsp", request, response);
			}
		} else if (action.equals("login")) {
			if(LoginValidation.checkValidUser(request, response)) {
				serve("/jsp/login_success.jsp", request, response);
			} else {
				serve("/jsp/index.jsp", request, response);
			}
		} else if (SessionStorage.getSession(request.getSession().getId()) == null) {
			serve("/jsp/index.jsp", request, response);
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
		} else if (action.equals("logout")) {
			LoginValidation.Logout(request, response);
			serve("/jsp/index.jsp", request, response);
		} else {
			serve("/jsp/index.jsp", request, response);
		}
	}
}


