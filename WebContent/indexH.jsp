<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>City Hospital</title>
<link href="Global.css" rel="stylesheet" type="text/css">
</head>
<body>

	<div id="bold">WELCOME TO CITY HOSPITAL</div></br>
	<p style="text-align:center"><% try
		{ 
			String ErrMsg = (String) request.getAttribute("LErr");
			if(ErrMsg.length()!=0)
			{
				out.print("<font color='red'>" + ErrMsg + "</font>");
			}
		}
		catch(Exception e)
		{
		}
	%></p></br>
	
	<form name="lr"  id="form"  method="post"  action="CheckLoginServlet.do"> 
		<h1> LOG IN </h1>
		<lable>Enter User ID :</lable>
		<input type="number" placeholder="User ID"  name="uid" required min="1000000000" max="9999999999" id="input"/></br></br>
		<lable>Enter Role :</lable>
		<select name="role" id="input"> 
				<option value="Patient" id="input">Patient </option>
				<option value="Admin"   id="input"> Admin</option>
				<option value="Doctor" id="input"> Doctor</option>
		</select>
		</br></br>
		<lable>Enter password :</lable>
		<input type="password" placeholder="Password" name="pwd" required  maxlength="10" minlength="4"id="input"/> 
		</br></br></br>
		<button type="Submit" style="display:inline;margin-right:40px;background-color:purple;color:white">Login</button>
		<button type="reset"style="background-color:purple;color:white">clear</button>
		</br></br>
		<div>---------------------or---------------------</div>
		</br></br>
		<div style="display:inline; color:purple;font-size:20px">Not a member?<a href="Register.jsp" style="margin-left:10px" id="reg" name="reg">Register here</a></div>
	</form>
</body>
</html>