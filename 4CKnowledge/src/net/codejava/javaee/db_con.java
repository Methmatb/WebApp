package net.codejava.javaee;

import java.sql.DriverManager;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;


/**
 * Servlet implementation class db_con
 */
@WebServlet("/db_con")
public class db_con extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public db_con() {
        super();
        // TODO Auto-generated constructor stub
        java.sql.Connection conn = null;
        try{
        	Class.forName("com.mysql.jdbc.Driver");
        	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookclub","root","Glycer_123");
        	if(conn!=null){
        		System.out.println("Successfuly Connected");
        	}
        	}catch(Exception e){
        		System.out.println(e);
        	}
    }

}
