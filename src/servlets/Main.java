package servlets;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.istack.internal.logging.Logger;

import controllers.LoginValidation;
import controllers.StbBuy;
import pojo.Customer;
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
				Logger.getLogger(Main.class).info("login success");
				serve("/jsp/login_success.jsp", request, response);
			} else {
				Logger.getLogger(Main.class).info("invalid creds");
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
				serve("/jsp/selectSTB.jsp", request, response);
			} else if (target.equals("buypkg")) {
				serve("/jsp/buypackage.jsp", request, response);
			} else if (target.equals("viewbills")) {
				serve("/jsp/viewbills.jsp", request, response);
			} else {
				serve("/jsp/login_success.jsp", request, response);
			}
		} else if (action.equals("buystb")) {
			serve("/jsp/buystb.jsp", request, response);
		} else if (action.equals("cnfstb")) {
			String amount = request.getParameter("amount");
			Customer cus = SessionStorage.getSession(request.getSession().getId());
			String stbid = request.getParameter("stbid");
			
			try {
				if (amount != null && cus != null && stbid != null && StbBuy.hasEnoughBalance(cus, Double.parseDouble(amount), Integer.parseInt(stbid))) {
					StbBuy.buySTBForCustomer(cus, Double.parseDouble(amount), Integer.parseInt(stbid));
					serve("/jsp/buy_stb_success.jsp", request, response);
				} else {
					serve("/jsp/not_enough_balance.jsp", request, response);
				}
			} catch (Exception e) {
				Logger.getLogger(Main.class).warning("selectSTB call rcvd");
				serve("/jsp/index.jsp", request, response);
			}
		} else if (action.equals("selectstb")) {
			Logger.getLogger(Main.class).info("selectSTB call rcvd");
			serve("/jsp/selectSTB.jsp", request, response);
		} else if (action.equals("logout")) {
			LoginValidation.logout(request, response);
			serve("/jsp/index.jsp", request, response);
		} else {
			serve("/jsp/index.jsp", request, response);
		}
	}
}


