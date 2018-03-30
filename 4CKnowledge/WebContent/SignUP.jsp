<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="design.css"></head>
<body>
<div class="container">
<h3>Enter your details</h3>
<br/>	
<form name="regform" method="post" action="Registration" id="rgform">
	<table border="0">
		<tr>
			<td>Full Name</td>
			<td><input type="text" name="fullname" id="fname"></td>
		</tr>
		<tr>
			<td>Date of Birth</td>
			<td><input type="date" name="dob"></td>
		</tr>
		<tr>
			<td>Permanent Address</td>
			<td> <input type="text" name="paddress"></td>
		</tr>
		<tr>
			<td> Current Address</td>
			<td><input type="text" name="caddress"></td>
		</tr>
		<tr>
			<td>Mobile No.</td>
			<td><input type="text" name="mobile" id="mobilen" ></td>
		</tr>
		<tr>
			<td>Home Telephone</td>
			<td><input type="text" name="hometel" id="hometele"></td>
		</tr>
		<tr>
			<td>User name</td>
			<td><input type="text" name="un" id="usrname">
		</tr>
		<tr>
			<td>Password</td>
			<td><input type="password" name="pwd" id="passw"></td>
		</tr>
		<tr>
			<td>Interests</td></tr>
			<tr><td><input type="checkbox" name="interest" value="AI">AI</td>
			<td><input type="checkbox" name="interest" value="Image Processing">Image Processing</td>
		</tr>
		<tr>
			<td><input type="checkbox" name="interest" value="Middleware">Middleware</td>
			<td><input type="checkbox" name="interest" value="Art">Art</td>
		</tr>
		<tr>
			<td><input type="checkbox" name="interest" value="Science Fiction">Science Fiction</td>
			<td><input type="checkbox" name="interest" value="Politics">Politics</td>
		</tr>
		<tr>
			<td><input type="checkbox" name="interest" value="Religion">Religion</td>
		</tr>
		<tr>
			<td><input type="submit"  value="Submit" id="btnsub"></td>
			<td><input type="Reset" value="Reset"></td>			
		</tr>
	</table>
</form>
</div>
<script>
var x = document.getElementById("rgform");
x.addEventListener("focusout",FOfname);
x.addEventListener("focusout",FOusrname);
x.addEventListener("focusout",FOhtele);
x.addEventListener("focusout",FOmobile);
x.addEventListener("focusout",FOpwd);

function FOfname(){
	var fname = document.getElementById("fname").value;
	
	if(fname==""){
		document.getElementById("fname").style.backgroundColor="yellow";
		document.getElementById("btnsub").disabled=true;

	}
	else{
		if(/^[a-zA-Z]+$/.test(fname)){
			document.getElementById("fname").style.backgroundColor="yellow";
			document.getElementById("btnsub").disabled=true;
		}
		else{
			document.getElementById("btnsub").disabled=false;
			document.getElementById("fname").style.backgroundColor="";
			return true;
		}
	}
}

function FOusrname(){
	var username = document.getElementById("usrname").value;
	
	if(username==""){
		document.getElementById("usrname").style.backgroundColor="yellow";
		document.getElementById("btnsub").disabled=true;

	}
	else{
		if(/[^a-zA-Z0-9\-\/]/.test(username)){
			document.getElementById("usrname").style.backgroundColor="yellow";
			document.getElementById("btnsub").disabled=true;
		}
		else{
			document.getElementById("usrname").style.backgroundColor="";
			document.getElementById("btnsub").disabled=false;
			return true;
		}
	}
}
function FOhtele()
{
	  var pat = /^\d{10}$/;
	  var phnno= document.getElementById("hometele").value

	  if(pat.test(phnno))
	  {
		  	document.getElementById("hometele").style.backgroundColor="";
			document.getElementById("btnsub").disabled=false;
			return true;  
	   }
	  else
		  {
		  	document.getElementById("hometele").style.backgroundColor="yellow";
			document.getElementById("btnsub").disabled=false;
		  	return false;
		  }
}
function FOmobile()
{
	  var pat = /^\d{10}$/;
	  var phnno= document.getElementById("mobilen").value

	  if(pat.test(phnno))
	  {
		  	document.getElementById("mobilen").style.backgroundColor="";
			document.getElementById("btnsub").disabled=false;
			return true;  
	   }
	  else
		  {
		  	document.getElementById("mobilen").style.backgroundColor="yellow";
			document.getElementById("btnsub").disabled=false;
		  	return false;
		  }
}
function FOpwd (){
	var pwd= document.getElementById("passw")
	if(pwd.length<8)
		{
		document.getElementById("passw").style.backgroundColor="yellow";
		document.getElementById("btnsub").disabled=true;
		return true;  
   }
  else
	  {
	  	document.getElementById("passw").style.backgroundColor="";
		document.getElementById("btnsub").disabled=false;
	  	return false;
	  }
}
</script>
</body>
</html>
