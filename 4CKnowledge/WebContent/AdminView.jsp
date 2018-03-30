<%@page import="java.sql.*" %>
<%@page import="javax.servlet.*" %>
<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>AdminViewProfile</title>
<style>
form{
	font-weight: bold;
	font-size:20;
}
body{
	background-image:url("Images/Login_Books.png");
	background-position:auto;
	background-size: 40%;
	background-repeat:no-repeat;
}
table, th, td {
    border: none;
    border-collapse: collapse;
}
th {
    text-align: left;
}
div.Profile_View{
	margin-left:10%;
}
div.logout{
margin-left:80%;
}
a{
	text-decoration:none;
	font-family:Courier New;
}
</style>
<%
	String sessionname = (String)session.getAttribute("usertype");
	if(sessionname==null){
			response.sendRedirect("login.jsp");
		}
		else{
			if(session.getAttribute("usertype").equals("1")){
				//response.sendRedirect("com_admin_index.jsp");
			}
			else if(session.getAttribute("usertype").equals("2")){
				response.sendRedirect("owner.jsp");
			}
			else{
				response.sendRedirect("user_index.jsp");
			}
		}
		%>
</head>
<body>
<h1 align="center">Welcome to 4C knowledge</h1>

<div class="logout">
<form action="logout" method="post">
	<a href="com_admin_index.jsp">View Users</a><br>
	<input type="submit" value="LOG OUT"><br><br>
</form>
</div>
<div class="Profile_View">
<form name="myform" action="AdminView.jsp" method="POST">



<center>
<form name="View Profile" method=post>
	Username<input type="text" name="username" value="${request.username}" size=20> <input type="submit" value="View Profile" name="view" onclick="AdminView.jsp" size="15"><br><br><br>
</form>
</center>
<%
	String fname,padd;
	String username,password;
	
	username = request.getParameter("username");
	String que = "select* from users where username='"+username+"'";
	
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost/bookclub", "root", "Glycer_123");
		System.out.println("Connection established");
		
		PreparedStatement pst = con.prepareStatement(que);
		ResultSet rs = pst.executeQuery();
		System.out.println("Data retrieved");
		
		while(rs.next()){
			fname=(String)rs.getString(3);
			padd=(String)rs.getString(5);
			
			username=(String)rs.getString(1);
			password=(String)rs.getString(2);
		//	out.println(fname+" "+padd+" "+username+" "+password);
			
			request.setAttribute("fullname", fname);
			request.setAttribute("paddress", padd);
		
			request.setAttribute("username", username);
			request.setAttribute("password", password);
			
		}
	}catch(Exception e){
		System.out.println(e);
	}
%>
<form action="Change" method=post>
<table align="center" cellpadding = "5">

<tr>
<td>Full Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td><input type="text" name="fname" value="${fullname}"  size=20/>
</td>
</tr>
<tr>
<td>Permanent Address&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td><input type="text" name="padd" value="${paddress}" size=20/>
</td>
</tr>



<tr>
<td>Username&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td><input type="text" name="username" value="${username}"  size=20/>
</td>
</tr>
<tr>
<td>Password&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td><input type="text" name="password" value="${password}"  size=20/>
</td>
</tr>
<!--  comment
<tr>
<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td><input type="text" name="yourpwd" values="${interest}" maxlength="100"/><br><br>
</td>
</tr>

<tr>
<td align="center"><input type="submit" value="Add Admin"></td>

<td align="center"><input type="submit" value="Delete"></td>

</tr>
-->
</table><br><br><br><br><br><br><br>
</form>
</form>
</div>
</body>
</html>