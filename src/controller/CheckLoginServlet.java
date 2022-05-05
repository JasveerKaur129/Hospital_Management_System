package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/CheckLoginServlet.do")
public class CheckLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public CheckLoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		long id = Long.parseLong(request.getParameter("uid"));		
		String ro = request.getParameter("role");
		String pw = request.getParameter("pwd");
	 
		String  url = "jdbc:mysql://localhost:3306/ebookstore";
		 String dbuser   = "root";
		 String dbuserpw = "Mysql";	
		 Connection Con = null;
		 response.setContentType("text/html");
		 
		  PrintWriter out = response.getWriter();
		try 
		{
			Con = DriverManager.getConnection( url, dbuser, dbuserpw);
			String  q      = "select * from  userlogin where uid= ? and pwd=? and role=?";
			PreparedStatement   Pstobj  = Con.prepareStatement(q);
			
			Pstobj.setLong(1, id);
			Pstobj.setString(2, pw);
			Pstobj.setString(3, ro);
			ResultSet RS =  Pstobj.executeQuery();
			if (RS.next())
			{
				out.println("You are logged in Successfully..");
				HttpSession session=request.getSession();
				session.setAttribute("ro", ro);
				if (ro.equals("Admin"))
				{
					RequestDispatcher RD = request.getRequestDispatcher("adminPage.jsp");
					RD.forward(request, response);
				}
				 else if (ro.equals("Patient"))				 
				{
					
					RequestDispatcher RD = request.getRequestDispatcher("PatientPage.jsp");
					RD.forward(request, response);						
									
				}else if (ro.equals("Doctor"))				 
				{
					
					RequestDispatcher RD = request.getRequestDispatcher("DoctorPage.jsp");
					RD.forward(request, response);						
									
				}			 	 
			}
			else
			{
				request.setAttribute("LErr", "Your log in Details are invalid");
				RequestDispatcher RD1 = request.getRequestDispatcher("indexH.jsp");
				RD1.forward(request, response);
			}
		}
		catch(Exception e)
		{
			
		}
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
