// Member Bean

package  classmates;

import java.sql.*;
import java.util.*;

public class MemberBean
{
    private  String mid,pwd,email,fullname;

    public String getMid()
    {
     return mid;
    }
    public  void setFullname(String fullname)
    { this.fullname =fullname; }

    public String getFullname()
    {  return fullname; }

    public  void setPwd(String pwd)
    { this.pwd= pwd; }

    public String getPwd()
    {  return pwd; }

    public  void setEmail (String email)
    { this.email = email; }

    public String getEmail()
    {  return email; }

    public boolean login()
    {
     Connection con = null;
     PreparedStatement ps = null;
     boolean logged = false;
     try
     {
      con = Database.getConnection();
      ps = con.prepareStatement("select mid,fullname from members where email = ? and pwd= ?");
      ps.setString(1,email);
      ps.setString(2,pwd);

      ResultSet rs = ps.executeQuery();

      if ( rs.next())
      {
            mid = rs.getString("mid");
            fullname = rs.getString("fullname");
            logged = true;
      }

  }
  catch(Exception ex)
  {
      System.out.println( ex.getMessage());
  }
  finally
  {
       Database.clean(con,ps);
  }
  return logged;

 } // end of login


 public boolean updateProfile(String phone, String address, String qual, String occup, String fromdate)
 {
   Connection con = null;
   PreparedStatement ps= null;

   try
   {
     con = Database.getConnection();
     String cmd = "update members set phone  = ? , address =?, qual= ?, occup = ?, fromdate = ?  where mid = ? ";

     ps = con.prepareStatement(cmd);
     ps.setString(1,phone);
     ps.setString(2,address);
     ps.setString(3,qual);
     ps.setString(4,occup);
     ps.setString(5,fromdate);
     ps.setString(6,mid);

     int cnt = ps.executeUpdate();
     if ( cnt==1 )
        return true;
     else
        return false;

  }
  catch(Exception ex)
  {
      System.out.println( ex.getMessage());
      return false;
  }
  finally
  {
       Database.clean(con,ps);
  }

 } // end of updateProfile


 public boolean updatePassword(String newpwd)
 {
   Connection con = null;
   PreparedStatement ps= null;

   try
   {
     con = Database.getConnection();
     String cmd = "update members set pwd=?  where mid = ? ";

     ps = con.prepareStatement(cmd);
     ps.setString(1,newpwd);
     ps.setString(2,mid);

     int cnt = ps.executeUpdate();
     if ( cnt==1 )
     {  pwd = newpwd;
        return true;
     }
     else
        return false;

  }
  catch(Exception ex)
  {
      System.out.println( ex.getMessage());
      return false;
  }
  finally
  {
       Database.clean(con,ps);
  }

 } // end of updatePassword

/*
  public  boolean  registerUser()  throws Exception
  {
      Properties h = new Properties();
      h.put(Context.INITIAL_CONTEXT_FACTORY, "weblogic.jndi.WLInitialContextFactory");
      h.put(Context.PROVIDER_URL, "t3://localhost:7001");
      Context ctx =  new InitialContext(h);

      Object home= (classmates.ejb.MemberHome) ctx.lookup("classmates.member");
      classmates.ejb.MemberHome mhome = (classmates.ejb.MemberHome) home;
      classmates.ejb.Member member=null;

      try
      {
       member = (classmates.ejb.Member) mhome.create(lname,pwd,fullname,email,phone,address,qual,occup,fromdate,branch,year);
       return true;
      }
      catch(Exception ex)
      {
        System.out.println(ex.getMessage());
        return false;
      }

  } // end of registerUser


*/
} // end of bean








