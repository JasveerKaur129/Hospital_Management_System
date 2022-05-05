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

/**
 * Servlet implementation class AddAppointmentServlet
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/AddAppointmentServlet.do" })
public class AddAppointmentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddAppointmentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String A_date = request.getParameter("A_date");
		String A_time = request.getParameter("A_time");
		int pat_id =Integer.parseInt(request.getParameter("pat_id"));
		int d_id =Integer.parseInt(request.getParameter("d_id"));
		String dep_name = request.getParameter("dep_name");
	
		String  url = "jdbc:mysql://localhost:3306/hospital";
		 String dbuser   = "root";
		 String dbuserpw = "Mysql";	
		 Connection Con = null;
		 response.setContentType("text/html");
		 
		  PrintWriter out = response.getWriter();
		try 
		{
			Con = DriverManager.getConnection( url, dbuser, dbuserpw);
			String q ="insert into Appointment (A_date,A_time,pat_id,d_id,dep_name) values (?,?,?,?,?)";
			PreparedStatement   stmt  = Con.prepareStatement(q);
			
			stmt.setString(1, A_date);
			stmt.setString(2, A_time);
			stmt.setInt(3, pat_id);
			stmt.setLong(4, d_id);
			stmt.setString(5, dep_name);
			

			out.println("<html><head><link href=\"Global.css\" rel=\"stylesheet\" type=\"text/css\"></head><body>");
				
			int count  =  stmt.executeUpdate();
			if (count==1)
			{ 
				out.println("<div id='bold'>Appointment Record is added successfully</div></br></br>");
				out.println("<div id='h1'>Click here to add more Appointments  <a href='AddAppointment.jsp'>Add Appointment </a> </div></br></br>");
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
