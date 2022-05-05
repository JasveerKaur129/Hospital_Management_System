<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"  import= "java.util.*, java.sql.*, java.io.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="Global.css" rel="stylesheet" type="text/css">
<title>Conform Appointment</title>
</head>
<body >
<%
	if(session.getAttribute("ro")==null)
		response.sendRedirect("indexH.jsp");
%>
	<div align="center">
	<div id= bold>List of Appointments</div>
	<%
	 
	 Connection Con = null;
	 response.setContentType("text/html");
	 
	
	try 
	{
		//Con = DriverManager.getConnection( url, dbuser, dbuserpw);
		Con = model.DBConnection.cc();
		String  q      = "select * from Appointment ";
		PreparedStatement   Pstobj  = Con.prepareStatement(q);		 
			
		ResultSet RS =  Pstobj.executeQuery();
		out.println("<table width='60%' border='2'>");
		out.println("<tr> <th>Appointment ID</th> <th>Appointment Date</th>");
		out.println("<th>Appointment Time</th> <th>Patient ID</th> <th>Doctor ID</th>");
		out.println("<th>Doctor Department</th> <th>Appointment Status</th> </tr>");
	
		
		List<Integer> UIDs = new ArrayList<>();
		while (RS.next())
		{ 
			out.println("<tr> <td> " + RS.getInt(1)  ); //A_id
			out.println(" <td> " + RS.getString(2)); //Appointment Date			
			out.println(" <td> " + RS.getString(3));  //Appointment Time
			out.println(" <td> " + RS.getInt(4));// Pat_id
			out.println(" <td> " + RS.getInt(5));//d_id
			out.println(" <td> " + RS.getString(6)); //department
			out.println(" <td> " + RS.getString(7)); //status
			if ( RS.getString(7).equals("Pending")) 
				UIDs.add(RS.getInt(4));				
			out.println("</tr>"); 
		}
		out.println("</table> <br/> <br/> <br/> "); 
		
				
		if(UIDs.size()!=0)
		{
		out.println("The List of Patients who is waiting for Conformation");
		out.println(" <br/> <br/> "); 
		out.println("<form method='post' action='ConformAppointmentServlet.do'>");		
		out.println("<Select name='pid'>");
		for(Integer id : UIDs)
			out.println("<option value=" + id + ">" + id + " </option>");
		out.println("</Select>");
		out.println("<input id='tag' type='submit' value='Conform'/>"); 
		out.println("</form>");
		}
		
	}
	catch(Exception e)
	{
		out.println(e);
	}
	%>
	<br/> <br/> <br/> 
	<a href="adminPage.jsp" ><button id=tag>Admin Section</button></a>
	
	</div>
</body>
</html>