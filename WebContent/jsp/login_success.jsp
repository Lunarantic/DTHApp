<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    

<%@ page import="util.*, pojo.*" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Logged In</title>
	</head>
	<body>
		<%
		Customer user = null;
		String sessionID = null;
		Cookie[] cookies = request.getCookies();
		if(cookies !=null){
		for(Cookie cookie : cookies){
			if(cookie.getName().equals("JSESSIONID")) sessionID = cookie.getValue();
			user = SessionStorage.getSession(sessionID);
		}
		}
		if(user == null) response.sendRedirect("./");
		%>
		<h3>Hi <%=user.getName() %></h3>
		<br>
		<h3>Menu</h3>
		<form action="./" method="post">
			<input name="action" value ="home" hidden>
			<input name="target" value ="buystb" hidden>
			<button type="submit">Buy SetUpBox</button>
		</form>
		<form action="./" method="post">
			<input name="action" value ="home" hidden>
			<input name="target" value ="buypkg" hidden>
			<button type="submit">Buy Packages</button>
		</form>
		<form action="./" method="post">
			<input name="action" value ="home" hidden>
			<input name="target" value ="viewbills" hidden>
			<button type="submit">View Bills</button>
		</form>
		<form action="./" method="post">
			<input name="action" value ="logout" hidden>
			<button type="submit">Logout</button>
		</form>
	</body>
</html>