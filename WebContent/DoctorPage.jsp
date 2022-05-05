<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Doctor Section</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link href="Global.css" rel="stylesheet" type="text/css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

</head>
<body id="main">
<%
	if(session.getAttribute("ro")==null)
		response.sendRedirect("indexH.jsp");
%>

<nav class="navbar navbar-expand-lg navbar-light ">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">City Hospital</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <!-- Doctor -->
		 <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="AdminPage.jsp" id="navbarDarkDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Doctor
          </a>
          <ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="navbarDarkDropdownMenuLink">
             <li><a class="dropdown-item" href="SearchDoctor.jsp">Registration Details</a></li>
             <li><a class="dropdown-item" href="ViewDoctorList.jsp">Existing Doctors List</a></li>
          </ul>
        </li>   
        <!-- Consultant -->
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDarkDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
           Consultant
          </a>
          <ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="navbarDarkDropdownMenuLink">
           <li><a class="dropdown-item" href="AddConsultant.jsp">Add Consultant</a></li>
            <li><a class="dropdown-item" href="SearchConsultant.jsp">View Consultant Details</a></li>
          </ul>
        </li>
      </ul>
      <form class="d-flex" action="LogoutServlet.do">
         <button class= "btn btn-danger navbar-btn"> log Out </button>
	      </form>
	    </div>
	  </div>
	</nav>
	<div id=bold> Doctor Section
				<br/><br/> 
	</div>
		
	
</body>
</html>
