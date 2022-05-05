package view;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.DBConnection;

/**
 * Servlet implementation class SearchAppointment
 */
@WebServlet("/SearchAppointment.do")
public class SearchAppointment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchAppointment() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			Connection C = DBConnection.cc();
			 PrintWriter out = response.getWriter();
			int Patid = Integer.parseInt(request.getParameter("Pid"));
			String  q      = "select * from appointment where Pat_id=? ";
			PreparedStatement   Pstobj  = C.prepareStatement(q);		 
			Pstobj.setInt(1,Patid);
			ResultSet RS =  Pstobj.executeQuery();
			
			out.println("<html><head><link href=\"Global.css\" rel=\"stylesheet\" type=\"text/css\"></head><body> <div align='center'>");
			if(RS.next())
			{ 
			
			out.println("<table> <div id= bold>Registration Details</div>");
			out.println("<tr> <th>Appointment ID</th> <th>Appointment Date</th>");
			out.println("<th>Appointment Time</th> <th>Patient ID</th> <th>Doctor ID</th> <th>Doctor Department</th>");
			out.println(" <th>Appointment Status</th> </tr>");
		 
				out.println("<tr> <td> " + RS.getInt(1)  ); //A_id
				out.println(" <td> " + RS.getString(2)); //Appointment Date			
				out.println(" <td> " + RS.getString(3));  //Appointment Time
				out.println(" <td> " + RS.getInt(4));// Pat_id
				out.println(" <td> " + RS.getInt(5));//d_id
				out.println(" <td> " + RS.getString(6)); //department
				out.println(" <td> " + RS.getString(7)); //status			
				out.println("</tr>"); 
			
			out.println("</table> </div><br/> <br/> <br/> "); 
			out.println("<div id='h1'>Click here to  <a href='PatientPage.jsp'>Back </a> </div>  </body></html>");
			}
			else {
				out.println("<div id='h1'>No record Found</div>");
				out.println("<div id='h1'>Click here to  <a href='PatientPage.jsp'>back </a> </div>  </body></html>");
			}
			}
			catch (SQLException e) {
				e.printStackTrace();
			}
		}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
