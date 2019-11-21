<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>

<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Login</title>
	</head>
			
	<body>
		<form action="./" method = "post">
		<link rel="stylesheet" type="text/css" href="./css/NewFile.css">
		 <h2>Infinity DTH Services</h2>
          <div class="header">
           <label for="uname"><b>Username</b></label>
            <input type="text" placeholder="Enter Username" name="uname" required>
            <label for="psw"><b>Password</b></label>
            <input type="password" placeholder="Enter Password" name="psw" required><br><br>
            <input name="action" value="login" hidden>
            <button type = "submit">Submit</button>
            <button type="reset">Reset</button>
           </div>
         <div class="container">
         <img src="./images/imagehd.png">
	
</div>	
</form>	
</body>
</html>
