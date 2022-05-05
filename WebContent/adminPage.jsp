<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Section</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link href="Global.css" rel="stylesheet" type="text/css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

</head>
<%
	if(session.getAttribute("ro")==null)
		response.sendRedirect("indexH.jsp");
%>
<body id="main">
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
            <li><a class="dropdown-item" href="AddDoctor.jsp" >Add Doctor</a></li>
            <li><a class="dropdown-item" href="ViewDoctorList.jsp">Existing Doctors List</a></li>
          </ul>
        </li>
         <!-- Patient -->
         <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDarkDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Patient
          </a>
          <ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="navbarDarkDropdownMenuLink">
            <li><a class="dropdown-item" href="AddPatient.jsp">Add Patient</a></li>
            <li><a class="dropdown-item" href="ViewPatientList.jsp">Existing Patient List</a></li>
          </ul>
        </li>
        <!-- Appointment -->
         <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDarkDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Appointment 
          </a>
          <ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="navbarDarkDropdownMenuLink">
            <li><a class="dropdown-item" href="AddAppointment.jsp">Book Appointment </a></li>
             <li><a class="dropdown-item" href="ConformAppointment.jsp">Conform Appointment  </a></li>
              <li><a class="dropdown-item" href="CancelAppointment.jsp">Cancel Appointment </a></li>
            <li><a class="dropdown-item" href="ViewAppointmentList.jsp">Existing Appointment  List</a></li>
          </ul>
        </li>
          <!-- Discharge -->
         <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDarkDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Discharge
          </a>
          <ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="navbarDarkDropdownMenuLink">
            <li><a class="dropdown-item" href="AddDischarge.jsp">Add Discharge Patient</a></li>
            <li><a class="dropdown-item" href="ViewDischargeList.jsp">Existing Discharge List</a></li>
          </ul>
        </li>
      </ul>
      <form class="d-flex" action="LogoutServlet.do">
         <button class= "btn btn-danger navbar-btn"> log Out </button>
	      </form>
	    </div>
	  </div>
	</nav>
	<div id=bold> Admin Section
				<br/><br/> 
	</div>
		
	
</body>
</html>


<!--  <marquee><img src="http://localhost:8080//HospitalJsp//images//hospital.jpg" alt="Hospital" width="200" height="200"></marquee>
	
	<div id=tag>
	<a  href="DoctorPage.jsp"><button>Doctor Section</button></a></br></br>	
	<a  href="PatientPage.jsp"><button>Patient Section</button></a> </br></br>
	<a  href="AppointmentPage.jsp"><button>Appointment Section</button> </a></br></br>
	<a  href="DischargePage.jsp"><button>Discharge Section</button> </a> </br></br>
	</div>	--> 