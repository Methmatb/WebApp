<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Password Change</title>

<style>
.btn:hover
{
background-image:none;
background-color:Red;
}
footer{
    padding: 1em;
    color: white;
    background-color: #0636e5;
    clear: left;
    height: 5%;
    text-align: center;
}
h2
{
  font-family: Verdana; 
  font-size: 30pt;         
  font-style: normal; 
  font-weight: bold; 
  color:blue;
  text-align: center; 
}
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
table{
  font-family: Verdana; 
  color:black; 
  font-size: 12pt; 
  font-style: normal;
  text-align:left; 
  border-collapse: collapse; 
}
a{
	text-decoration:none;
	color:#3333CC;
	font-family:Courier New;
	font-size:1em;
}
div.window{
	font-size:18px;
	margin-left:10%;
}
</style>
<%
	String username=request.getParameter("username");
	String Newpass=request.getParameter("new");
	String conpass=request.getParameter("confirm");
	String connurl = "jdbc:mysql://localhost:3306/bookclub";
	Connection con=null;
	String pass="";
	String id="";
	try{
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookclub","root","minoli16055");
		Statement st=con.createStatement();
		ResultSet rs=st.executeQuery("select * from users where username='"+username+"'");
		while(rs.next()){
		id=rs.getString(1);
		pass=rs.getString(2);
	} 
		if(username.equals(id) && Newpass.equals(conpass)){
		Statement st1=con.createStatement();
		int i=st1.executeUpdate("update users set password='"+Newpass+"' where username='"+username+"'");
		System.out.println("Password changed successfully");
		st1.close();
		con.close();
	}
	else{
		System.out.println("Your password and confirmation password do not match   OR   Invalid Username");
	}
	}
	catch(Exception e){
		System.out.println(e);
	}
%>
</head>
<body>
<center>
<h2>Change Password</h2>

<div class="window">
<form method=post>

	<table align="center" cellpadding="5">
		<tr>
			<td>Username</td>
			<td><input type="text" name="username" maxlength="20"/></td>
		</tr>		
		<tr>
			<td>New Password</td>
			<td><input type="text" name="new" maxlength="20"/></td>
		</tr>
		<tr>
			<td>Re-Enter Password</td>
			<td><input type="text" name="confirm" maxlength="20"/></td>
		</tr>
		<tr>
			<td align="center"><input type="submit" value="Change Password"></td>
			<td><a href="login.jsp">Log In</a></td>
		</tr>
	</table>

</form>
</div>
	</center>

</body>
</html>