<link rel="stylesheet"  href="style.css">

<jsp:useBean id="member" class="classmates.MemberBean" scope="session" />

<%@page import="java.sql.*"%>

<h2>InBox</h2>

<%
    Connection con = member.getConnection();
    PreparedStatement ps = con.prepareStatement("select mid,fullname,sender,subject,body,senton from messages,members  where messages.sender = members.lname and  receipient = ?");
    ps.setString(1,member.getLname());
    ResultSet rs = ps.executeQuery();
    while ( rs.next())
    { 
%>

<table width=100%>
<tr>
<td style="color:blue">
Sender
<td><%=rs.getString("fullname")%>
</tr>

<tr>
<td style="color:blue">Subject
<td><%=rs.getString("subject")%>
</tr>

<tr>
<td style="color:blue">Sent On
<td><%=rs.getString("senton")%>
</tr>
</table>

<pre>
<%=rs.getString("body")%>
</pre>


<a href=deletemessage.jsp?mid=<%=rs.getInt("mid")%>>Delete</a> 

<hr>

<p>

<%
    }
    rs.close();
    ps.close();
    con.close();
%>

<a href="home.jsp">Home Page</a>


