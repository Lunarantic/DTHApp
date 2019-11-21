package controllers;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

import util.DatabaseUtil;

public class PackageUtil {

	public List<List<String>> getDefualtPkgs() throws SQLException {
		List<List<String>> list = new ArrayList<>();
		String getDefaultSql = "select * from Packages";
		PreparedStatement st = DatabaseUtil.getConnection().prepareStatement(getDefaultSql);
		ResultSet rs = st.executeQuery();
		while(rs.next()) {
			List<String> curr = new ArrayList<>();
			curr.add(rs.getString("name"));
			curr.add(rs.getString("id"));
			curr.add(rs.getString("Datefrom"));
			list.add(curr);
		}
		DatabaseUtil.close(rs, st);
		return list;
	}
	
	public List<List<String>> getChannels(String packageID) throws SQLException {
		List<List<String>> list = new ArrayList<>();
		String getDefaultSql = "select * from PackageChannels where PackageID=?";
		PreparedStatement st = DatabaseUtil.getConnection().prepareStatement(getDefaultSql);
		st.setString(1, packageID);
		ResultSet rs = st.executeQuery();
		List<String> channels = new ArrayList<>();
		while(rs.next()) {
			channels.add(rs.getString("ChannelID"));
		}
		DatabaseUtil.close(rs, st);
		for(String channelID : channels) {
			String getChannelSql = "select * from Channels where id=? ";
			st = DatabaseUtil.getConnection().prepareStatement(getChannelSql);
			st.setString(1, channelID);
			ResultSet rsChannel = st.executeQuery();
			while(rsChannel.next()) {
					List<String> curr = new ArrayList<>();
					curr.add(rsChannel.getString("name"));
					curr.add(rsChannel.getString("charge"));
					list.add(curr);
				}
			DatabaseUtil.close(rsChannel, st);
		}
		
		return list;
	}
	public void getAllPkgs(int type) {
		
	}
	
	public void purchasePkg(String pkg) {
		
	}
	
}
