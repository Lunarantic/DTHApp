<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>

<html>
	<head>
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
		<meta charset="ISO-8859-1">
		<title>Login</title>
		<style>
			body{
				background-image: url("https://allhdwallpapers.com/wp-content/uploads/2016/07/Facets-4.jpg");
				background-size: cover;
				height: 100vh;
			}
			.main_section{
				height: 100%;
			}
			.login_section{
				background-color:rgba(255,255,255,0.5);
				border-radius: 5px;
				  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
				padding: 5% 5%;
			}
			.logo_img{
				text-align: center;
				margin-left: auto;
				margin-right: auto;
			}
			.logo_img img {
				width: 50%
			}
			
		</style>
	</head>
			
	<body>
		
		
		<div class="container main_section">
			<div class="row align-items-center" style="height: 100%;">
				<div class="col-4">
					<div class="login_section container-fluid">
						<div class="row logo_img justify-content-center">
							<img src="https://github.com/Lunarantic/DTHApp/raw/BuyPackagesFlow/WebContent/images/dthlogo2.png" />
						</div>	
						<div class="row login_form justify-content-center">
							<form action="./" method = "post">
								<!-- <label>Username</label>
								<input type = "text" name = "username">
								
								<br>
					
								<label>Password</label>
								<input type = "password" name = "password">
								
								<br>
								<input name="action" value="login" hidden>
								<button type = "submit">Submit</button>
								<button type = "reset">Reset</button> -->
								
								<div class="form-group">
									<label for="userNameInput">Username</label>
									<input type="text" name="username" class="form-control" id="userNameInput">
								</div>
								<div class="form-group">
									<label for="pwdInput">Password</label>
									<input type="password" name="password" class="form-control" id="pwdInput">
								 </div>
								 <input name="action" value="login" hidden>
								  <button type="submit" class="btn btn-primary">Submit</button>
								  <button type="reset" class="btn btn-outline-primary">Reset</button>
						 	</form>
						</div>
						
					</div>
				</div>
			</div>
		</div>
			
</body>
</html>
