<html>
<body>
<link rel="stylesheet"  href="style.css">

<jsp:useBean id="member" class="classmates.MemberBean" scope="session" />

<%@page import="java.sql.*,classmates.*"%>

<h2>Message Details</h2>

<%
    String msgid = request.getParameter("msgid");
    
    Connection con = Database.getConnection();
    PreparedStatement ps = con.prepareStatement("select fullname,sender,subject,body,senton from messages ms,members m  where ms.sender = m.mid and  msgid  = ?");
    ps.setString(1,msgid);
    ResultSet rs = ps.executeQuery();
    rs.next();
%>    
   
<table width=100% border=1>
<tr>
<td>
Sender
<td>
<a href=memberdetails.jsp?mid=<%=rs.getString("sender")%>>
<%=rs.getString("fullname")%></a>
</tr>

<tr>
<td>Subject
<td><%=rs.getString("subject")%>
</tr>

<tr>
<td>Sent On
<td><%=rs.getString("senton")%>
</tr>

<tr>
<td>Body 
<td><pre><%=rs.getString("body")%></pre>
</tr>
</table>
<p>
<a href=deletemessage.jsp?msgid=<%=msgid%>>Delete</a> 
&nbsp;&nbsp;
<a href=sendmessage.jsp?mid=<%=rs.getString("sender")%>>Reply</a> 
&nbsp;&nbsp;
<a href=homepage.jsp>Inbox</a> 

<%
    rs.close();
    ps.close();
    con.close();
%>

</body>
</html>