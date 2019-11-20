<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import ="util.*, java.sql.*, queries.*, pojo.*" %>

<!DOCTYPE html>

<html>
	<head>
		<title>Select Set Top Box</title>
	</head>
	
	<body>
	<marquee dir="rtl"><i>Welcome to INFINTY DTH!!!</i></marquee>
	<br>
	<h3>Please select the payment method and the Set Top Box you wish to purchase:</h3>
	<br>
	
	<div>
	<form method = "get" action="/DTHServices/search">
	
	<table>
	<tr>
		<td>
		<select name = "paymentMethod">
		<option value = "Post Paid">Post Paid</option>
		<option value = "Pre Paid">Pre Paid</option>
		</select>
		</td>
	
		<td>
		<select name = "stbtype">
		<option value = Standard>Standard</option>
		<option value = "High Definition (HD)">High Definition</option>
		<option value = "High Definition Recorder HD+">High Definition Recorder Plus</option>
		<option value = "IPTV">IPTV</option>
		</select>
		</td>


		<td>
		<button type = "submit">Search</button>
		</td>
	</tr>
	</table>
	</form>
	</div>
	
	<%
	if (null != request.getParameter("paymentMethod") && null != request.getParameter("stbtype")) {
		StbTypePojo stbTypePojo = StbSearch.getSTBType(request.getParameter("paymentMethod"), request.getParameter("stbtype"));
		if (stbTypePojo != null) {
	%>
	<div>
	<table>
		<tr>
		<td>Set Top Box Type</td>
		<td><%= stbTypePojo.getStbType()%></td>
		</tr> 
		
		<tr>
		<td>Set Top Box Features</td>
		<td><%= stbTypePojo.getStbFeatures()%></td>
		</tr>
		
		<tr>
		<td>Dimensions (Length x Breadth x Width)</td>
		<td><%= stbTypePojo.getDimensions() %></td>
		</tr>
		
		<tr>
		<td>Price</td>
		<td><%= stbTypePojo.getPrice() %></td>
		</tr>
		
		<tr>
		<td>Installation Charges $</td>
		<td><%= stbTypePojo.getInstallationCharges() %></td>
		</tr>
		
		<tr>
		<td>Upgradation Charges $</td>
		<td><%= stbTypePojo.getUpgradtionCharges() %></td>
		</tr>
		
		<tr>
		<td>Discount %</td>
		<td><%= stbTypePojo.getDiscount() %></td>
		</tr>
		
		<tr>
		<td>Billing Type</td>
		<td><%= stbTypePojo.getBillingType() %></td>
		</tr>
		
		<tr>
		<td>Refundable Deposite Amount $</td>
		<td><%= stbTypePojo.getRefundableAmount() %></td>
		</tr>
		
	</table>
	</div>
	
	<% }
	} %>
	
	</body>
</html>