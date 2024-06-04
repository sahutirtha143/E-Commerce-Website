<%@page import="ts.shoping_cart.connection.DbCon"%>
<%@page import="ts.shoping_cart.dao.productDao"%>
<%@page import="ts.shoping_cart.dao.OrderDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="ts.shoping_cart.model.*"%>
<%@page import="java.util.*"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.text.DecimalFormat"%>

<%
DecimalFormat dcf=new DecimalFormat("#.##");
request.setAttribute("dcf",dcf);

LocalDate today=LocalDate.now();
LocalDate after5days=today.plusDays(5);

user auth = (user) request.getSession().getAttribute("auth");
List<Order> orders=null;
if (auth != null) {
	request.setAttribute("auth", auth);
	 orders=new OrderDao(DbCon.getConnection()).userOrders(auth.getId());
}else{
	
	response.sendRedirect("login.jsp");
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
<title>Order Page</title>
<%@include file="includes/head.jsp"%>
<link rel="stylesheet" href="includes/style.css">
<style type="text/css">

tbody{ 
height: 10vh;
}
</style>
</head>
<body>
	<%@include file="includes/navbar.jsp"%>
	<div class="container">
		<div class="card-header my-3">All Orders</div>
		<table class="table table-light">
			<thead>
				<tr>
					<th scope="col">Date</th>
					<th scope="col">Name</th>
					<th scope="col">Category</th>
					<th scope="col">Quantity</th>
					<th scope="col">Price</th>
				
					<th scope="col">Address</th>
				
					<th scope="col">Delivery Date</th>
					
					<th scope="col">Cancel</th>
				</tr>
			</thead>
			<tbody>
			<%
			if(orders != null){
				for(Order o:orders){%>
				<tr>
				<td><%=o.getDate() %></td>
				<td><%=o.getName() %></td>
				<td><%=o.getCategory() %></td>
				<td><%=o.getQuantity() %></td>
				<td><%=o.getPrice() %></td>
			
				<td><%= auth.getName()+ auth.getName()+ auth.getName()%></td>
			
				<td><%= after5days %></td> 
				<td> <a class="btn btn-sm btn-danger" href="cancel-order?id=<%=o.getOrderId() %>">Cancel</a> </td>
				</tr>	
				<% }
			}
			%>
			</tbody>
		</table>
	</div>

	<%@include file="includes/footer.jsp"%>
</body>
</html>