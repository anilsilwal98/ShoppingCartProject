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
<jsp:include page="topBanner.jsp" />

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