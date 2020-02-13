<%@ page import="java.util.*, example.shop.entity.*,example.shop.service.*" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/bootstrap/css/bootstrap.min.css">    
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>     
<script src="resources/bootstrap/js/bootstrap.min.js"></script>
<title>Items List</title>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
  <a class="navbar-brand" href="#">Shopping Cart</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/shop/help.jsp">Help</a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Option
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">Action</a>
          <a class="dropdown-item" href="#">Another action</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Something else here</a>
        </div>
      </li>
      <li class="nav-item">
        <a class="nav-link disabled" href="#">Disabled</a>
      </li>
    </ul>
	<form action="/shop/home" method="POST"
		class="form-inline my-2 my-lg-0">
		<input type="hidden" name="page" value="mycart">
		<button type="submit"
			class="btn btn-outline-success my-2 my-sm-0 btn-dark">MyCart</button>
	</form>
	<form class="form-inline my-2 my-lg-0">
      <button class="btn btn-outline-success my-2 my-sm-0 btn-dark" >${user.name}</button>
      <button class="btn btn-outline-danger my-2 my-sm-0 btn-dark"><a href = "/shop">Logout</a></button>
    </form>
  </div>
</nav>

	<%
		Cart cart = (Cart) session.getAttribute("cart");
		String cartSuccess = (String)request.getAttribute("cartSuccess");
		String loginSuccess = (String)request.getAttribute("loginSuccess");
		ItemService itemService = new ItemService();

		// If the user doesn't have a shopping cart yet, create one.
		if (cart == null) {
			cart = new Cart();
			session.setAttribute("cart", cart);
		}

		// Get the items from the cart.
		List<CartItem> items = cart.getItems();
		
	%>
	<br/>
	
	<div class="container">
		<div class="row">
			<div class="col-sm-12 col-md-10 col-md-offset-1">
			<% if (cartSuccess != null){ %> 
				<div class="alert alert-success" role="alert"><%= cartSuccess %></div>
			<% }%>
			<% if (loginSuccess != null){ %> 
				<div class="alert alert-success" role="alert"><%= loginSuccess %></div>
			<% }%>
			
			<form action ="/shop/home" method="post">
				<table class="table table-hover">
					<thead>
						<tr>
							<th>Select</th>
							<th>Product</th>
							<th>Quantity</th>
							<th>Price</th>
						</tr>
					</thead>
					<tbody>
						<%
							List<Product> productList = (List<Product>) request.getAttribute("productList");
							for (Product product : productList) {
								CartItem item = itemService.checkIfCartExists(product.getId(),items);
						%>
						<tr>
							<td ><input type="checkbox" name= "itemsChecked" value ="<%= product.getId() %>"
							<%if(item != null){%>checked<% }%>
							></td>
							<td ><a href="#"><%= product.getName() %></a></td>
							<td><input
								type="number" name ="quantity<%= product.getId() %>" class="form-control" id="exampleInputEmail1"
								<%
								int val = 0;
								if(item != null){ 
									val = item.getCartQuantity();
								}
								%>
								value ="<%= val %>">
							<td><strong>
								<% float x;
								if(item != null){
									x = item.getCartPrice(); 
									}
								else{
									x = product.getPrice();
								}
								%>
								<%= x%>
							</strong></td>
						</tr>
						<%
							}
						%>
						<tr>
							<td> 
							    <input type="hidden" name ="page" value="checkout">
							</td>
							<td> 
					            <button type="submit" class="btn btn-success btn-block" name="action" value= "addtocart">Add To Cart</button>
							</td>
							<td></td>
							<td>
					            <button type="submit" class="btn btn-success btn-block" name="action" value= "checkout">Checkout</button>
							</td>
						</tr>
					</tbody>
				</table>
				</form>
			</div>
		</div>
</body>
</html>