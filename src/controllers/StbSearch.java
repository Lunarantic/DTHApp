package controllers;

import java.util.List;

import pojo.StbTypePojo;
import util.Cache;
import util.DatabaseUtil;

public class StbSearch {
	
	public static StbTypePojo getSTBType(String paymentType, String stbType)
	{
		String query = "select"
				+ " s.ID, stbtype, features,"
				+ " dimensions, price, installationCharges,"
				+ " upgrationCharges, discount, b.billingType,"
				+ " refundableAmount"
				+ " from SetUpBoxTypesBox s inner join billingtype b on s.billingType=b.id"
				+ " where b.billingType=? AND stbtype=?";
		
		Object[] paras = new Object[2];
		paras[0] = paymentType;
		paras[1] = stbType;
		
		List<Object> resultSet = DatabaseUtil.getResultSet(query, paras, StbTypePojo.class.getConstructors()[0]);
		
		if (null != resultSet && resultSet.size() > 0) {
			StbTypePojo stbTypePojo = (StbTypePojo) resultSet.get(0);
			if (stbTypePojo != null) {
				Cache.put(stbTypePojo);
				return stbTypePojo;
			}
		}
		
		return null;
	}
	
	public static StbTypePojo getSTBType(Integer stbid)
	{
		String query = "select"
				+ " s.ID, stbtype, features,"
				+ " dimensions, price, installationCharges,"
				+ " upgrationCharges, discount, b.billingType,"
				+ " refundableAmount"
				+ " from SetUpBoxTypesBox s inner join billingtype b on s.billingType=b.id"
				+ " where s.id=?";
		
		Object[] paras = new Object[2];
		paras[0] = stbid;
		
		List<Object> resultSet = DatabaseUtil.getResultSet(query, paras, StbTypePojo.class.getConstructors()[0]);
		
		if (null != resultSet && resultSet.size() > 0) {
			StbTypePojo stbTypePojo = (StbTypePojo) resultSet.get(0);
			if (stbTypePojo != null) {
				Cache.put(stbTypePojo);
				return stbTypePojo;
			}
		}
		
		return null;
	}
}