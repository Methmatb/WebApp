<%@page language="java"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.*" %>
<%@page import="javax.servlet.*" %>
<%@ page session="true" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="Stylesheet" type="text/css" href="style/CSS.css" title="style">
 <link rel="stylesheet" href="bootstrap.min.css">

<style>

#title {

	width: 317px;

	margin-top: auto;

	margin-right: auto;

	margin-bottom: 40px;

	margin-left: auto;

}

.btn:hover
{
background-image:none;
background-color:Blue;
color:white;
}



body{
	background-image:url("Images/Login_Books.png");
	background-position:auto;
	background-size: 40%;
	background-repeat:no-repeat;
}

table{
  font-family: Verdana; 
  color:black; 
  font-size: 12pt; 
  font-style: normal;
  font-weight: bold;
  text-align:left; 
  border-collapse: collapse; 
}

</style>



<title>Edit Regular User Details</title>
</head>
<body>

<form method="post" action="UpdateRegularUser.jsp">


<div class="container-fluid">
	<center>
	<h2>Welcome to 4C Knowledge</h2>
	<h3> <b>Edit Your Profile</b></h3>
	</center>
	</div>

<table>
<br>
<tr><th>&nbsp;&nbsp; Full Name</th><th>&nbsp;&nbsp;Dob</th><th>&nbsp;&nbsp;Permanent Address</th><th>&nbsp;&nbsp;Current Address</th><th>&nbsp;&nbsp;Mobile</th><th>&nbsp;&nbsp;LandPhone</th></tr>
<%
String fname=request.getParameter("edit");

try {
	
	Class.forName("com.mysql.jdbc.Driver");  //load db driver
	Connection con= DriverManager.getConnection("jdbc:mysql://localhost/bookclub","root","Glycer_123");
	System.out.println("connection established");
	String sessionname = (String)session.getAttribute("username");
	System.out.println("sadsad");

	String query = "select * from users where username='"+sessionname+"'"; // **************************************
	PreparedStatement pst= con.prepareStatement(query);
	ResultSet rs= pst.executeQuery();
	System.out.println("data retrieved");


while(rs.next()){
%>
<tr  class="bg-info">
<td><input type="text" name="fname" value="<%=rs.getString("fullname")%>"></td>
<td><input type="text" name="dob" value="<%=rs.getString("dob")%>"></td>
<td><input type="text" name="padd" value="<%=rs.getString("paddress")%>"></td>
<td><input type="text" name="cadd" value="<%=rs.getString("caddress")%>"></td>
<td><input type="text" name="mob" value="<%=rs.getString("mobile")%>"></td>
<td><input type="text" name="phon" value="<%=rs.getString("hphone")%>"></td>
<td><input type="hidden" name="username" value="<%=rs.getString(1)%>"></td>
</tr>

<tr>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td><br><center><button class="btn warning" type="submit" name="Submit" value="Update"><b>Update Profile</b></button></center></td>
</tr>
<%
}
}
catch(Exception e){}
%>
</table>
<br>
<br>
<br>
</form>

</form>
<br>
<br>
<br>
<br>
<br>
<br>
</body>

</html>