package controllers;

import java.sql.SQLException;
import java.util.List;

import pojo.StbTypePojo;
import util.Cache;
import util.DatabaseUtil;

public class StbSearch {
	
	public static StbTypePojo getSTBType(String paymentType, String stbType) throws SQLException
	{
		String query = "select * from SetUpBoxTypesBox where billingType=? AND stbtype=?";
		
		Object[] paras = new Object[2];
		paras[0] = paymentType;
		paras[1] = stbType;
		
		List<Object> resultSet = DatabaseUtil.getResultSet(query, paras, StbTypePojo.class.getConstructors()[0]);
		
		if (null != resultSet && resultSet.size() > 0) {
			StbTypePojo stbTypePojo = (StbTypePojo) resultSet.get(0);
			Cache.put(stbTypePojo);
			return stbTypePojo;
		}
		
		return null;
	}
}