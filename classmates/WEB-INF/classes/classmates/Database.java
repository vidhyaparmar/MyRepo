package  classmates;

import java.sql.*;

public class  Database
{
 public static Connection getConnection() throws Exception
 {
   Class.forName("oracle.jdbc.driver.OracleDriver");
   // connect using Thin driver
   Connection con =   DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:oracle8i",
		"classmates","classmates");
   return con;
 }

 public static void clean(Connection con, Statement st)
 {
    try
    {
     st.close();
     con.close();
    }
    catch(Exception ex) {}
 }

}