package ts.shoping_cart.servlet;

import jakarta.servlet.ServletException;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import ts.shoping_cart.model.Cart;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

@WebServlet("/remove-from-cart")
public class RemoveFromCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = response.getWriter()) {
			String ids=request.getParameter("id");
//			out.print("id is: "+ids);
			if(ids != null) {
				ArrayList<Cart> cart_list = (ArrayList<Cart>) request.getSession().getAttribute("cart-list");
				if (cart_list != null) {
					for (Cart c : cart_list) {
						if (c.getId() == Integer.parseInt(ids)) {
							cart_list.remove(cart_list.indexOf(c));
							break;
						}
					}
					response.sendRedirect("cart.jsp");
				}
			}else {
				response.sendRedirect("cart.jsp");
			}
			
		}
		

	
	}
}
