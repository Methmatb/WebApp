<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Welcome to 4CKnowlege Book Club</title>
<style>
body{
	height:100%;
    width: 100%;
    border: 0px;
	background-image: url("Images/Login_Books.png");
	background-position:auto;
	background-size:40%;
	background-repeat:no-repeat;
	resize:none;
}
a{
	text-decoration:none;
	color:#3333CC;
	font-family:Courier New;
	font-size:2em;
}
</style>
</head>
<body>
<center>
<h3>Already a Member </h3>
<a href="login.jsp">Sign In</a>
<br/>
<h3>Not a Member? Sign up here</h3>
<a href="SignUP.jsp">Sign Up</a>
</center>
</body>
</html>