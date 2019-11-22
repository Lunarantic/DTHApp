package controllers;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

import util.DatabaseUtil;

public class PackageUtil {

	public List<List<String>> getDefualtPkgs() throws SQLException {
		List<List<String>> list = new ArrayList<>();
		
		String getDefaultSql = "select name, id, datefrom from packages";
		PreparedStatement st = DatabaseUtil.getConnection().prepareStatement(getDefaultSql);
		ResultSet rs = st.executeQuery();
		
		while(rs.next()) {
			List<String> curr = new ArrayList<>();
			curr.add(rs.getString(1));
			curr.add(rs.getString(2));
			curr.add(rs.getString(3));
			list.add(curr);
		}
		
		DatabaseUtil.close(rs, st);
		return list;
	}
	
	public List<List<String>> getChannels(String packageID) throws SQLException {
		List<List<String>> list = new ArrayList<>();
		
		String getDefaultSql = "select c.name, c.charge from channels c inner join packagechannels p on c.id = p.channelid where p.packageid=?";
		
		PreparedStatement st = DatabaseUtil.getConnection().prepareStatement(getDefaultSql);
		st.setString(1, packageID);
		
		ResultSet rs = st.executeQuery();
		
		while(rs.next()) {
			List<String> curr = new ArrayList<>();
			curr.add(rs.getString(1));
			curr.add(rs.getString(2));
			list.add(curr);
		}

		DatabaseUtil.close(rs, st);
		return list;
	}
	
	public void getAllPkgs(int type) {
		
	}
	
	public void purchasePkg(String pkg) {
		
	}
	
}
