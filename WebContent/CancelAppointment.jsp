<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link href="Global.css" rel="stylesheet" type="text/css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

<title>Cancel Appointment</title>
</head>
<body>
<%
	if(session.getAttribute("ro")==null)
		response.sendRedirect("indexH.jsp");
%>
		</br></br>
		<h1 id='bold' > To cancel the appointment Enter appointment Id </h1></br></br>
<form name="lr"  id="form"  method="post"  action="CancelAppointment.do">
		</br>
		
		<lable>Appointment Id :</lable>
		<input type="Number" placeholder="Appointment Id"  name="Aid" required  id="input"/></br></br

		</br>
	<button type="Submit" style="display:inline;margin-right:40px;background-color:purple;color:white">Submit</button>
		<button type="reset"style="background-color:purple;color:white">Clear</button>
		</br></br>
</form>
</body>
</html>