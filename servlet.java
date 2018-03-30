package jsp;

import java.beans.Statement;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.servlet4preview.RequestDispatcher;

import sun.rmi.transport.Connection;

/**
 * Servlet implementation class servlet
 */
@WebServlet("/servlet")
public class servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		PrintWriter out= response.getWriter();
		Connection connection = null;
		Statement st = null;
		ResultSet rs = null;
		
		String username= request.getParameter("username");
		response.setContentType("text/html");
		
		try {
			Class.forName("com.mysql.jdbc.Driver");  //load db driver
			connection= (Connection) DriverManager.getConnection("jdbc:mysql://localhost/bookclub","root","\\&4+S:3<!'0!OsK");  //get a connection to db
			
			String que = "select fullname,dob,paddress,caddress,mobile,hphone,usertype from users where username='"+username+"'";  
			System.out.println(username);
			st = (Statement) ((java.sql.Connection) connection).createStatement();
			rs = ((java.sql.Statement) st).executeQuery(que);
			
			while(rs.next()) {
				request.setAttribute("fullname", rs.getString(1));
				request.setAttribute("dob", rs.getString(2));
				request.setAttribute("paddress", rs.getString(3));
				request.setAttribute("cadddress", rs.getString(4));
				request.setAttribute("hphone", rs.getString(5));
				request.setAttribute("usertype", rs.getString(6));
			
			}
			rs.close();
			((ResultSet) st).close();
			RequestDispatcher dispatcher = (RequestDispatcher) getServletContext().getRequestDispatcher("ViewUser.jsp");
			dispatcher.forward(request, response);
			
			
		}catch(Exception e) {
			System.out.println("Unable to connect db");
			
			
		}
	}
	public void destroy() {
	}

}
