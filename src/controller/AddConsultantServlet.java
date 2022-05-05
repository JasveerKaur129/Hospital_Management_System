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


@WebServlet("/AddConsultantServlet.do")
public class AddConsultantServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
    public AddConsultantServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
		int A_id = Integer.parseInt(request.getParameter("A_id"));
		String M = request.getParameter("Medication");
		int A_fee =Integer.parseInt(request.getParameter("fee"));
		String F = request.getParameter("followup");
		String status_a= request.getParameter("a_status");
		
		String  url = "jdbc:mysql://localhost:3306/hospital";
		 String dbuser   = "root";
		 String dbuserpw = "Mysql";	
		 Connection Con = null;
		 response.setContentType("text/html");
		 
		  PrintWriter out = response.getWriter();
		try 
		{
			Con = DriverManager.getConnection( url, dbuser, dbuserpw);
			String q = "insert into Consultant(A_id ,Medication,fee,followup,a_status) values (?,?,?,?,?)";
			PreparedStatement   std  = Con.prepareStatement(q);
			
			std.setInt(1, A_id);
			std.setString(2, M);
			std.setDouble(3, A_fee);
			std.setString(4, F);
			std.setString(5, status_a);
			
			out.println("<html><head><link href=\"Global.css\" rel=\"stylesheet\" type=\"text/css\"></head><body>");
				
			int count  =  std.executeUpdate();
			if (count==1)
			{ 
				out.println("<div id='bold'>Consultant Record is added successfully</div></br></br>");
				out.println("<div id='h1'>Click here to add more Consultants  <a href='AddConsultant.jsp'>Add Consultant </a> </div></br></br>");
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
