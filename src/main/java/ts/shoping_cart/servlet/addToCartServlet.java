package ts.shoping_cart.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import ts.shoping_cart.model.Cart;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.NumberFormat.Style;
import java.util.ArrayList;

@WebServlet("/add-to-cart")

public class addToCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html	");
//		response.setContentType("text/html; charset=UTF-8");
		try(PrintWriter out=response.getWriter()){
			ArrayList<Cart> cartList=new ArrayList<>();
			int id=Integer.parseInt(request.getParameter("id"));
			Cart cm=new Cart();
			cm.setId(id);
			cm.setQuantity(1);
			
			HttpSession session=request.getSession();
			ArrayList<Cart> cart_list=(ArrayList<Cart>) session.getAttribute("cart-list");
			
			if(cart_list==null) {
				cartList.add(cm);
				session.setAttribute("cart-list", cartList);
//				out.print("session is created and added to list");
				response.sendRedirect("index.jsp");
			}
			else {
				cartList=cart_list;
				boolean exist=false;
				
				for(Cart c:cart_list) {
					if(c.getId()==id) {
						exist=true;
						out.print("<h3 Style:'color:blue; text-align:center'>Item already exist.<a href='cart.jsp'>Go to cart</a> </h3>");
					}
				}
				if(!exist) {
					cartList.add(cm);
//					out.print("product added");
					response.sendRedirect("index.jsp");
				}
				
			}
		}
		
	}

}
