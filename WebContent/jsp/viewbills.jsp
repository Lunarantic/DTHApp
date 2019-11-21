<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Bills</title>
<style type="text/css">
	body {
	font: 'Raleway', sans-serif;
    color: rgba(0,0,0,.5);
    text-align: center;
    text-transform: uppercase;
    letter-spacing: .5em;
    top: 15%;
	background: linear-gradient(to right, red , yellow); /* Standard syntax */
}

h1 {
    font: 600 3.5em 'Raleway', sans-serif;
    color: rgba(0,0,0,.5);
    text-align: center;
    text-transform: uppercase;
    letter-spacing: .5em;
    width: 100%;
}

h3 {
	font: 900 1em 'Raleway', sans-serif;
    color: rgba(0,0,0,.5);
    text-align: center;
    text-transform: none;
    letter-spacing: 0.01em;

}

div.dotted {
	outline-color: black;
	outline-style: dotted;
	weight: 100px;
	height: auto;
	padding: 20px;
}


*[contenteditable] {
	 border-radius: 0.25em; 
	 min-width: 1em; 
	 outline: 0; 
}

*[contenteditable] {
	cursor: pointer; 
}

*[contenteditable]:hover, *[contenteditable]:focus, td:hover *[contenteditable], td:focus *[contenteditable], img.hover {
	background: #DEF; 
	box-shadow: 0 0 1em 0.5em #DEF; 
}

span[contenteditable] { display: inline-block; }

	
</style>
</head>
	<body id="gradient">
		<div class="dotted"> 

			<div>
				<h1>DTH Infinity</h1>
				<h2>Final Bill</h2>	
			</div>
			
				<table class="meta">
				<tr>
					<th><span contenteditable>Customer ID#</span></th>
					<td><span contenteditable>101138</span></td>
				</tr>
				<tr>
					<th><span contenteditable>Date</span></th>
					<td><span contenteditable>January 1, 2020</span></td>
				</tr>
				<tr>
					<th><span contenteditable>Amount Due</span></th>
					<td><span id="prefix" contenteditable>$ 600.00</span></td>
				</tr>
			</table>
			<div>
				<p> Name: </p>
			</div>			
		
		</div>
	
		
	<!-- Don't remove form tag -->
	<br></br>
	<form action="./" method="post">
		<input name="action" value ="home" hidden>
		<button type="submit">Back</button>
		<button onclick="myFunction()">Print Bill</button>
	</form>
	
	<script>
		var css = document.querySelector("h3");
		var color1 = document.querySelector(".color1");
		var color2 = document.querySelector(".color2");
		var body = document.getElementById("gradient");

		function setGradient() {
			body.style.background = 
			"linear-gradient(to right, " 
			+ color1.value 
			+ ", " 
			+ color2.value 
			+ ")";

			css.textContent = body.style.background + ";";
		}

		color1.addEventListener("input", setGradient);

		color2.addEventListener("input", setGradient);
		
		function myFunction() {
			  window.print();
			}
		</script>
	
	</body>
</html>




