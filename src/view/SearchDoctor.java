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
 * Servlet implementation class SearchDoctor
 */
@WebServlet("/SearchDoctor.do")
public class SearchDoctor extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchDoctor() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			Connection C = DBConnection.cc();
			 PrintWriter out = response.getWriter();
			int Did = Integer.parseInt(request.getParameter("Did"));
			String  q      = "select * from Doctor where d_id=? ";
			PreparedStatement   Pstobj  = C.prepareStatement(q);		 
			Pstobj.setInt(1,Did);
			ResultSet RS =  Pstobj.executeQuery();
			out.println("<html><head><link href=\"Global.css\" rel=\"stylesheet\" type=\"text/css\"></head><body> <div align='center'>");
			if(RS.next())
			{ 
			
			out.println("<table> <div id= bold>Registration Details</div>");
			out.println("<tr> <th>ID</th> <th>Name</th>");
			out.println("<th>Address</th> <th>Age</th> <th>Contact Number</th> <th>Department</th>");
			out.println("<th>Gender</th> <th>Specialization</th> </tr>");
		
			 
				out.println("<tr> <td> " + RS.getInt(1)  ); //A_id
				out.println(" <td> " + RS.getString(2)); //Appointment Date			
				out.println(" <td> " + RS.getString(3));  //Appointment Time
				out.println(" <td> " + RS.getInt(4));// Pat_id
				out.println(" <td> " + RS.getLong(5));//d_id
				out.println(" <td> " + RS.getString(6)); //department
				out.println(" <td> " + RS.getString(7)); 
				out.println(" <td> " + RS.getString(8));//status			
				out.println("</tr>"); 
			
			out.println("</table> </div><br/> <br/> <br/> "); 
			out.println("<div id='h1'>Click here to <a href='indexH.jsp'>Go Home page </a> </div>  </body></html>");
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
