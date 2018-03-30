package net.codejava.javaee;

import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/Registration")
public class Registration extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public Registration() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String fullname =request.getParameter("fullname");
			String DOB=request.getParameter("dob");
			String PA=request.getParameter("paddress");
			String CA=request.getParameter("caddress");
			String Mob=request.getParameter("mobile");
			String HT=request.getParameter("hometel");
			String UN=request.getParameter("un");
			String pwd = hashPassword(request.getParameter("pwd"));
			
			String sql ="insert into users(fullname,dob,paddress,caddress,mobile,hphone,username,password,usertype) values('"+fullname+"','"+DOB+"','"+PA+"','"+CA+"',"+Mob+","+HT+",'"+UN+"','"+pwd+"',0)";
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookclub","root","Glycer_123");
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.execute();
			response.sendRedirect("login.jsp");
			conn.close();
		}
		
		catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			response.sendRedirect("SignUP.jsp");

		}
		
		catch (SQLException e) {
			e.printStackTrace();
			response.sendRedirect("SignUP.jsp");

		}
				
	}
	
	final protected static char[] hexArray = "0123456789ABCDEF"
		    .toCharArray();

		public static String bytesToHex(byte[] bytes) {
		  char[] hexChars = new char[bytes.length * 2];
		  int v;
		  for (int j = 0; j < bytes.length; j++) {
		    v = bytes[j] & 0xFF;
		    hexChars[j * 2] = hexArray[v >>> 4];
		    hexChars[j * 2 + 1] = hexArray[v & 0x0F];
		  }
		  return new String(hexChars);
		}

		// Change this to something else.
		private static String SALT = "123456";

		// A password hashing method.
		public static String hashPassword(String in) {
		  try {
		    MessageDigest md = MessageDigest
		        .getInstance("SHA-256");
		    md.update(SALT.getBytes());        // <-- Prepend SALT.
		    md.update(in.getBytes());
		    // md.update(SALT.getBytes());     // <-- Or, append SALT.

		    byte[] out = md.digest();
		    return bytesToHex(out);            // <-- Return the Hex Hash.
		  } catch (NoSuchAlgorithmException e) {
		    e.printStackTrace();
		  }
		  return "";
		}

}