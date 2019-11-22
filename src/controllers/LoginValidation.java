package controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.istack.internal.logging.Logger;

import pojo.Customer;
import util.DatabaseUtil;
import util.SessionStorage;

public class LoginValidation {
	
	private static Customer isValidUser(String username, String password) {
		
		
		String query = "Select * from Customers where EmailId=? and Password=?";
		Object[] paras = new Object[2];
		paras[0] = username;
		paras[1] = password;
		
		List<Object> custs = DatabaseUtil.getResultSet(query, paras, Customer.class.getConstructors()[0]);
		
		if (custs != null && custs.size() > 0) {
			return ((Customer) custs.get(0));
		}
		
		return null;
	}

	public static boolean checkValidUser(HttpServletRequest request, HttpServletResponse response) {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		Logger.getLogger(LoginValidation.class).info("username >> " + username);
		Logger.getLogger(LoginValidation.class).info("password >> " + password);
		
		Customer customer = null;
		
		if (username.isEmpty() || password.isEmpty() || (customer = isValidUser(username, password)) == null) {
			return false;
		} else {
			SessionStorage.storeSession(request.getSession().getId(), customer);
			return true;
		}
	}
	
	public static void logout(HttpServletRequest request, HttpServletResponse response) {
		String key = request.getSession().getId();
		SessionStorage.removeSession(key);
		request.getSession().invalidate();
	}
}
