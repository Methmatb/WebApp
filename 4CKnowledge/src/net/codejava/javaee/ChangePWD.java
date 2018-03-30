package net.codejava.javaee;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ChangePWD
 */
@WebServlet("/ChangePWD")
public class ChangePWD extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangePWD() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	//	response.getWriter().append("Served at: ").append(request.getContextPath());
		response.setContentType("ChangePassword/jsp");
		//PrintWriter out = response.getWriter();
		String username=request.getParameter("username");
		String Newpass=request.getParameter("new");
		String conpass=request.getParameter("confirm");
		//String connurl = "jdbc:mysql://localhost:3306/bookclub";
		Connection con=null;
//		String pass="";
		String id="";
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookclub","root","Glycer_123");
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery("select * from users where username='"+username+"'");
		while(rs.next()){
			id=rs.getString(1);
	//		pass=rs.getString(2);
		} 
		if(username.equals(id) && Newpass.equals(conpass)){
			Statement st1=con.createStatement();
			st1.executeUpdate("update users set password='"+Newpass+"' where username='"+username+"'");
			System.out.println("Password changed successfully");
			st1.close();
			con.close();
		}
		else{
		 System.out.println("Your password and confirmation password do not match   OR   Invalid Username");
		}
		}
		catch(Exception e){
		System.out.println(e);
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