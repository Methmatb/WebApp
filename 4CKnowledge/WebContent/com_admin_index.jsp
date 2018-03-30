<%@ page import="java.sql.*" %>
<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Admin Home</title>
<style>
table{
	border-collapse:collapse;
}
a{
	text-decoration:none;
	font-family:Courier New;
}
div.View_Users{
	font-size:18px;
	margin-left:80%;
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

	<h1>Community Admin Home Page</h1>
	
		<div class="View_Users">
		<a href="AdminView.jsp">View User Details</a>
			<form action="logout" method="post">
		<input type="submit" value="Logout">
	</form>
	</div>
	<%
	try {
		
		String sql = "SELECT fullname,paddress,dob,mobile,username FROM users";
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookclub","root","Glycer_123");
		PreparedStatement ps = conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		String str = "<table border=1><tr><th>Full Name</th><th>Permanant Address</th><th>Mobile</th><th>Interests</th></tr>";
		while(rs.next()) {
			str += "<tr><td>"+rs.getString("fullname")+"</td><td>"+rs.getString("paddress")+"</td><td>"+rs.getString("mobile")+"</td><td>";
			String intsql = "Select * from interests where username ='"+rs.getString("username")+"'";
			ps = conn.prepareStatement(intsql);
			ResultSet nrst = ps.executeQuery();
			while(nrst.next()){
				str+= " "+nrst.getString("interest")+",";
			}
			str+="</td></tr>";
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

</body>
</html>