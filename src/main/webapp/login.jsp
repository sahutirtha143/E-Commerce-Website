<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="ts.shoping_cart.model.*"%>
<%@page import="java.util.*"%>

<%
user auth = (user) request.getSession().getAttribute("auth");
if (auth != null) {
	response.sendRedirect("index.jsp");
}

ArrayList<Cart> cart_list=(ArrayList<Cart>) session.getAttribute("cart-list");
if(cart_list != null){
	request.setAttribute("cart_list", cart_list);
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login page</title>
<%@include file="includes/head.jsp"%>
<link rel="stylesheet" href="includes/style.css">
<style type="text/css">
.container {
	width: 80%;
}

.card {
	width: 50vw;
	margin-left: auto;
	margin-right: auto;
	margin-top: 10vh;
}

.card-header {
	text-align: center;
}

.btn-primary {
	margin-top: 10px;
}
</style>
</head>
<body>
	<%@include file="includes/navbar.jsp"%>
	<div class="container">
		<div class="card">
			<div class="card-header">User Login</div>

			<div class="card-body">
				<form action="user-login" method="post">
					<div class="form-group">
						<label>Email Address</label> <input type="email"
							class="form-control" name="login-email" required
							placeholder="Enter your email">
					</div>

					<div class="form-group">
						<label>Password</label> <input type="password"
							class="form-control" name="login-password" required
							placeholder="***********">
					</div>

					<div class="text-center">
						<button type="submit" class="btn btn-primary">Login</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<%@include file="includes/footer.jsp"%>
</body>
</html>