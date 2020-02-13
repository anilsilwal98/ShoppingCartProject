<%@ page import="java.util.*, example.shop.entity.*" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/bootstrap/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="resources/bootstrap/js/bootstrap.min.js"></script>
<title>Checkout</title>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
		<a class="navbar-brand" href="#">Shopping Cart</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link" href="#">Home
						<span class="sr-only">(current)</span>
				</a></li>
				
		     <li class="nav-item">
    		    <a class="nav-link" href="/shop/help.jsp">Help</a>
      		</li>
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> Option </a>
				<div class="dropdown-menu" aria-labelledby="navbarDropdown">
					<a class="dropdown-item" href="#">Action</a> <a
						class="dropdown-item" href="#">Another action</a>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="#">Something else here</a>
				</div></li>
				<li class="nav-item"><a class="nav-link disabled" href="#">Disabled</a>
				</li>
			</ul>
			<form action= "/shop/home" method= "POST" class="form-inline my-2 my-lg-0">
				<input type="hidden" name="page" value="mycart">
				<button  type="submit" class="btn btn-outline-success my-2 my-sm-0 btn-dark">MyCart</button>
			</form>
			<form class="form-inline my-2 my-lg-0">
				<button class="btn btn-outline-success my-2 my-sm-0 btn-dark">${user.name}</button>
				<button class="btn btn-outline-danger my-2 my-sm-0 btn-dark"><a href = "/shop">Logout</a></button>
			</form>
		</div>
	</nav>
	<div class="container">
		<div class="row">
			<div class="col-md-8">

	<%
		Cart cart = (Cart) session.getAttribute("cart");

		// If the user doesn't have a shopping cart yet, create one.
		if (cart == null) {
			cart = new Cart();
			session.setAttribute("cart", cart);
		}

		// Get the items from the cart.
		List<CartItem> items = cart.getItems();

		// If there are no items, tell the user that the cart is empty.
		if (items.size() == 0) {
			%><h3>Your shopping cart is empty.</h3>
			<% 
		} else {
		%>
				<table class="table table-responsive"> <h3>Cart Summary</h3>
					<thead>
						<tr>
							<th>Product Name</th>
							<th>Quantity</th>
							<th>Price</th>
						</tr>
					</thead>
					<tbody>
						<%
							for (CartItem item : items) {
						%>
						<tr>
							<td><%=item.getName()%></td>
							<td><%=item.getCartQuantity()%></td>
							<td><%=item.getCartPrice()%></td>
						</tr>
						<%
							}
						%>
						<tr>
							<td>Total</td>
							<td></td>
							<td>${cart.getTotal()}</td>
						</tr>
						<tr>
							<td><input type="hidden" name="page" value="billing">
							</td>
							<td></td>
							<td>
								<button type="submit" class="btn btn-success btn-block">Proceed To Billing</button>
							</td>
						</tr>
					</tbody>
				</table>
			<%
				}
			%>
			</div>
			</div>
			</div>
		
</body>
</html>