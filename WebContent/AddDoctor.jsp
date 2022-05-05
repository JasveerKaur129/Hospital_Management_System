<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link href="Global.css" rel="stylesheet" type="text/css">
<meta charset="ISO-8859-1">
<title>Add Doctor</title>
</head>
<body>

<!--(d_id,d_name,d_address,d_age,d_phone,d_dept,d_gender,d_specialist) -->

<%
	if(session.getAttribute("ro")==null)
		response.sendRedirect("indexH.jsp");
%>
<div id=bold> Add Doctor</div>
<form name="lr"  id="form"  method="post"  action="AddDoctorServlet.do"> 
		<h1 > Doctor Details </h1>
		<lable>Name :</lable>
		<input type="text" placeholder="Name"  name="dName" required  id="input"/></br></br>
		
		<lable>Address :</lable>
		<input type="text" placeholder="Address"  name="dAdd" required  id="input"/>
		</br></br>
		
		<lable>Age :</lable>
		<input type="number" placeholder="Age"  name="dAge" required required  maxlength="100" minlength="20" id="input"/>
		</br></br>
		<lable>Contact Number :</lable>
		<input type="number" placeholder="Phone"  name="d_phone" required min="1000000000" max="9999999999" id="input"/></br></br>
		
		<lable>Department :</lable>
		<input type="text" placeholder="Department"  name="d_dept" required  id="input"/>
		</br></br>
		
		<lable>Gender :</lable>
		<input type="text" placeholder="Gender"  name="d_gender" required  id="input"/>
		</br></br>
		
		<lable>Specialization :</lable>
		<input type="text" placeholder="Specialization"  name="d_spec" required  id="input"/>
		</br></br>
		<button type="Submit" style="display:inline;margin-right:40px;background-color:purple;color:white">Submit</button>
		<button type="reset"style="background-color:purple;color:white">Clear</button>
		</br></br>
		
	</form>
	</br></br>
	<div class="tag">
		<a href="indexH.jsp" ><button id="tag">Back</button></a></div>

</body>
</html>