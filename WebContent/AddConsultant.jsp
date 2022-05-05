<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<link href="Global.css" rel="stylesheet" type="text/css">
<meta charset="ISO-8859-1">
<title>Add Consultant</title>
</head>
<body>

<!--(A_id,Medication,fee,followup,a_status) -->
<%
	if(session.getAttribute("ro")==null)
		response.sendRedirect("indexH.jsp");
%>


<div id=bold> Add Consultant</div>
<form name="lr"  id="form"  method="post"  action="AddConsultantServlet.do"> 
		<h1 > Consultant Details </h1>
	
		<select id="input">
		<%
		Connection Conn = null;
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital", "root", "Mysql");
		String AppQ = "select * from Appointment A left Join patient P on A.pat_id=P.pat_id";
		PreparedStatement stAppQ = conn.prepareStatement(AppQ);
		ResultSet rsAppQ = stAppQ.executeQuery();
		while (rsAppQ.next()) // Returns true, if there is a record to iterate
		{

			int refdid = rsAppQ.getInt(5);
			String nameQ = "select * from doctor where d_id=?";
			PreparedStatement stdoctorName = conn.prepareStatement(nameQ);
			stdoctorName.setInt(1, refdid);
			ResultSet doctorName = stdoctorName.executeQuery();
			while (doctorName.next()) // Returns true, if there is a record to iterate
			{
				out.println("<option id='input'>");
				out.println("Appointment Id = " + rsAppQ.getInt(1) + "\t" + "Patient Id= " + rsAppQ.getInt(4)
						+ "\t" + "Patient Name= " + rsAppQ.getString(9) + "\t" + "Doctor Name= "
						+ doctorName.getString(2)+ "\t" + "Patient Problem= " + rsAppQ.getString(13));
				out.println("</option>");
			}
		} %>
		</select></br></br>
		<lable>Appointment Id :</lable>
		<input type="number" placeholder="Appointment Id "  name="A_id" required  id="input"/></br></br>
		
		<lable>Recommended Medicines :</lable>
		<input type="text" placeholder="Medicines"  name="Medication" required  id="input"/>
		</br></br>
		
		<lable>Consultant fee :</lable>
		<input type="number" placeholder="fee "  name="fee" required  id="input"/></br></br>
		
		<lable>Followup :</lable>
		<input type="text" placeholder="Followup"  name="followup" required  id="input"/>
		</br></br>
		<lable>Admit Status(N/Y) :</lable>
		<input type="text" placeholder="Status"  name="a_status" required  id="input"/>
		</br></br>
		
		<button type="Submit" style="display:inline;margin-right:40px;background-color:purple;color:white">Submit</button>
		<button type="reset"style="background-color:purple;color:white">Clear</button>
		</br></br>
		
	</form>
	</br></br>
	<div class="tag">
	
	
		<a href="DoctorPage.jsp" ><button id="tag">Back</button></a></div>

</body>
</html>