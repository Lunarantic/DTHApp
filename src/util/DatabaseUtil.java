package util;

import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import config.Config;

public class DatabaseUtil {

	public enum Check {
		TABLE, SEQUENCE;
	}
	
	static {
		try {
			Class.forName("oracle.jdbc.OracleDriver");
		} catch (ClassNotFoundException e) {
			System.err.println("Kindly provide Oracle JDBC jar to build path.");
		}
	}
	
	private static Connection connection = null;
	
	public static void setConnection() {
		try {
			connection = DriverManager.getConnection(Config.DBURL, Config.DBUSER, Config.PASSWORD);
		} catch (SQLException e) {
			System.err.println("Connection not formed.");
		}
	}
	
	public static void closeConnection() {
		if (connection != null) {
			try {
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			connection = null;
		}
	}
	
	public static boolean checkFor(Check checkFor, String name) {
		if (Checks.isEmpty(checkFor) || Checks.isEmpty(name)) return false;
		
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		try {
			switch (checkFor) {
				case TABLE:
					preparedStatement = connection.prepareStatement("select count(1) from user_tables"
														+ " where tablespace_name=? and table_name=?");
					break;
					
				case SEQUENCE:
					preparedStatement = connection.prepareStatement("select count(1) from dba_sequences"
														+ " where sequence_owner=? and sequence_name=?");
					break;

				default:
					break;
			}

			preparedStatement.setString(1, Config.DBUSER);
			preparedStatement.setString(2, name);
			
			resultSet = preparedStatement.executeQuery();
			resultSet.next();
			return resultSet.getInt(1) == 1;
		} catch (SQLException e) {
			System.err.println("Issue with preparedStatement.");
		} finally {
			DatabaseUtil.close(resultSet, preparedStatement);
		}
		
		return false;
	}
	
	public static void close(ResultSet resultSet, PreparedStatement preparedStatement) {
		try {
			if (resultSet != null) {
				resultSet.close();
				resultSet = null;
			}
			if (preparedStatement != null) {
				preparedStatement.close();
				preparedStatement = null;
			}
		} catch (SQLException e) {}
	}
	
	public static void createSequence(String sequenceName, Integer start, Integer incrementBy) {
		if (Checks.isEmpty(sequenceName) || checkFor(Check.SEQUENCE, sequenceName)) return;
		if (start == null) start = 1;
		if (incrementBy == null) start = 1;
		
		PreparedStatement preparedStatement = null;
		
		try {
			preparedStatement = connection.prepareStatement("CREATE SEQUENCE "
															+ sequenceName
															+ " START WITH "
															+ start
															+ " INCREMENT BY "
															+ incrementBy
															+ " NOCACHE NOCYCLE");
			preparedStatement.execute();
		} catch (SQLException e) {
			System.err.println("Issue with creating Sequence.");
			e.printStackTrace();
		} finally {
			DatabaseUtil.close(null, preparedStatement);
		}
	}
	
	public static void createTable(String tableName, String tableParameters) {
		if (Checks.isEmpty(tableName) || checkFor(Check.TABLE, tableName) || Checks.isEmpty(tableParameters))
			return;
		
		PreparedStatement preparedStatement = null;
		
		try {
			preparedStatement = connection.prepareStatement(tableParameters);
		} catch (SQLException e) {
			System.err.println("Issue with creating Table.");
		} finally {
			DatabaseUtil.close(null, preparedStatement);
		}
	}
	
	public static Connection getConnection() {
		return connection;
	}
	
	public static List<Object> getResultSet(String query, Object[] paras, Constructor<?> constructor) {
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<Object> parsedResultSet = null;
		
		try {
			ps = connection.prepareStatement(query);
			int i = 1;
			for (Object para: paras) {
				if (para instanceof String) ps.setString(i++, (String) para);
				else if (para instanceof Integer || para instanceof Long) ps.setLong(i++, (Long) para);
				else if (para instanceof Float || para instanceof Double) ps.setDouble(i++, (Double) para);
			}
			rs = ps.executeQuery();
			parsedResultSet = parseResultSet(rs, constructor);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rs, ps);
		}
		
		return parsedResultSet;
	}
	
	private static List<Object> parseResultSet(ResultSet resultSet, Constructor<?> constructor) throws SQLException,
	InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException,
	NoSuchMethodException, SecurityException {
		Class<?> cls[] = constructor.getParameterTypes();
		
		Object[] initargs;
		List<Object> res = new ArrayList<>(resultSet.getFetchSize());
		
		while (resultSet.next()) {
			initargs = new Object[cls.length];
			for (int j = 1; j <= cls.length; ++j) {
				initargs[j-1] = resultSet.getObject(j, cls[j-1]);
			}
			res.add(constructor.newInstance(initargs));
		}
		
		return res;
	}
}