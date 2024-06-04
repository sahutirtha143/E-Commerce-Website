package ts.shoping_cart.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import ts.shoping_cart.model.user;
public class userDao {
	private Connection con;
	private String query;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public userDao(Connection con) {
		this.con = con;
	}
	
	public user userLogin(String email,String password) {
		user us=null;
		try {
			query="select * from users where email=? and password=?";
			ps=this.con.prepareStatement(query);
			ps.setString(1,email);
			ps.setString(2, password);
			rs=ps.executeQuery();
			
			if (rs.next()) {
				us=new user();
				us.setId(rs.getInt("id"));
				us.setName(rs.getString("name"));
//				us.setEmail(rs.getString("email"));
//				us.setPassword(rs.getString("password"));
				
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.getStackTrace();
			System.out.println(e.getMessage());
		}
		
		return us;
	}

}
