<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page session="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>
<style>
h1{
	color:blue;
}
body{
	background-image:url("Images/Login_Books.png");
	background-size: 40%;
	background-repeat:no-repeat;
}
div.login_window{
	font-size:18px;
	margin-left:10%;
}
a{
	text-decoration:none;
	font-family:Courier New;
}
</style>
</head>
<body>
<%
String sessionname = (String)session.getAttribute("usertype");
if(sessionname==null){
		//response.sendRedirect("login.jsp");
	}
	else{
		if(session.getAttribute("usertype").equals("1")){
			response.sendRedirect("com_admin_index.jsp");
		}
		else if(session.getAttribute("usertype").equals("2")){
			response.sendRedirect("owner.jsp");
		}
		else{
			response.sendRedirect("user_index.jsp");
		}
	}
		%>
		<a href="index.jsp">Home</a>
<center>
	<h1>Login</h1>
	<div class="login_window">
	<form method="post" action="login">
	<table cellpadding="5">
		<tr>
				<td>User name</td>
				<td><input type="text" name="login_username" ></td>
			</tr>
		<tr>
			<td>Password</td>
			<td><input type="password" name="login_password" size="20"/></td>
		</tr>
		<tr>
			<td><input type="submit" value="Login"></td>
			<td><a href="ChangePassword.jsp">Forgot Your Password?</a></td>
		</tr>
		</table>
	</form>
	</div>
</center>
</body>
</html>