package controller;

import java.sql.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.DatabaseUtil;
import util.SessionStorage;

public class LoginValidation {
	
	private static boolean isValidUser(String username, String password) {
		
		String query = "Select count(1) from Customers where EmailId=? and Password=?";
		
		int count = 0;
		
		PreparedStatement ps = null;
		ResultSet resultSet = null;
		
		try {
			ps = DatabaseUtil.getConnection().prepareStatement(query);
			
			ps.setString(1, username);
			ps.setString(2, password);
			
			resultSet = ps.executeQuery();
			
			if (resultSet.next()) {
				count = resultSet.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		DatabaseUtil.close(resultSet, ps);
		
		return count == 1;
	}

	public static boolean checkValidUser(HttpServletRequest request, HttpServletResponse response) {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		if (username.isEmpty() || password.isEmpty() || !isValidUser(username, password)) {
			return false;
		} else {
			SessionStorage.storeSession(request.getSession().getId(), username);
			return true;
		}
	}
	
	public static void Logout(HttpServletRequest request, HttpServletResponse response) {
		String key = request.getSession().getId();
		SessionStorage.removeSession(key);
		request.getSession().invalidate();
	}
}
