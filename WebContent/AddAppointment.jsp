<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<link href="Global.css" rel="stylesheet" type="text/css">
<meta charset="ISO-8859-1">
<title>Book Appointment</title>
</head>
<body>

<!--(A_id,A_date,A_time,pat_id,d_id,dep_name,status_a) -->
<%
	if(session.getAttribute("ro")==null)
		response.sendRedirect("indexH.jsp");
%>

<div id=bold> Book Appointment</div>
<form name="lr"  id="form"  method="post"  action="AddAppointmentServlet.do"> 
		<h1 > Appointment Details </h1>
		<lable>Appointment Date :</lable>
		<input type="text" placeholder="Date"  name="A_date" required  id="input"/></br></br>
		
		<lable>Appointment Time :</lable>
		<input type="text" placeholder="Time"  name="A_time" required  id="input"/>
		</br></br>
		<select id="input">
		<%
		Connection Conn = null;
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital", "root", "Mysql");
		String qp1 = "select * from Patient";
		PreparedStatement st = conn.prepareStatement(qp1);
		ResultSet rs = st.executeQuery();
		while (rs.next()) // Returns true, if there is a record to iterate
		{
			out.println("<option id='input'>");
			out.println("Patient Name =" + rs.getString(2) +"\t"+ "Patient Id = " + rs.getInt(1)+"\t"+"\tAppointment's Problem = " + rs.getString(6));
			out.println("</option>");
		} %>
		</select></br></br>
		<lable>Patient Id :</lable>
			<input type="number" placeholder="Appointment Id"  name="pat_id" required required   id="input"/>
		</br></br>
		<select id="input">
		<%
		Connection Con = null;
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital", "root", "Mysql");
		String qp3 = "select * from doctor";
		PreparedStatement std = conn.prepareStatement(qp3);
		ResultSet rsd = std.executeQuery();
		while (rsd.next()) // Returns true, if there is a record to iterate
		{
			out.println("<option id='input'>");
			out.println("Doctor Id = " + rsd.getInt(1) +"\t"+  "Doctor Name =" + rsd.getString(2)+"\t"+  "Doctor Department =" + rsd.getString(6));
			out.println("</option>");
		} %>
		</select></br></br>
		<lable>Doctor Id  :</lable>
		<input type="number" placeholder="Doctor Id "  name="d_id" required  id="input"/></br></br>
		
		<lable>Department :</lable>
		<input type="text" placeholder="Department"  name="dep_name" required  id="input"/>
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