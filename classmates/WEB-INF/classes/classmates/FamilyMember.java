// FamilyMember
package  classmates;

import java.sql.*;
import java.util.*;
import classmates.*;

public class FamilyMember
{
    private  String fmname;
    private  String rel;
    int age;

    public  void setFmname(String fmname)
    { this.fmname = fmname; }

    public String getFmname()
    {  return fmname; }

    public  void setRel(String rel)
    { this.rel= rel; }

    public String getRel()
    {  return rel; }

    public int getAge()
    {  return age;
    }

    public void setAge(int age)
    {   this.age = age; }

    public String add(String mid)
    {

     // get access to  Object
     Connection con = null;
     PreparedStatement ps = null;
     try
     {
      con = Database.getConnection();
      //insert question
      ps = con.prepareStatement("insert into familymembers  values (?,?,?,?)");
      ps.setString(1,mid);
      ps.setString(2,fmname);
      ps.setString(3,rel);
      ps.setInt(4,age);
      if ( ps.executeUpdate() == 1 )
           return null;
      else
           return "Could not insert details";
     }
     catch(Exception ex)
     {
      return ex.getMessage();
     }
     finally
     {
      Database.clean(con,ps);
     }
  } // end of add()



  public String delete(String mid)
  {
     Connection con = null;
     PreparedStatement ps = null;
     try
     {
      con = Database.getConnection();
      //insert question
      ps = con.prepareStatement("delete from familymembers where mid = ? and fmname = ?");
      ps.setString(1,mid);
      ps.setString(2,fmname);  // value for fmname is set through property
      ps.executeUpdate();
     }
     catch(Exception ex)
     {
	 return ex.getMessage();
     }
     finally
     {
       Database.clean(con,ps);
     }
     return null;
  } // end of add()


   public String update(String mid, String oldfmname)
   {
     Connection con = null;
     PreparedStatement ps = null;
     try
     {
      con = Database.getConnection();
      //insert question
      ps = con.prepareStatement("update familymembers set fmname =  ?, fmrelation= ? , fmage = ? where mid = ? and fmname = ?");
      ps.setString(1,fmname);
      ps.setString(2,rel);
      ps.setInt(3,age);
      ps.setString(4,mid);
      ps.setString(5,oldfmname);
      ps.executeUpdate();
     }
     catch(Exception ex)
     {
       return ex.getMessage();
     }
     finally
     {
       Database.clean(con,ps);
     }
     return null;
  } // end of add()


} // end of bean








