package ts.shoping_cart.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import ts.shoping_cart.model.Cart;
import ts.shoping_cart.model.product;

public class productDao {
	private Connection con;
	private String query;
	private PreparedStatement ps;
	private ResultSet rs;

	public productDao(Connection con) {
		this.con = con;
	}

	// DYNAMICALLY UPLOAD IMAGE FROM THE DATABASES INTO THE INDEX.JSP PAGE
	public List<product> getAllProducts() {
		List<product> products = new ArrayList<product>();

		try {
			query = "select * from image";
			ps = this.con.prepareStatement(query);
			rs = ps.executeQuery();

			while (rs.next()) {
				product row = new product();
				row.setId(rs.getInt("p_id"));
				row.setName(rs.getString("p_name"));
				row.setCategory(rs.getString("p_category"));
				row.setPrice(rs.getDouble("p_price"));
				row.setImage(rs.getString("p_imgFileName"));

				products.add(row);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return products;
	}

	//WHEN CLICK ADD TO CART BUTTON DYNAMICALLY DATA FATCH IN  CART.JSP PAGE
	public List<Cart> getCartProducts(ArrayList<Cart> cartList) {
		List<Cart> products = new ArrayList<Cart>();

		try {
			if (cartList.size() > 0) {
				for (Cart item : cartList) {
					query = "select * from products where id=?";
					ps = this.con.prepareStatement(query);
					ps.setInt(1, item.getId());
					rs = ps.executeQuery();

					while (rs.next()) {
						Cart row = new Cart();
						row.setId(rs.getInt("id"));
						row.setName(rs.getString("name"));
						row.setCategory(rs.getString("category"));
						row.setPrice(rs.getDouble("price") * item.getQuantity());
						row.setQuantity(item.getQuantity());
						products.add(row);
					}
				}
			}
		} catch (Exception e) {
			System.out.print(e.getMessage());
			e.printStackTrace();
		}
		return products;
	}

	//THIS CODE IS USED IN THE ORDERDAO.JAVA PAGE
	public product getSingleProduct(int id) {
		product row = null;
		try {
			query = "select * from image where p_id=?";
			ps = this.con.prepareStatement(query);
			ps.setInt(1, id);
			rs = ps.executeQuery();

			while (rs.next()) {
				row = new product();
				row.setId(rs.getInt("p_id"));
				row.setName(rs.getString("p_name"));
				row.setCategory(rs.getString("p_category"));
				row.setPrice(rs.getDouble("p_price"));
				row.setImage(rs.getString("p_imgFileName"));
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return row;
	}

	// GET TOTAL PRICE AT THE CART PAGE NEW CHECK-OUT BUTTON
	public double getTotalCartPrice(ArrayList<Cart> cartList) {
		double sum = 0;

		try {
			if (cartList.size() > 0) {
				for (Cart item : cartList) {
					query = "select p_price from image where  p_id=?";
					ps = this.con.prepareStatement(query);
					ps.setInt(1, item.getId());
					rs = ps.executeQuery();

					while (rs.next()) {
						sum += rs.getDouble("p_price") * item.getQuantity();
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return sum;
	}

}
