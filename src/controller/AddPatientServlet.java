package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AddPatientServlet.do")
public class AddPatientServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public AddPatientServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String pName = request.getParameter("pName");
		String pAdd = request.getParameter("pAdd");
		int pAge =Integer.parseInt(request.getParameter("pAge"));
		long p_phone = Long.parseLong(request.getParameter("p_phone"));
		String p_problem = request.getParameter("p_problem");
		String p_gender = request.getParameter("p_gender");
		long p_ephone= Long.parseLong(request.getParameter("p_ephone"));
		
		String  url = "jdbc:mysql://localhost:3306/hospital";
		 String dbuser   = "root";
		 String dbuserpw = "Mysql";	
		 Connection Con = null;
		 response.setContentType("text/html");
		 
		  PrintWriter out = response.getWriter();
		try 
		{
			Con = DriverManager.getConnection( url, dbuser, dbuserpw);
			String q = "insert into patient (pat_name,pat_address,pat_age,pat_phone,pat_problem,pat_gender,pat_emer_contact) values (?,?,?,?,?,?,?)";
			PreparedStatement   stmt  = Con.prepareStatement(q);
			
			stmt.setString(1, pName);
			stmt.setString(2, pAdd);
			stmt.setInt(3, pAge);
			stmt.setLong(4, p_phone);
			stmt.setString(5, p_problem);
			stmt.setString(6, p_gender);
			stmt.setLong(7, p_ephone);
			out.println("<html><head><link href=\"Global.css\" rel=\"stylesheet\" type=\"text/css\"></head><body>");
				
			int count  =  stmt.executeUpdate();
			if (count==1)
			{ 
				out.println("<div id='bold'>Patient Record is added successfully</div></br></br>");
				out.println("<div id='h1'>Click here to add more Patients  <a href='AddPatient.jsp'>Add Patient </a> </div></br></br>");
				out.println("<div id='h1'>Click here to Go Home page  <a href='indexH.jsp'>Go Home page </a> </div> </body></html>");
			}
		} 
		
		catch (SQLException e ) {
			out.println(e);  
		} 
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
