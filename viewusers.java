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

/**
 * Servlet implementation class viewusers
 */
@WebServlet("/viewusers")
public class viewusers extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public viewusers() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		response.setContentType("AdminViewUsers.jsp");
		PrintWriter out = response.getWriter();
		try {
			
			String sql= "SELECT users.fullname,users.paddress,users.mobile,interests.interest FROM users INNER JOIN interests ON users.username=interests.username";
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/bookclub", "root", "minoli16055");
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			String str = "<table border=1 align=center><tr><th>Full Name</th><th>Permanant Address</th><th>Current Address</th><th>Residence Number</th><th>DOB</th><th>Mobile</th><th>Interests</th></tr>";
			while(rs.next()) {
				str += "<tr><td>"+rs.getString("fullname")+"</td><td>"+rs.getString("paddress")+"</td><td>"+rs.getString("caddress")+"</td><td>"+rs.getString("hphone")+"</td><td>"+rs.getString("dob")+"</td><td>"+rs.getString("mobile")+"</td><td>"+rs.getString("interest")+"</td><td><input type='button' action='hidden' method='post' value='Delete' id='\"+rs.getString(1)+\"'/></td></tr>";
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
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
