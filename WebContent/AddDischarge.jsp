<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<link href="Global.css" rel="stylesheet" type="text/css">
<meta charset="ISO-8859-1">
<title>Add Discharge Patient</title>
</head>
<body>

<!--(pat_id,C_id,dis_fee) -->
<%
	if(session.getAttribute("ro")==null)
		response.sendRedirect("indexH.jsp");
%>

<div id=bold> Add Discharge Patient</div>
<form name="lr"  id="form"  method="post"  action="AddDischargeServlet.do"> 
		<h1 > Discharge Details </h1>
	
		<select id="input">
		<%
		Connection Conn = null;
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital", "root", "Mysql");
		String queryC = "select C.C_id ,A.pat_id from Consultant C left join Appointment A  on C.A_id=A.A_id where a_status='Y'";
		PreparedStatement st = conn.prepareStatement(queryC);
		ResultSet rs = st.executeQuery();
		while (rs.next()) // Returns true, if there is a record to iterate
		{
			out.println("<option id='input'>");
			out.println("Consultant Id = " + rs.getInt(1) + "\t Patient Id = " + rs.getInt(2));
			out.println("</option>");
		}
		 %>
		</select></br></br>
		<lable>Patient Id :</lable>
		<input type="number" placeholder="Patient Id "  name="pat_id" required  id="input"/></br></br>
		
		<lable>Consultant Id :</lable>
		<input type="number" placeholder="Consultant Id "  name="C_id" required  id="input"/></br></br>
		
		<lable>Discharge fee :</lable>
		<input type="number" placeholder="fee "  name="dis_fee" required  id="input"/></br></br>
		
		<button type="Submit" style="display:inline;margin-right:40px;background-color:purple;color:white">Submit</button>
		<button type="reset"style="background-color:purple;color:white">Clear</button>
		</br></br>
		
	</form>
	</br></br>
	<div class="tag">
		<a href="adminPage.jsp" ><button id="tag">Back</button></a></div>

</body>
</html>