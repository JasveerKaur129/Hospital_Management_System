<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link href="Global.css" rel="stylesheet" type="text/css">
<meta charset="ISO-8859-1">
<title>Add Patient</title>
</head>
<body>

<!--(pat_id,pat_name,pat_address,pat_age,pat_phone,pat_problem,pat_gender,pat_emer_contact) -->
<%
	if(session.getAttribute("ro")==null)
		response.sendRedirect("indexH.jsp");
%>

<div id=bold> Add Patient</div>
<form name="lr"  id="form"  method="post"  action="AddPatientServlet.do"> 
		<h1 > Patient Details </h1>
		<lable>Name :</lable>
		<input type="text" placeholder="Name"  name="pName" required  id="input"/></br></br>
		
		<lable>Address :</lable>
		<input type="text" placeholder="Address"  name="pAdd" required  id="input"/>
		</br></br>
		
		<lable>Age :</lable>
		<input type="number" placeholder="Age"  name="pAge" required required  maxlength="100" minlength="20" id="input"/>
		</br></br>
		<lable>Contact Number :</lable>
		<input type="number" placeholder="Phone"  name="p_phone" required min="1000000000" max="9999999999" id="input"/></br></br>
		
		<lable>Problem :</lable>
		<input type="text" placeholder="problem"  name="p_problem" required  id="input"/>
		</br></br>
		
		<lable>Gender :</lable>
		<input type="text" placeholder="Gender"  name="p_gender" required  id="input"/>
		</br></br>
		
		<lable>Emergency Contact Number :</lable>
		<input type="number" placeholder="Emergency Phone"  name="p_ephone" required min="1000000000" max="9999999999" id="input"/></br></br>
		</br></br>
		<button type="Submit" style="display:inline;margin-right:40px;background-color:purple;color:white">Submit</button>
		<button type="reset"style="background-color:purple;color:white">Clear</button>
		</br></br>
		
	</form>
	</br></br>
	<div class="tag">
	
		<a href="PatentPage.jsp" ><button id="tag">Back</button></a></div>

</body>
</html>