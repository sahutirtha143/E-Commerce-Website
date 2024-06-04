
<%@page import="java.util.*"%>
<%@page import="ts.shoping_cart.dao.productDao"%>
<%@page import="ts.shoping_cart.connection.DbCon"%>
<%@page import="ts.shoping_cart.model.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
user auth = (user) request.getSession().getAttribute("auth");
if (auth != null) {
	request.setAttribute("auth", auth);
}

productDao pd = new productDao(DbCon.getConnection());
List<product> products = pd.getAllProducts();

ArrayList<Cart> cart_list=(ArrayList<Cart>) session.getAttribute("cart-list");
if(cart_list != null){
	request.setAttribute("cart_list", cart_list);
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Wel-Come To Shopping cart</title>

<%@include file="includes/head.jsp"%>
<link rel="stylesheet" href="includes/style.css">
</head>
<body>
	<%@include file="includes/navbar.jsp"%>

	<%--  <% out.print(DbCon.getConnection()); %> --%>
	<div class="container">
		<div class="card-header my-3">All Products</div>
		<div class="row">
			<%
			if (!products.isEmpty()) {
				for (product p : products) {
			%>
			<div class="col-md-3 my-3 ">
				<div class="card w-100" style="width: 18rem;">
					<img class="card-img-top" src="product_images/<%=p.getImage() %>"
						alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title"><%=p.getName()%></h5>
						<h6 class="price"><%=p.getPrice() %></h6>
						<h6 class="category"><%=p.getCategory()%></h6>
						<div class="mt-3 d-flex justify-content-between">
							<a href="add-to-cart?id=<%= p.getId() %>" class="btn btn-dark">Add to Cart</a> 
							<a href="order-now?quantity=1&id=<%= p.getId() %>" class="btn btn-primary">Buy Now</a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			}
			%>


		</div>
	</div>


	<%@include file="includes/page-footer.jsp"%>
	<%@include file="includes/footer.jsp"%>
</body>
</html>