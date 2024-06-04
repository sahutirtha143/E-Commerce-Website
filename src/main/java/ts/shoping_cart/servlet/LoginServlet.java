package ts.shoping_cart.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import ts.shoping_cart.connection.DbCon;
import ts.shoping_cart.dao.userDao;
import ts.shoping_cart.model.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import org.apache.catalina.connector.Response;

@WebServlet("/user-login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("login.jsp");
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		 PrintWriter out=response.getWriter();
		 
		 String email=request.getParameter("login-email");
		 String password=request.getParameter("login-password");
		 
		try {
			userDao udao=new userDao(DbCon.getConnection());
			user user1=udao.userLogin(email, password);
			
			
			if(user1 != null) {
				out.print("user signup sucessfully");
				request.getSession().setAttribute("auth", user1);
				response.sendRedirect("index.jsp");
			}
			else {
				out.print("user singnup failed");
			}
		} catch (ClassNotFoundException | SQLException e) {
			
			e.printStackTrace();
		}
		 
		/* out.print(email+password); */
	}

}
