<%@page import="java.sql.*" %>
<%@page import="javax.servlet.*" %>
<%@ page import="java.util.Date"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<title>Update user details</title>
</head>
<body>

<%
	String username=request.getParameter("username");
	String fname=request.getParameter("fname");
	String dob=request.getParameter("dob");
	String padd=request.getParameter("padd");
	String cadd=request.getParameter("cadd");
	String mob=request.getParameter("mob");
	String phon=request.getParameter("phon");
	String utype=request.getParameter("utype");
	
	try{
		Class.forName("com.mysql.jdbc.Driver");  //load db driver
		Connection con= DriverManager.getConnection("jdbc:mysql://localhost/bookclub","root","Glycer_123");
		System.out.println("connection established");
	
	Statement st=null;
	st=con.createStatement();
	
	st.executeUpdate("update users set fullname='"+fname+"',dob='"+dob+"',paddress='"+padd+"',caddress='"+cadd+"',mobile='"+mob+"',hphone='"+phon+"',usertype='"+utype+"' where username='"+username+"'");
	
	System.out.println("values added to database");

	response.sendRedirect("ViewRegularUser.jsp");
	}
	catch(Exception e){
	System.out.println(e);
    }
%>

</body>
</html>