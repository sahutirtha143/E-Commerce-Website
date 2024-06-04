package ts.shoping_cart.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import ts.shoping_cart.connection.DbCon;
import ts.shoping_cart.dao.OrderDao;
import ts.shoping_cart.model.Cart;
import ts.shoping_cart.model.Order;
import ts.shoping_cart.model.user;

import java.io.IOException;
import java.io.PrintWriter;
/*import java.sql.Date;*/
import java.text.SimpleDateFormat;
import java.util.*;

@WebServlet("/cart-check-out")
public class CheckOutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try (PrintWriter out = response.getWriter()) {
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			Date date = new Date(0, 0, 0);
			/* out.print("check out Servlet"); */

			// RETRIVE ALL CART PRODUCTS
			ArrayList<Cart> cart_list = (ArrayList<Cart>) request.getSession().getAttribute("cart-list");
			// USER AUTHENTICATION
			user auth = (user) request.getSession().getAttribute("auth");

			// CHECK AUTH OR CART LIST
			if (cart_list != null && auth != null) {
				for (Cart c : cart_list) {
					// PREPARE ORDER OBJECT
					Order order = new Order();
					order.setId(c.getId());
					order.setUid(auth.getId());
					order.setQuantity(c.getQuantity());
					order.setDate(formatter.format(date));

					// INSTANTIATE THE DAO CLASS
					OrderDao oDao = new OrderDao(DbCon.getConnection());
					boolean result = oDao.insertOrder(order);

					if (!result)
						break;
				}
				cart_list.clear();
				response.sendRedirect("orders.jsp");
			} else {
				if (auth == null) {
					response.sendRedirect("login.jsp");
				} else {
					response.sendRedirect("cart.jsp");
				}
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
