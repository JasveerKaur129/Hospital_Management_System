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
 * Servlet implementation class AddDischargeServlet
 */
@WebServlet("/AddDischargeServlet.do")
public class AddDischargeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddDischargeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		int pat_id=Integer.parseInt(request.getParameter("pat_id"));
		int C_id = Integer.parseInt(request.getParameter("C_id"));
		double dis_fee =Double.parseDouble(request.getParameter("dis_fee"));
		
		String  url = "jdbc:mysql://localhost:3306/hospital";
		 String dbuser   = "root";
		 String dbuserpw = "Mysql";	
		 Connection Con = null;
		 response.setContentType("text/html");
		 
		  PrintWriter out = response.getWriter();
		try 
		{
			Con = DriverManager.getConnection( url, dbuser, dbuserpw);
			String query = "insert into discharge (pat_id,C_id,dis_fee) values (?,?,?)";
			PreparedStatement   std  = Con.prepareStatement(query);
			
			std.setInt(1, pat_id);
			std.setInt(2,C_id);
			std.setDouble(3, dis_fee);
			
			
			out.println("<html><head><link href=\"Global.css\" rel=\"stylesheet\" type=\"text/css\"></head><body>");
				
			int count  =  std.executeUpdate();
			if (count==1)
			{ 
				out.println("<div id='bold'>Discharge Record is added successfully</div></br></br>");
				out.println("<div id='h1'>Click here to add more Discharge Patient <a href='AddDischarge.jsp'>Add Discharge </a> </div></br></br>");
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

