<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c1" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="Global.css" rel="stylesheet" type="text/css">
<title>List of Appointments</title>
</head>
 <%
	if(session.getAttribute("ro")==null)
		response.sendRedirect("indexH.jsp");
%>
<body>
    <sql:setDataSource   var="myDS"     driver="com.mysql.cj.jdbc.Driver"
        url="jdbc:mysql://localhost:3306/hospital"
        user="root" password="Mysql" />
     
    <sql:query var="listUsers"   dataSource="${myDS}">
        SELECT * FROM Appointment;
    </sql:query>
     
    <div align="center">
        <table >
            <caption> <div id= bold>List of Appointments</div> </caption>
            <tr>
                <th>Appointment ID</th>
                <th>Appointment Date</th>
                <th>Appointment Time</th>
                <th>Patient ID</th>
                <th>Doctor ID</th>
                <th>Doctor Department</th>
                <th>Appointment Status</th>
                
            </tr>
            <c:forEach var="Appointment" items="${listUsers.rows}">
                <tr>
                
                	<td><c:out value="${Appointment.A_id}" /></td>
                    <td><c:out value="${Appointment.A_date}" /></td>
                    <td><c:out value="${Appointment.A_time}" /></td>
                    <td><c:out value="${Appointment.pat_id}" /></td>
                    <td><c:out value="${Appointment.d_id}" /></td>
                    <td><c:out value="${Appointment.dep_name}" /></td>
                    <td><c:out value="${Appointment.status_a}" /></td>
                    
                </tr>
            </c:forEach>
        </table>
        </br></br>
        <a href="adminPage.jsp" ><button id=tag>Back</button></a>
    </div>
</body>
</html>