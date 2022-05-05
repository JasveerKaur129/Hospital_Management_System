package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.DBConnection;
@WebServlet("/ConformAppointmentServlet.do")
public class ConformAppointmentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ConformAppointmentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		try {
			Connection C = DBConnection.cc();
			int uid = Integer.parseInt(request.getParameter("pid"));
			String sql = "update Appointment set  status_a='Conform' where pat_id= ?";
			PreparedStatement PS =  C.prepareStatement(sql);
				PS.setInt(1, uid);
			PS.executeUpdate();		 
			RequestDispatcher RD = request.getRequestDispatcher("ConformAppointment.jsp");
			RD.forward(request, response);
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
