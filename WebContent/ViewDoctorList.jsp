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
<title>List of Doctors</title>
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
        SELECT * FROM doctor;
    </sql:query>
     
    <div align="center">
        <table >
            <caption> <div id= bold>List of Doctors</div> </caption>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Address</th>
                <th>Age</th>
                <th>Contact Number</th>
                <th>Department</th>
                <th>Gender</th>
                <th>Specialization</th>
            </tr>
            <c:forEach var="Doctor" items="${listUsers.rows}">
                <tr>
                	<td><c:out value="${Doctor.d_id}" /></td>
                    <td><c:out value="${Doctor.d_name}" /></td>
                    <td><c:out value="${Doctor.d_address}" /></td>
                    <td><c:out value="${Doctor.d_age}" /></td>
                    <td><c:out value="${Doctor.d_phone}" /></td>
                    <td><c:out value="${Doctor.d_dept}" /></td>
                    <td><c:out value="${Doctor.d_gender}" /></td>
                    <td><c:out value="${Doctor.d_specialist}" /></td>
                    
                </tr>
            </c:forEach>
        </table>
        </br></br>
        <a href="adminPage.jsp" ><button id=tag>Back</button></a>
    </div>
</body>
</html>