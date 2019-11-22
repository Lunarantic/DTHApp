package controllers;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.sun.istack.internal.logging.Logger;

import pojo.Customer;
import pojo.StbBuyPojo;
import pojo.StbTypePojo;
import servlets.Main;
import util.Cache;
import util.DatabaseUtil;

public class StbBuy {

	public static StbBuyPojo getStbBuyDetails(Customer customer, Integer stbid) throws SQLException
	{
		double deposit = 0; // TODO
		
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		String query3 = "select serialno, macid, setupboxid"
				+ " from setupboxinventory"
				+ " where typeid=? and customerid is null and retailerid=?";
		ps = DatabaseUtil.getConnection().prepareStatement(query3);
		
		Logger.getLogger(StbBuy.class).info("retailer :: " + customer.getRetailerID());
		Logger.getLogger(StbBuy.class).info("customer :: " + customer.getId());
		Logger.getLogger(StbBuy.class).info("stbid :: " + stbid);
		
		ps.setInt(1, stbid);
		ps.setInt(2, customer.getRetailerID());
		
		rs = ps.executeQuery();

		StbBuyPojo stbBuyPojo = null;
		if(rs.next())
		{
			stbBuyPojo = new StbBuyPojo();
			stbBuyPojo.setStbSerialNumber(rs.getString(1));
			stbBuyPojo.setStbMacId(rs.getString(2));
			stbBuyPojo.setId(rs.getInt(3));
		} else {
			DatabaseUtil.close(rs, ps);
			return stbBuyPojo;
		}
		DatabaseUtil.close(rs, ps);
		
		StbTypePojo stbTypePojo = Cache.get(stbid);
		
		stbBuyPojo.setCustomerName(customer.getName());
		stbBuyPojo.setStbType(stbTypePojo.getStbType());
		stbBuyPojo.setTypePojo(stbTypePojo);
		
		String s1 = "Standard";
		String s2 = "High Definition (HD)";
		String s3 = "High Definition Recorder HD+";
		String s4 = "IPTV";
		double discount = 0;
		double tax = 0;
		double amount = 0;
		double tamount =0;
		
		if (stbTypePojo.getStbType().equalsIgnoreCase(s1))
		{
			amount = (stbTypePojo.getPrice() + stbTypePojo.getInstallationCharges() + deposit - discount);
			tax = (12/100.0) * amount;
			stbBuyPojo.setTax(tax);
			tamount = tax + amount;
			stbBuyPojo.setAmountPayable(tamount);
		}
		else if(stbTypePojo.getStbType().equalsIgnoreCase(s2))
		{
			amount = (stbTypePojo.getPrice() + stbTypePojo.getInstallationCharges() + deposit - discount);
			tax = (12/100.0) * amount;
			stbBuyPojo.setTax(tax);
			tamount = tax + amount;
			stbBuyPojo.setAmountPayable(tamount);
		}
		else if(stbTypePojo.getStbType().equalsIgnoreCase(s3))
		{
			amount = (stbTypePojo.getPrice() + stbTypePojo.getInstallationCharges() + deposit - discount);
			tax = (12/100.0) * amount;
			stbBuyPojo.setTax(tax);
			tamount = tax + amount;
			stbBuyPojo.setAmountPayable(tamount);
		}
		else if(stbTypePojo.getStbType().equalsIgnoreCase(s4))
		{
			amount = (stbTypePojo.getPrice() + stbTypePojo.getInstallationCharges() + deposit - discount);
			tax = (12/100.0) * amount;
			stbBuyPojo.setTax(tax);
			tamount = tax + amount;
			stbBuyPojo.setAmountPayable(tamount);
		}
		return stbBuyPojo;
	}
	
	public static boolean hasEnoughBalance(Customer cus, Double amount, Integer stbid) {
		Logger.getLogger(Main.class).info("cusID " + cus.getId());
		Logger.getLogger(Main.class).info("amount to check " + amount);
		
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		String query = "select amount from customers where customerid=?";
		try {
			ps = DatabaseUtil.getConnection().prepareStatement(query);
			ps.setInt(1, cus.getId());
			
			rs = ps.executeQuery();
			
			if (rs.next()) {
				cus.setAmount(rs.getDouble(1));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DatabaseUtil.close(rs, ps);
		}
		
		return cus.getAmount() >= amount;
	}
	
	public static boolean buySTBForCustomer(Customer cus, Double amount, Integer stbid) {
		Logger.getLogger(Main.class).info("Marking stb to buy " + stbid);
		
		PreparedStatement ps = null;
		
		String query = "update setupboxinventory set customerid=? where setupboxid=?"; 
		
		try {
			ps = DatabaseUtil.getConnection().prepareStatement(query);
			ps.setInt(1, cus.getId());
			ps.setInt(2, stbid);
			
			int update = ps.executeUpdate();
			
			if (update <= 0) return false;
			
			DatabaseUtil.close(null, ps);
			
			query =	"update customers set amount=? where customerid=?";
			ps = DatabaseUtil.getConnection().prepareStatement(query);
			ps.setDouble(1, (cus.getAmount()-amount));
			ps.setInt(2, cus.getId());
			
			update = ps.executeUpdate();
			
			if (update <= 0) return false; // TODO NULL the stb marked
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return true;
	}
}
