package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection{
	
	public static Connection cc() throws SQLException
	{
		String  url = "jdbc:mysql://localhost:3306/hospital";
		 String dbuser   = "root";
		 String dbuserpw = "Mysql";	
		 Connection Con = null;
		return DriverManager.getConnection( url, dbuser, dbuserpw);
		
	}
}
