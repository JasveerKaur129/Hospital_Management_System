<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title> Registration Form</title>
<link href="Global.css" rel="stylesheet" type="text/css">
	
</head>
<body>
	<div id="bold"> City Hospital </div>
	<br/><br/>	
					
	<form name="lr"  id="form"  method="post"  action="RegisterServlet.do">
	<h1>Registration Form </h1>
	<br/><br/>
	<lable>Enter User ID :</lable>
		<input type="number" placeholder="User ID"  name="uid" required min="1000000000" max="9999999999" id="input"/></br></br>
		<lable>Enter Role :</lable>
		<select name="role" id="input"> 
				<option value="Patient">Patient </option>
				<option value="Admin"> Admin</option>
				<option value="Doctor"> Doctor</option>
		</select>
		</br></br>
		<lable>Enter password :</lable>
		<input type="password" placeholder="Password" name="pwd" required  maxlength="10" minlength="4"id="input"/> 
		</br></br></br>
		<button type="Submit" style="display:inline;margin-right:40px;background-color:purple;color:white">Register</button>
		<button type="reset"style="background-color:purple;color:white">Clear</button>
		</br></br>
		</form>
		 
</body>
</html>