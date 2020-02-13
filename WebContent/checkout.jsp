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
<jsp:include page="topBanner.jsp" />
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