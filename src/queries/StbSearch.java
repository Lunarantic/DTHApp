package queries;

import java.sql.SQLException;

import pojo.StbTypePojo;
import util.DatabaseUtil;

public class StbSearch {
	
	public static StbTypePojo getSTBType(String paymentType, String stbType) throws SQLException
	{
		String query = "select * from SetUpBoxTypesBox where billingType=? AND stbtype=?";
		
		Object[] paras = new Object[2];
		paras[0] = paymentType;
		paras[1] = stbType;
		
		Object[] resultSet = DatabaseUtil.getResultSet(query, paras, StbTypePojo.class.getConstructors()[0]);
		
		if (null != resultSet && resultSet.length > 0) {
			return ((StbTypePojo) resultSet[0]);
		}
		
		return null;
	}
}