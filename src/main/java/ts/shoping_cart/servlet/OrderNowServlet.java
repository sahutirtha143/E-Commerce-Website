
package ts.shoping_cart.servlet;

import jakarta.servlet.ServletException;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.*;

import ts.shoping_cart.connection.DbCon;
import ts.shoping_cart.dao.OrderDao;
//import com.mysql.cj.x.protobuf.MysqlxCrud.Order;
import ts.shoping_cart.model.*;

@WebServlet("/order-now")
public class OrderNowServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try (PrintWriter out = response.getWriter()) {
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			Date date = new Date(0, 0, 0);
			out.print("this buy now servlet");

			user auth = (user) request.getSession().getAttribute("auth");
			if (auth != null) {
				String productId = request.getParameter("id");
				String productQuan = request.getParameter("quantity");
				int productQuantity = Integer.parseInt(productQuan);
				if (productQuantity <= 0) {
					productQuantity = 1;
				}
				
				Order orderModel=new Order();
				orderModel.setId(Integer.parseInt(productId));
				orderModel.setUid(auth.getId());
				orderModel.setQuantity(productQuantity);
				orderModel.setDate(formatter.format(date));
				
				OrderDao orderdao=new OrderDao(DbCon.getConnection());
				Boolean result= orderdao.insertOrder(orderModel);
				
				if(result) {
					ArrayList<Cart> cart_list = (ArrayList<Cart>) request.getSession().getAttribute("cart-list");
					if (cart_list != null) {
						for (Cart c : cart_list) {
							if (c.getId() == Integer.parseInt(productId)) {
								cart_list.remove(cart_list.indexOf(c));
								break;
							}
						}
					}
					response.sendRedirect("orders.jsp");
				}else {
					out.print("order failed");
				}
				
				
			} else {
				response.sendRedirect("login.jsp");
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
