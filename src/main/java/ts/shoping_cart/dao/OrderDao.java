package ts.shoping_cart.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

//import ts.shoping_cart.model.Order;
import ts.shoping_cart.model.*;

public class OrderDao {
	private Connection con;
	private String query;
	private PreparedStatement ps;
	private ResultSet rs;

	public OrderDao(Connection con) {
		this.con = con;
	}

	public boolean insertOrder(Order model) {
		boolean result = false;

		try {
			query = "insert into orders(p_id,u_id,o_quantity,o_date) values(?,?,?,?)";

			ps = this.con.prepareStatement(query);
			ps.setInt(1, model.getId());
			ps.setInt(2, model.getUid());
			ps.setInt(3, model.getQuantity());
			ps.setString(4, model.getDate());
			ps.executeUpdate();
			result = true;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}
//DYNAMICALLY DATA FETCHED IN THE ORDER PAGE
	public List<Order> userOrders(int id) {
		List<Order> list = new ArrayList<Order>();

		try {
			query = "select * from orders where u_id=? order by orders.o_id desc";
			ps = this.con.prepareStatement(query);

			ps.setInt(1, id);
			rs = ps.executeQuery();

			while (rs.next()) {
				Order order = new Order();
				productDao pDao = new productDao(this.con);
				int pId = rs.getInt("p_id");
//			 int pId=rs.getInt("id"); 

				product pd = pDao.getSingleProduct(pId);
				order.setOrderId(rs.getInt("o_id")); 		
				order.setId(pId);
				order.setName(pd.getName());
				order.setCategory(pd.getCategory());
				order.setPrice(pd.getPrice() * rs.getInt("o_quantity"));
				order.setQuantity(rs.getInt("o_quantity"));
				order.setDate(rs.getString("o_date"));
				list.add(order);
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return list;
	}
	
	public void cancelOrder(int id) {
		try {
			query="delete from orders where o_id=?";
			ps=this.con.prepareStatement(query);
			ps.setInt(1, id);
			ps.execute();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

}
