<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page import ="util.*, java.sql.*, controllers.*, pojo.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Buy STB</title>
</head>
	
<body>
	<div>
		<p>
		<h3>Please check the details before buying</h3>
		</p>
	</div>
	
	<br>
	<form action="./" method="post">
	<div>
		
		<table>
			<%
			StbBuyPojo stbBuyPojo = StbBuy.getStbBuyDetails(SessionStorage.getSession(request.getSession().getId()), Integer.parseInt(request.getParameter("stbid")));
			if (stbBuyPojo != null) {
			%>
				<tr>
					<td><label>Customer Name</label></td> 
					<td><input type="text" disabled="disabled" value="<%= stbBuyPojo.getCustomerName()%>"></td>
				</tr>
				
				<tr>
					<td><label>Set Top Box Type</label></td> 
					<td><input type="text" disabled="disabled" value = "<%= stbBuyPojo.getStbType()%>"> </td>
				</tr>
				
				<tr>
					<td><label>Set Top Box MAC ID</label></td> 
					<td><input type="text" disabled="disabled" value = "<%= stbBuyPojo.getStbMacId()%>"></td>
				</tr>
				
				<tr>
					<td><label>Set Top Box Serial Number</label></td> 
					<td><input type="text" disabled="disabled" value = "<%= stbBuyPojo.getStbSerialNumber()%>"></td>
				</tr>
				
				<tr>
					<td><label>Set Top Box Price</label></td> 
					<td><input type="text" disabled="disabled" value = "<%= stbBuyPojo.getTypePojo().getPrice() %>"></td>
				</tr>
				
				<tr>
					<td><label>Installation Charge</label></td> 
					<td><input type="text" disabled="disabled" value = "<%= stbBuyPojo.getTypePojo().getInstallationCharges() %>"></td>
				</tr>
				
				<tr>
					<td><label>Deposit</label></td> 
					<td><input type="text" disabled="disabled" value = "<%= stbBuyPojo.getDeposit()%>"></td>
				</tr>
				
				<tr>
					<td><label>Discount</label></td> 
					<td><input type="text" disabled="disabled" value = "<%= stbBuyPojo.getTypePojo().getDiscount()%>"></td>
				</tr>
				
				<tr>
					<td><label>Tax</label></td> 
					<td><input type="text" disabled="disabled" value = "<%= stbBuyPojo.getTax()%>"></td>
				</tr>
				
				<tr>
					<td><label>Amount Payable</label></td> 
					<td><input type="text" disabled="disabled" value = "<%= stbBuyPojo.getAmountPayable()%>"></td>
				</tr>
			</table>
		</div>
		
		<br> 
		
		<div>
			<input name="amount" value="<%= stbBuyPojo.getAmountPayable() %>" hidden>
			<input name="action" value ="cnfstb" hidden>
			<input name="stbid" value="<%= stbBuyPojo.getTypePojo().getId() %>" hidden>
			<button type = "submit">Confirm</button>
		</div>
	</form>
	<% } else {%>
		<h1>Out of Stock</h1>
	<%} %>
	<form action="./" method="post">
		<input name="action" value ="home" hidden>
		<button type="submit">Back</button>
	</form>
</body>
</html>