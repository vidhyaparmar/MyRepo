<html>
<body>
<link rel="stylesheet"   href="style.css">
<jsp:useBean id="member" scope="session"  class="classmates.MemberBean" />

<%@ page import="java.util.*,java.sql.*,classmates.*"%>

<div style="background-color:navy;color:white;font:700 12pt verdana">
Welcome, <jsp:getProperty name="member" property="fullname"/>
</div>
   
<h2>Inbox</h2>

<table width=100% border=1>
<tr style="background-color:maroon;color:wheat">
<th>Date
<th>Subject
<th>From

</tr>

<%
    Connection con = Database.getConnection();
    PreparedStatement ps = con.prepareStatement("select msgid,fullname,subject,senton from messages msg,members m  where msg.sender = m.mid and  receipient = ? order by senton desc");
    ps.setString(1,member.getMid());
    ResultSet rs = ps.executeQuery();
    while ( rs.next())
    { 
%>

<tr>
<td><%=rs.getString("senton")%>
<td><a href=message.jsp?msgid=<%=rs.getString("msgid")%>>
<%=rs.getString("subject")%>
</a>

<td><%=rs.getString("fullname")%>
</tr>
<%
    }
    rs.close();
    ps.close();
    con.close();
%>

</table>
</body>
</html>
