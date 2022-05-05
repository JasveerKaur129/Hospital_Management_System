<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link href="Global.css" rel="stylesheet" type="text/css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

<title>Appointment Details</title>
</head>
<body>
<%
	if(session.getAttribute("ro")==null)
		response.sendRedirect("indexH.jsp");
%>

		</br></br>
		<h1 id='bold' >Appointment Details </h1></br></br>
<form name="lr"  id="form"  method="post"  action="SearchAppointment.do">
	
		
		<lable> Enter Patient Id</lable></br>
		<div class="input-group">
		
		  <input type="search" class="form-control rounded" placeholder="Patient Id"  name='Pid' aria-label="Search" aria-describedby="search-addon" />
		  <button type="button" class="btn btn-outline-primary">search</button>
		</div>
</form>


</body>
</html>