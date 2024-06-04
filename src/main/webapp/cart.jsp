<%-- <%@page import="java.text.DecimalFormat"%> --%>
<%@page import="ts.shoping_cart.connection.DbCon"%>
<%@page import="ts.shoping_cart.dao.productDao"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="ts.shoping_cart.model.*"%>

<%
/* DecimalFormat dcf=new DecimalFormat("#.##");
request.setAttribute("dcf",dcf);
 */
user auth = (user) request.getSession().getAttribute("auth");
if (auth != null) {
	request.setAttribute("auth", auth);

}

ArrayList<Cart> cart_list=(ArrayList<Cart>) session.getAttribute("cart-list");
List<Cart> cartProduct=null;

if(cart_list != null){
	productDao pDao=new productDao(DbCon.getConnection());
	cartProduct=pDao.getCartProducts(cart_list);
	request.setAttribute("cart_list", cart_list);
	
	double total=pDao.getTotalCartPrice(cart_list);
	request.setAttribute("total", total);
}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cart Page</title>
<%@include file="includes/head.jsp"%>
<link rel="stylesheet" href="includes/style.css">
<style type="text/css">

 .btn-incre{
  box-shadow: none;
  font-size: 20px;
 }
.form-input{
width: 30px;
}
.form-control{
width: 250px;
}
</style>
</head>
<body>
	<%@include file="includes/navbar.jsp"%>
	<div class="container" >
		<div class="d-flex py-3 px-3">
			<h3>Total Price: ${ total }</h3> 
			<%-- <h3>Total Price: ${ (total>0)?dcf.format(total):0 }</h3> --%>
			<a class="mx-3 btn btn-primary" href="cart-check-out">Check Out</a>
		</div>

		<table class="table table-lought">
			<thead>
				<tr>
					<th scope="col">Name</th>
					<th scope="col">Category</th>
					<th scope="col">Price</th>
					<th scope="col">Buy Now</th>
					<th scope="col">Cancel</th>
				</tr>
			</thead>

			<tbody>
			<%if(cart_list != null) {
				for(Cart c:cartProduct){ %>
					<tr>
					<td><%= c.getName() %></td>
					<td><%= c.getCategory() %></td>
					<td><%= c.getPrice() %></td>
					<td>
						<form action="order-now" method="post" class="form-inline">
							<input type="hidden" name="id" value="<%= c.getId() %>" class="form-input">
							<div class="form-group d-flex justify-content-between w-50">
							<a class="btn btn-sm btn-incre "
									href="quantity-inc-dec?action=dec&id=<%= c.getId()%>"><i class="fas fa-minus-square"></i> </a>
								<input type="text"
									name="quantity" class="form-control" value="<%= c.getQuantity() %>"
									readonly="readonly"> 
									<a class="btn btn-sm btn-incre " href="quantity-inc-dec?action=inc&id=<%= c.getId()%>"><i
									class="fas fa-plus-square"></i> </a> 
							    <button type="submit" class="btn btn-primary btn-sm" style="width:75px">Buy</button>
							</div>
						</form>
					</td>
					<td><a class="btn btn-sm btn-danger" href="remove-from-cart?id=<%= c.getId() %>">Remove</a></td>
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