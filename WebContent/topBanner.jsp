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
			<form action="/shop/home" method = "POST" class="form-inline my-2 my-lg-0">
				<button class="btn btn-outline-success my-2 my-sm-0 btn-dark">${user.name}</button>
				<input type="hidden" name="page" value="logout">
				<button class="btn btn-outline-danger my-2 my-sm-0 btn-dark" type ="submit">Logout</button>
			</form>
		</div>
	</nav>