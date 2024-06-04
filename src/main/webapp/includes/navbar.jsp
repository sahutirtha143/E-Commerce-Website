
<nav class="navbar navbar-expand-lg navbar-light bg-light" style="background:linear-gradient(90deg, #ff9c15, #47915b);">
		<div class="container-fluid" style="margin-left: 1rem;">
			<a class="navbar-brand" href="index.jsp" style="font-size: 25px; font-weight: 700;">GroUL</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarSupportedContent" style="font-weight: 700;">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="index.jsp">Home</a></li>
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="products.jsp">Products</a></li>
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="#section2">Category</a></li>
					<li class="nav-item"><a class="nav-link" href="cart.jsp">Cart <span class="badge badge-danger" style="color:red">${ cart_list.size() }</span></a></li>
					
					<% if( auth != null){ %>
						<li class="nav-item"><a class="nav-link" href="orders.jsp">Orders</a></li>
						<li class="nav-item"><a class="nav-link" href="log-out">Logout</a></li>
				<% 	}else{ %>
						<li class="nav-item"><a class="nav-link" href="login.jsp">Login</a></li>
					<% }
					%>
					
				
					
					
				</ul>
				<form class="d-flex" style="margin-right: 1rem;">
					<input class="form-control me-2" type="search" placeholder="Search"
						aria-label="Search">
					<button class="btn btn-outline-success" type="submit">Search</button>
				</form> 
			</div>
		</div>
	</nav>