package ts.shoping_cart.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbCon {
	private static Connection con=null;
	
	public static Connection getConnection() throws ClassNotFoundException, SQLException{
		if(con==null) {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3307/e_commerce","root","2112");
			System.out.println("connected");
		}
		return con;
	}
}