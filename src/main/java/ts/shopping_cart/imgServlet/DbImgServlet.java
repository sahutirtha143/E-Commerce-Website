package ts.shopping_cart.imgServlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.ConnectException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

/*import com.mysql.cj.x.protobuf.MysqlxPrepare.Prepare;*/

@MultipartConfig
@WebServlet("/add-imgg")
public class DbImgServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DbImgServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 *
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
//		doGet(request, response);
		System.out.println("in do post method of Add Image Servlet");
		String name=request.getParameter("name");
		String category=request.getParameter("category");
		String price=request.getParameter("price");
		int p_price=Integer.parseInt(price);
		
		Part file=request.getPart("image");
		
		String imageFileName=file.getSubmittedFileName(); //GET SELECTED IMAGE FILE NAME
		System.out.println("Selected image file name: "+imageFileName);
		
		String uploadPath="C:/Users/user/eclipse-workspace/E_commerce/product_images/"+imageFileName; //UPLOAD PATH WHERE WE HAVE TO UPLOAD OUR ACTULA IMAGE
		System.out.print("Uploaded path"+uploadPath);
		
		//UPLOADED SELECTED IMAGE INTO OUR IMAGE FOLDER OF IMAGE TUTORIAL
		try {
			FileOutputStream fos=new FileOutputStream(uploadPath);
			InputStream is=file.getInputStream();
			
			byte[] data=new byte[is.available()];
			is.read(data);
			fos.write(data);
			fos.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		
		//GETTING DATABASE CONNECTION USING JDBC CODE
		Connection con=null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3307/e_commerce","root","2112");
			PreparedStatement pst;
			String query="insert into image(p_name,p_category,p_price,p_imgFileName) values(?,?,?,?)";
			pst=con.prepareStatement(query);
	
			pst.setString(1, name);
			pst.setString(2, category);
			pst.setInt(3, p_price);
			pst.setString(4, imageFileName);
			int row=pst.executeUpdate(); //IT RETURNS NO OF ROWS AFFECTED
			
			if(row>0) {
				System.out.println("Image added into the databases Sucessfully");
			}else {
				System.out.println("Failed to uploaded Image");
				
			}
			
			
			
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
	}

}