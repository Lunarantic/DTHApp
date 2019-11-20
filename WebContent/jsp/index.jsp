<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>

<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Login</title>
	</head>
			
	<body>
		<form action="./main" method = "post">
			<label>Username</label>
			<input type = "text" name = "username">

			<br>

			<label>Password</label>
			<input type = "password" name = "password">
			
			<br>
			<input name="action" value="login" hidden>
			<button type = "submit">Submit</button>
			<button type = "reset">Reset</button>
		</form>
</body>
</html>
