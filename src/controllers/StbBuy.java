package controllers;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import pojo.StbBuyPojo;
import pojo.StbTypePojo;
import util.Cache;
import util.DatabaseUtil;

public class StbBuy {

	public static StbBuyPojo getStbBuyDetails(String fName, String lName, String stbType, String stbid) throws SQLException
	{
		PreparedStatement ps = null;
		//Connection con = null;
		ResultSet rs = null;
		
		String retailor = "select ReatailorId from customers where FirstName = 'dan' AND LastName = 'smith'";
		ps = DatabaseUtil.getConnection().prepareStatement(retailor);
		int retailorId = ps.executeUpdate();
		System.out.println(retailorId);
		
		String retailorCountStb = "select name from retailers where id = "+retailorId;
		ps = DatabaseUtil.getConnection().prepareStatement(retailorCountStb);
		int stbCount = ps.executeUpdate();
		System.out.println(stbCount);
		
		String query1="select FirstName, LastName from Customers where FirstName = 'dan' AND LastName = 'smith'";
		ps = DatabaseUtil.getConnection().prepareStatement(query1);
		
		rs = ps.executeQuery();
		
		String namef = null, namel = null, name;
		while(rs.next())
		{
			namef = rs.getString(1);
			namel = rs.getString(2);
		}
		
		name = namef.concat(namel);
		
		StbBuyPojo stbBuyPojo = new StbBuyPojo();
		
		//stbBuyPojo.setCustomerName(name);
		
		StbTypePojo stbTypePojo = Cache.get(stbid);
	//	stbTypePojo.setStbType("standard");
		String sType = stbTypePojo.getStbType();
	//	stbTypePojo.setPrice(4000);
		long sPrice = stbTypePojo.getPrice();
	//	stbTypePojo.setRefundableAmount(1000);
		long sDeposit = stbTypePojo.getRefundableAmount();
	//	stbTypePojo.setInstallationCharges(150);
		long sInstall = stbTypePojo.getInstallationCharges();
		
		String query3 = "select SerialNo, MACID from SETUPBOXINVENTORY where TypeID =1 AND Status = 0";
		ps = DatabaseUtil.getConnection().prepareStatement(query3);
		rs = ps.executeQuery();
		
		String serialNo = null, macid = null;
		
		if(rs.next())
		{
			serialNo = rs.getString(1);
			macid = rs.getString(2);
		}
		
		stbBuyPojo.setCustomerName(name);
		stbBuyPojo.setStbType(sType);
		stbBuyPojo.setStbMacId(macid);
		stbBuyPojo.setStbSerialNumber(serialNo);
		stbBuyPojo.setStbPrice(sPrice);
		stbBuyPojo.setInstallationCharge(sInstall);
		stbBuyPojo.setDeposit(sDeposit);
		
		String s1 = "Standard";
		String s2 = "High Definition (HD)";
		String s3 = "High Definition Recorder HD+";
		String s4 = "IPTV";
		long discount = 0;
		long tax = 0;
		long amount = 0;
		long tamount =0;
		
		if (stbType.equalsIgnoreCase(s1))
		{
			discount = (2/100) * sPrice;
			stbBuyPojo.setDiscount(discount);
			amount = (sPrice + sInstall + sDeposit - discount);
			tax = (12/100) * amount;
			stbBuyPojo.setTax(tax);
			tamount = tax + amount;
			stbBuyPojo.setAmountPayable(tamount);
		}
		else if(stbType.equalsIgnoreCase(s2))
		{
			discount = (long) ((2.2/100) * sPrice);
			stbBuyPojo.setDiscount(discount);
			amount = (sPrice + sInstall + sDeposit - discount);
			tax = (12/100) * amount;
			stbBuyPojo.setTax(tax);
			tamount = tax + amount;
			stbBuyPojo.setAmountPayable(tamount);
		}
		else if(stbType.equalsIgnoreCase(s3))
		{
			discount = (4/100) * sPrice;
			stbBuyPojo.setDiscount(discount);
			amount = (sPrice + sInstall + sDeposit - discount);
			tax = (12/100) * amount;
			stbBuyPojo.setTax(tax);
			tamount = tax + amount;
			stbBuyPojo.setAmountPayable(tamount);
		}
		else if(stbType.equalsIgnoreCase(s4))
		{
			discount = (10/100) * sPrice;
			stbBuyPojo.setDiscount(discount);
			amount = (sPrice + sInstall + sDeposit - discount);
			tax = (12/100) * amount;
			stbBuyPojo.setTax(tax);
			tamount = tax + amount;
			stbBuyPojo.setAmountPayable(tamount);
		}
		return stbBuyPojo;
	}
}
