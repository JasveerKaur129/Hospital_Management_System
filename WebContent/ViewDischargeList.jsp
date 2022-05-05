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
<title>List of Discharges</title>
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
        SELECT * FROM Discharge;
    </sql:query>
     
    <div align="center">
        <table >
            <caption> <div id= bold>List of Discharge Patients</div> </caption>
            <tr>
                <th>Discharge ID</th>
                <th>Patient ID</th>
                <th>Consultant ID</th>
                <th>Discharge fee</th>
                
            </tr>
            <c:forEach var="Discharge" items="${listUsers.rows}">
                <tr>
              
                	<td><c:out value="${Discharge.dis_id}" /></td>
                    <td><c:out value="${Discharge.pat_id}" /></td>
                    <td><c:out value="${Discharge.C_id}" /></td>
                    <td><c:out value="${Discharge.dis_fee}" /></td>
                    
                </tr>
            </c:forEach>
        </table>
        </br></br>
        <a href="adminPage.jsp" ><button id=tag>Back</button></a>
    </div>
</body>
</html>