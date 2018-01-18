// MessageBean

package  classmates;

import java.sql.*;
import java.util.*;
import classmates.*;

public class MessageBean
{
    private  String body,subject;

    public  void setSubject(String subject)
    { this.subject = subject; }

    public String getSubject()
    {  return subject; }

    public  void setBody(String body)
    { this.body= body; }

    public String getBody()
    {  return body; }

    public String send(String sender, String receiver)
    {

     Connection con = null;
     PreparedStatement ps = null;
     try
     {
      con = Database.getConnection();
      // get next message id
      ps = con.prepareStatement("select nvl( max(msgid),0) + 1 from messages");
      ResultSet rs = ps.executeQuery();
      rs.next();
      int msgid = rs.getInt(1);
      rs.close();
      ps.close();
      //insert message
      ps = con.prepareStatement("insert into messages values (?,?,?,?,?,sysdate)");
      ps.setInt(1,msgid);
      ps.setString(2,sender);
      ps.setString(3,receiver);
      ps.setString(4,subject);
      ps.setString(5,body);
      ps.executeUpdate();

     }
     catch(Exception ex)
     {  return ex.getMessage(); }
     finally
     {
        Database.clean(con,ps);
     }
     return null;
    } // end of add()

    public String delete(String  msgid)
    {

     // get access to  Object
     Connection con = null;
     PreparedStatement ps = null;
     try
     {
      con = Database.getConnection();
      ps = con.prepareStatement("delete from messages where msgid = ?");
      ps.setString(1,msgid);
      ps.executeUpdate();
     }
     catch(Exception ex)
     {  return ex.getMessage(); }
     finally
     {
        Database.clean(con,ps);
     }
     return null;
  } // end of delete()

} // end of bean








