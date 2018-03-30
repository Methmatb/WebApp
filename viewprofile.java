package net.codejava.javaee;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class viewprofile
 */
@WebServlet("/viewprofile")
public class viewprofile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public viewprofile() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		response.setContentType("AdminView.jsp");
		PrintWriter out = response.getWriter();
		String fname,padd;
		String username,password;
		
		username = request.getParameter("username");
		String que = "select* from users where username='"+username+"'";
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost/bookclub", "root", "minoli16055");
			System.out.println("Connection established");
			
			PreparedStatement pst = con.prepareStatement(que);
			ResultSet rs = pst.executeQuery();
			System.out.println("data retrieved");
			
			while(rs.next()){
				fname=rs.getString(3);
				padd=rs.getString(5);
				
				username=rs.getString(1);
				password=rs.getString(2);
				
				request.setAttribute("fullname", fname);
				request.setAttribute("paddress", padd);
			
				request.setAttribute("username", username);
				request.setAttribute("password", password);
				
			}
			con.close();
		}catch(Exception e){
			System.out.println(e);
		}
	}

}
