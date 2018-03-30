<%@ page import="java.sql.*" %>
<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Owner Home</title>
<style>
footer{
    padding: 1em;
    color: white;
    background-color: #0636e5;
    clear: left;
    height: 5%;
    text-align: center;
}
body{
	height:100%;
    width: 100%;
    border: 0px;
    background:url("book1.jpg");
	background-position:center;
	background-size:100%;
	background-repeat:no-repeat;
	resize:none;
}
</style>
</head>
<body>
<img src="Assignment/images/book1.jpg">
	<h1 align="center">Owner Home Page</h1><br><br><br>
	
		<form action="AdminView.jsp" method =post align=center>
		<input type="submit" value="My Profile" /><br><br>
	</form>
	<form action="logout.java" method =post align=center>
		<input type="submit" value="Logout" onclick="<%session.setAttribute("usertype",null);%>"/><br><br>
		</form>
	<!-- <% out.print(session.getAttribute("usertype")); %>  -->
	<%
	try {
		
		String sql = "SELECT users.fullname,users.paddress,users.caddress,users.hphone,users.usertype,users.dob,users.mobile,interests.interest FROM users	INNER JOIN interests ON users.username=interests.username;";
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookclub","root","minoli16055");
		PreparedStatement ps = conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		String str = "<table border=1 align=center><tr><th>Full Name</th><th>Permanant Address</th><th>Current Address</th><th>Residence Number</th><th>DOB</th><th>Mobile</th><th>Interests</th></tr>";
		while(rs.next()) {
			str += "<tr><td>"+rs.getString("fullname")+"</td><td>"+rs.getString("paddress")+"</td><td>"+rs.getString("caddress")+"</td><td>"+rs.getString("hphone")+"</td><td>"+rs.getString("dob")+"</td><td>"+rs.getString("mobile")+"</td><td>"+rs.getString("interest")+"</td><td><input type='button' action='hidden' method='post' value='Delete' id='"+rs.getString(1)+"'/></td></tr>";
		}
		str += "</table>";
		out.println(str);
		conn.close();
	} 
	 
	catch (ClassNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	%>
    </form><br><br><br><br>

<footer>Copyright &copy; 4CKnowledge.com</footer>
</body>
</html>