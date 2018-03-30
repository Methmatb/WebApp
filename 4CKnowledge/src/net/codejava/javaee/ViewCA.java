package net.codejava.javaee;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/ViewCA")
public class ViewCA extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public ViewCA() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		response.setContentType("View_ComAdmin/jsp");
		PrintWriter out = response.getWriter();
		try {
			
			String sql= "select fullname,paddress,mobile from users";
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookclub","root","Glycer_123");
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			String str = "<table border=1><tr><th>Full Name</th><th><Permanant Address</th><th>Mobile</th><th>Interests</th></tr>";
			while(rs.next()) {
				str += "<tr><td>"+rs.getString(1)+"</td><td>\"+rs.getString(2)+\"</td><td>\"+rs.getString(3)+\"</td><td>\"+rs.getString(4)+\"</td></tr>";
				
			}
			str += "</table>";
			out.println(str);
			conn.close();
		} 
		 
		catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		catch (SQLException e) {
			e.printStackTrace();
		}
		
		finally {
			out.close();
		}
	}

	 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}