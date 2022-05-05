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
<title>List of Consultants</title>
</head>
 
<body>
<%
	if(session.getAttribute("ro")==null)
		response.sendRedirect("indexH.jsp");
%>
    <sql:setDataSource   var="myDS"     driver="com.mysql.cj.jdbc.Driver"
        url="jdbc:mysql://localhost:3306/hospital"
        user="root" password="Mysql" />
     
    <sql:query var="listUsers"   dataSource="${myDS}">
        SELECT * FROM Consultant;
    </sql:query>
     
    <div align="center">
        <table >
            <caption> <div id= bold>List of Consultants</div> </caption>
            <tr>
                <th>Consultant ID</th>
                <th>Appointment ID</th>
                <th>Recommended Medicines</th>
                <th>Consultant fee</th>
                <th>Followup</th>
                <th>Admit Status(N/Y)</th>
            </tr>
            <c:forEach var="Consultant" items="${listUsers.rows}">
                <tr>
              
                	<td><c:out value="${Consultant.C_id}" /></td>
                    <td><c:out value="${Consultant.A_id}" /></td>
                    <td><c:out value="${Consultant.Medication}" /></td>
                    <td><c:out value="${Consultant.fee}" /></td>
                    <td><c:out value="${Consultant.followup}" /></td>
                    <td><c:out value="${Consultant.a_status}" /></td>
                    
                </tr>
            </c:forEach>
        </table>
        </br></br>
        <a href="adminPage.jsp" ><button id=tag>Back</button></a>
    </div>
</body>
</html>