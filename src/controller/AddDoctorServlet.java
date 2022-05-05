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

@WebServlet("/AddDoctorServlet.do")
public class AddDoctorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AddDoctorServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String dName = request.getParameter("dName");
		String dAdd = request.getParameter("dAdd");
		String pw = request.getParameter("pwd");
		int dAge =Integer.parseInt(request.getParameter("dAge"));
		long d_phone = Long.parseLong(request.getParameter("d_phone"));
		String d_dept = request.getParameter("d_dept");
		String d_gender = request.getParameter("d_gender");
		String d_spec= request.getParameter("d_spec");
		
		String  url = "jdbc:mysql://localhost:3306/hospital";
		 String dbuser   = "root";
		 String dbuserpw = "Mysql";	
		 Connection Con = null;
		 response.setContentType("text/html");
		 
		  PrintWriter out = response.getWriter();
		try 
		{
			Con = DriverManager.getConnection( url, dbuser, dbuserpw);
			String q = "insert into doctor (d_name,d_address,d_age,d_phone,d_dept,d_gender,d_specialist) values ( ?,?,?,?,?,?,?)";
			PreparedStatement   std  = Con.prepareStatement(q);
			
			std.setString(1, dName);
			std.setString(2, dAdd);
			std.setInt(3, dAge);
			std.setLong(4, d_phone);
			std.setString(5, d_dept);
			std.setString(6, d_gender);
			std.setString(7, d_spec);
			out.println("<html><head><link href=\"Global.css\" rel=\"stylesheet\" type=\"text/css\"></head><body>");
				
			int count  =  std.executeUpdate();
			if (count==1)
			{ 
				out.println("<div id='bold'>Doctor Record is added successfully</div></br></br>");
				out.println("<div id='h1'>Click here to add more Doctors  <a href='AddDoctor.jsp'>Add Doctor </a> </div></br></br>");
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
