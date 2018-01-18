<%@ page import="java.sql.*"%>
<html>
<link rel="stylesheet"  href="style.css">
<body>
<h2>Send Message</h2>

<jsp:useBean id="member" class="classmates.MemberBean" scope="session" />

<form action="sendmessage.jsp" method=post>
<table cellpadding=3>
<tr>
<td> To
<td>
<select name=receiver>
<%
   Connection con  = member.getConnection();
   PreparedStatement ps = con.prepareStatement("select lname,fullname from members where lname <> ?"); 
   ps.setString(1, member.getLname());
   ResultSet rs = ps.executeQuery();
   while ( rs.next())
   {
%>
<option  value=<%=rs.getString("lname")%>> <%=rs.getString("fullname")%>

<%
   }
   rs.close();
   ps.close();
   con.close();
%>
</select>
</tr>
<tr>
<td>
Subject
<td>
<input type=text name=subject size=50> 
</tr>
<tr>
<td>Body
<td>
<textarea name=body  cols=50 rows=5></textarea>
</td>
</tr>
</table>

<input type=submit value="Add">
<input type=reset value="Clear All">

<p>
<a href="home.jsp">Home Page</a>

<%
   // return if it is first time
   if ( request.getParameter("subject") == null)   return;
%>

<jsp:useBean id="message"  class="classmates.MessageBean"  scope="page" />
<jsp:setProperty name="message" property="*"/>
<h4>
<%

  String msg  = message.add(member);
  if ( msg == null) 
      out.println("Member has been sent successfully");
  else
      out.println("Error : " + msg);
 
%>
</table>
</body>
</html>
     
    
   
