package src.queries;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import src.pojo.StbTypePojo;
import src.util.DatabaseUtil;

public class StbSearch {
	
	public static StbTypePojo getSTBType(String paymentType, String stbType) throws SQLException
	{
		
		
		String query = "select * from SetUpBoxTypesBox where billing=? AND stbtype=?";
		
		Object[] paras = new Object[2];
		
		paras[0] = paymentType;
		paras[1] = stbType;
		
		ResultSet resultSet = DatabaseUtil.getResultSet(query, paras);
		
		
		StbTypePojo stbTypePojo = new StbTypePojo();
		
		if(resultSet.next())
		{
			stbTypePojo.setStbType(resultSet.getString(2));
			stbTypePojo.setDimensions(resultSet.getString(4));
			stbTypePojo.setPrice(resultSet.getLong(5));
			stbTypePojo.setInstallationCharges(resultSet.getLong(6));
			stbTypePojo.setUpgradtionCharges(resultSet.getLong(7));
			stbTypePojo.setDiscount(resultSet.getLong(8));
			stbTypePojo.setBillingType(resultSet.getString(9));
			stbTypePojo.setRefundableAmount(resultSet.getLong(10));
		}
		
		return stbTypePojo;
		
	}
}