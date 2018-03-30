<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Home Page</title>
<style>
body{
	background-image:url("Images/Reg_User_index.jpg");
	background-size: 60%;
	background-repeat:no-repeat;
}
a{
text-decoration:none;
color:#3333CC;
font-family:Courier New;
}
</style>
</head>
<body>
	<%
	String sessionname = (String)session.getAttribute("usertype");
	if(sessionname==null){
		response.sendRedirect("login.jsp");
		}
		else{
			if(session.getAttribute("usertype").equals("1")){
				response.sendRedirect("com_admin_index.jsp");
			}
			else if(session.getAttribute("usertype").equals("2")){
				response.sendRedirect("owner.jsp");
			}
			else{
				//response.sendRedirect("user_index.jsp");
			}
		}
		%>
		
<a href="" style="float:right">View Profile</a>
	<form action="logout" method="post">
		<input type="submit" value="Logout">
	</form>	
</body>
</html>