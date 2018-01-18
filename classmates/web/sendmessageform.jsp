<%@ page import="java.sql.*,classmates.*"%>
<html>
<link rel="stylesheet"  href="style.css">
<body>
<h2>Send Message</h2>

<jsp:useBean id="member" class="classmates.MemberBean" scope="session" />

<form action="sendmessage.jsp" method=post>
Select Member 
<select name=mid>
<%
   Connection con  = Database.getConnection();
   PreparedStatement ps = con.prepareStatement("select mid,fullname || ',' || branch || ',' || year from members where  mid <> ? order by fullname"); 
   ps.setString(1, member.getMid());
   ResultSet rs = ps.executeQuery();
   while ( rs.next())
   {
%>
<option  value=<%=rs.getString("mid")%>> <%=rs.getString(2)%></option>
<%
   }
   rs.close();
   ps.close();
   con.close();
%>
</select>
<p>
<input type=submit value="Continue">
</form>
</body>
</html>
     
    
   
