<%@page import="java.sql.*" %>
<%@page import="javax.servlet.*" %>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="Stylesheet" type="text/css" href="style/CSS.css" title="style">

 <link rel="stylesheet" href="bootstrap.min.css">
 


<title>View User Profile</title>

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

h3{
	color:white;
	text-align:center;
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
div.container{
	margin-left:10%;
}
</style>

</head>
<body>
	<form name="myform" action="ViewRegularUser.jsp" method="POST">
	<center>	
	<h2>Welcome to 4C Knowledge</h2>
	<h3><b>User Profile</b></h3>
	<div class="container">
	<table width="42%">
	<tr class="bg-info">
		<td>&nbsp;&nbsp;&nbsp;Username &nbsp;</td><td><input type="text" name="username" value="${request.username}" size=20><button class="btn warning"  type="submit" value="View My Profile"  font-family="Verdana" name="view" onclick="servlet.jsp" size="15"><b>View My Profile</b></button></td>
	</tr>
	</table>
	</div>	
	</center>
	<%
		String fname,padd,cadd;
		String mob,phon,utype;
		Date Dob;
	
		String username = request.getParameter("username");
		String que = "select fullname,dob,paddress,caddress,mobile,hphone from users where username='"+username+"'";  
	
		try{
		Class.forName("com.mysql.jdbc.Driver");  //load db driver
		Connection con= DriverManager.getConnection("jdbc:mysql://localhost/bookclub","root","Glycer_123");  //get a connection to db
		System.out.println("connection established");
	
		PreparedStatement pst= con.prepareStatement(que);
		ResultSet rs= pst.executeQuery();
		System.out.println("data retrieved");
		
		while(rs.next())
		{
			fname = rs.getString(1);
			Dob = rs.getDate(2);
			
			SimpleDateFormat s = new SimpleDateFormat("yyyy-MM-dd");
			String dob=s.format(Dob);
			
			padd =(String) rs.getString(3);
			cadd = (String)rs.getString(4);
			mob = (String)rs.getString(5);
			phon = (String)rs.getString(6);
			utype = (String)rs.getString(7);
			//System.out.println(fname+" "+Dob+" "+padd+" "+cadd+" "+mob+" "+phon+" "+utype);
			
			
			request.setAttribute("fname", fname);
			request.setAttribute("dob", Dob);
			request.setAttribute("padd", padd);
			request.setAttribute("cadd", cadd);
			request.setAttribute("phon", phon);
			request.setAttribute("mob", mob);
		
		
			
		}
		
		}catch(Exception e){
			System.out.println(e);
		}
	
	
	
	%>
	
	<center>
	<div class="container">
	<table  class:bg-info" width="50%" name="table2">
	<tr>
		<td>&nbsp;&nbsp;&nbsp;Full Name            </td><td><input type="text" name="fname" value="${fname}" size=30></td>
	</tr>
	<tr>
		<td>&nbsp;&nbsp;&nbsp;DOB          </td><td><input type="text" name="dob" value="${dob}" size=30></td>
	</tr>
	<tr>
		<td>&nbsp;&nbsp;&nbsp;Permanent Address </td><td><input type="text" name="padd" value="${padd}" size=30></td>
		
	</tr>
	
	<tr>
		<td>&nbsp;&nbsp;&nbsp;Current Address    </td><td><input type="text" name="cadd" value="${cadd}" size=30></td>
	</tr>

	<tr>
		<td>&nbsp;&nbsp;&nbsp;Mobile         </td><td><input type="text" name="mob" value="${mob}" size=30 ></td>
	</tr>
	<tr>
		<td> &nbsp;&nbsp;&nbsp;Land Phone    </td><td><input type="text" name="phon" value="${phon}" size=30></td>
	</tr>

	<br/>
		
	</table>
	</div>
	</center>
	</form>
	<br>
	<form action="EditRegularUser.jsp" method="POST">
	<table align="center">
	
	<tr>
		<td>                </td><td><center><button class="btn warning" type="submit" value="${fname}" name="edit" size="40"><b>Edit Profile</b></button></center></td>
	</tr>
	</table>
	
	<br>
	
	</form>
</body>

</html>