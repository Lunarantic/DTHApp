package util;
import java.util.*;
 import java.sql.*;

public class AccountingUtil {

    public void deductbal(int custid) throws SQLException { 
    Scanner sc= new Scanner(System.in);
    System.out.println("Enter Customer id:");
    int Customerid=sc.nextInt();
   String query= "select amount from Customers where CustomerId=1";
    PreparedStatement st = null;
    st=DatabaseUtil.getConnection().prepareStatement(query);
    st.setInt(1,custid);
	ResultSet rs = null;
	rs=st.executeQuery();
	int amount=rs.getInt(1);
	System.out.println(amount);
    DatabaseUtil.close(rs,st);
    
}
    public void addbal(int amt) throws SQLException {
    	
    }
    
}
