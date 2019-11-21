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
	
	public List<List<String>> getCustomerPkg(int customerID) throws SQLException {
		List<List<String>> list = new ArrayList<>();
		
		String sql = "select name, category, start_date, package_id"
				+ " from Packages p, PackageSales ps"
				+ " where ps.customer_id=? and p.id = ps.Package_id";
		
		PreparedStatement st = DatabaseUtil.getConnection().prepareStatement(sql);
		st.setInt(1, customerID);
		
		ResultSet rs = st.executeQuery();
		while(rs.next()) {
			List<String> pkg = new ArrayList<>();
			pkg.add(rs.getString(1));
			pkg.add(rs.getString(2));
			pkg.add(rs.getString(3));
			pkg.add(rs.getString(4));
			list.add(pkg);
		}
		
		DatabaseUtil.close(rs, st);
		return list;
		
	}
	
//	public void addToCart(String pkgID, String customerID) {
//		String sql = "select * from Packages p, PackageSales ps where ps.customer_id=? and p.id = ps.Package_id";
//		PreparedStatement st = DatabaseUtil.getConnection().prepareStatement(sql);
//		st.setInt(1, customerID);
//		ResultSet rs = st.executeQuery();
//		while(rs.next()) {
//			List<String> pkg = new ArrayList<>();
//			pkg.add(rs.getString("name"));
//			pkg.add(rs.getString("category"));
//			pkg.add(rs.getString("Start_date"));
//			pkg.add(rs.getString("Package_id"));
//			list.add(pkg);
//		}
//	}
	public void getAllPkgs(int type) {
		
	}
	
	public void purchasePkg(String pkgid, String cusid) throws SQLException {
		String sql = "select * from Packages p, PackageSales ps where ps.customer_id=? and p.id = ps.Package_id";
		PreparedStatement st = DatabaseUtil.getConnection().prepareStatement(sql);
		ResultSet rs = st.executeQuery();
	}
	
}
