<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page language="java" import="java.util.*, util.*, controllers.*" %>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	<meta charset="ISO-8859-1">
	<title>Purchase Channel Package</title>
</head>
<body>
	<div class="container">
	<br>
		<h1>Welcome Username</h1>
		<br>
		
		<div class="accordion" id="accordionExample" style="margin-left: auto; margin-right: auto;">
		<div class="card">
		    <div class="card-header" id="headingTwo">
		      <h2 class="mb-0">
		        <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
		          New Packages
		        </button>
		      </h2>
		    </div>
		    <div id="collapseTwo" class="collapse show" aria-labelledby="headingTwo" data-parent="#accordionExample">
		      <div class="card-body container">
		      
		      <div class="row mb-4">
			      
			      <div class="col-6" style="text-align: left">
			      	<div class="search-container">
						    <form action="">
						      <input type="text" placeholder="Search.." name="search">
						      <button type="submit"><i class="fa fa-search"></i></button>
						    </form>
						</div>
			      </div>
			      
			      <div class="col-6" style="text-align: right">
			      	im a cart
			      </div>
		      </div>
		      
		      	<div class="row">
		      		<% 
		      			PackageUtil pkg = new PackageUtil();
 		      			List<List<String>> packages = pkg.getDefualtPkgs();
 		      			System.out.println(packages.get(0).get(0));
 		      			int index = 0;
 		      			String[] bgColor = {"bg-primary", "bg-success", "bg-danger", "bg-warning", "bg-info", "bg-dark"};
 		      			while(index < packages.size()){
 		      				String pkgName = packages.get(index).get(0);
 		      				String pkgID = packages.get(index).get(1);
 		      				String pkgDate = packages.get(index).get(2);
 		      				String modalId = "modal" + index;
 		      				String modalLabelID = "modalLable" + index;
 		      				String dataTargetModal = "#modal" + index;
 		      				String bgCardColor = bgColor[index%6];
 		      				List<List<String>> channels = pkg.getChannels(pkgID);
 		      			
 		      		%> 
 		      		
 		      		<div class="col-4">
		      			<div class="card text-white <%= bgCardColor %> mb-3" type="button" class="btn btn-primary" data-toggle="modal" data-target=<%= dataTargetModal %> style="max-width: 18rem;">
						  <div class="card-body">
						    <h4 class="card-title"> <%= pkgName %></h4>
						  </div>
						</div>
						<div class="modal fade" id=<%=modalId  %> tabindex="-1" role="dialog" aria-labelledby=<%= modalLabelID %> aria-hidden="true">
						  <div class="modal-dialog modal-lg" role="document">
						    <div class="modal-content">
						      <div class="modal-header">
						        <h5 class="modal-title" id=<%= modalLabelID %>><%= pkgName %></h5>
						        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
						          <span aria-hidden="true">&times;</span>
						        </button>
						      </div>
						      <div class="modal-body">
						        <table class="table table-hover">
						        	<thead class="thead-dark">
									    <tr>
									      <th scope="col">Category</th>
									      <th scope="col">Channel</th>
									      <th scope="col">Purchased Date</th>
									      <th scope="col">Total Cost</th>
									    </tr>
									  </thead>
									  
									  <tbody>
									    <tr>
									      <td><%= pkgName %></td>
									      <td>
										      <table class="table table-borderless" style="text-align: left;">
										      <% 
											      int indexChannel = 0;
										      	  int totalPrice = 0;
											      while(indexChannel < channels.size()){
											    	  String channelName = channels.get(indexChannel).get(0);
											    	  String channelPrice = channels.get(indexChannel).get(1);
											    	  totalPrice = totalPrice + Integer.parseInt(channelPrice);
										      %>
										      <tr><td><%= channelName %></td><td>$<%= channelPrice %></td></tr>
										      <%
										      	  	  indexChannel++;
											      }
											      
											  %>

										      </table>
									      </td>
									      <td><%= pkgDate %></td>
									      <td>$<%= totalPrice %></td>
									    </tr>
									  </tbody>
						        </table>
						      </div>
						      <div class="modal-footer">
						        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancle</button>
						        <button type="button" class="btn btn-primary">Add to cart</button>
						      </div>
						    </div>
						  </div>
						</div>
		      		</div>
		      		
		      		<% 
		      		 	index++;
 		      			} %>
		      		
		      		
		 	
		      	</div>
		      </div>
		    </div>
		  </div>
		  
		  <div class="card">
		    <div class="card-header" id="headingOne">
		      <h2 class="mb-0">
		        <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
		          Purchased Packages
		        </button>
		      </h2>
		    </div>
		
		    <div id="collapseOne" class="collapse" aria-labelledby="headingOne" data-parent="#accordionExample">
		      <div class="card-body">
		      <table class="table table-hover">
				  <thead class="thead-dark">
				    <tr>
				      <th scope="col">Package Name</th>
				      <th scope="col">Category</th>
				      <th scope="col">Channel</th>
				      <th scope="col">Purchased Date</th>
				      <th scope="col">Total Cost</th>
				    </tr>
				  </thead>
				  <tbody>
				    <tr>
				      <th scope="row">Kids</th>
				      <td>Kids</td>
				      <td>
					      <table class="table" style="text-align: left;">
					      <tr><td>Cartoon Network</td><td>$50.00</td></tr>
					      <tr><td>Comedy Central</td><td>$40.00</td></tr>
					      <tr><td>Comedy Central</td><td>$40.00</td></tr>
					      <tr><td>Comedy Central</td><td>$40.00</td></tr>
					      </table>
				      </td>
				      <td>08-16-2019</td>
				      <td>100.00</td>
				    </tr>
				    
				    <tr>
				      <th scope="row">Kids</th>
				      <td>Kids</td>
				      <td>
					      <table class="table" style="text-align: left;">
					      <tr><td>Cartoon Network</td><td>$50.00</td></tr>
					      <tr><td>Comedy Central</td><td>$40.00</td></tr>
					      <tr><td>Comedy Central</td><td>$40.00</td></tr>
					      <tr><td>Comedy Central</td><td>$40.00</td></tr>
					      </table>
				      </td>
				      <td>08-16-2019</td>
				      <td>100.00</td>
				    </tr>
				  </tbody>
				</table>
		      </div>
		    </div>
		  </div>
		 
		 <div class="card">
		 	<form action="./" method="post">
				<input name="action" value ="home" hidden>
				<button type="submit">Back</button>
			</form>
		 </div>
		 
		</div>
	</div>
</body>
</html>