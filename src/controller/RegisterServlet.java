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

@WebServlet("/RegisterServlet.do")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		long id = Long.parseLong(request.getParameter("uid"));
		String na = request.getParameter("uname");
		String ro = request.getParameter("role");
		String pw = request.getParameter("pwd");
	 
		String  url = "jdbc:mysql://localhost:3306/hospital";
		 String dbuser   = "root";
		 String dbuserpw = "Mysql";	
		 Connection Con = null;
		 response.setContentType("text/html");
		 
		  PrintWriter out = response.getWriter();
		try 
		{
			Con = DriverManager.getConnection( url, dbuser, dbuserpw);
			String  q      = "insert into userlogin (uid, pwd, role) values (?,?,?)";
			PreparedStatement   Pstobj  = Con.prepareStatement(q);
			
			Pstobj.setLong(1, id);
			Pstobj.setString(2, pw);
			Pstobj.setString(3, ro);
			
				
			int count  =  Pstobj.executeUpdate();
			if (count==1)
			{ 
				out.println(" Your Registration Details are successfully Registered");
				out.println("<h4><a href='indexH.jsp'>Go Home page </a> </h4>");
			}
		} 
		
		catch (SQLException e ) {
			out.println(e);  
		} 
		
	}
}
