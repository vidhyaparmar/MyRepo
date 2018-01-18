<link rel="stylesheet"  href="style.css">

<jsp:useBean id="member" class="classmates.MemberBean" scope="session" />

<html>
<body>

<%@page import="java.sql.*,classmates.*"%>

<h2>Family Members </h2>

<%
     Connection con = Database.getConnection();
     PreparedStatement ps = con.prepareStatement("select fmname,fmrelation,fmage  from familymembers where mid = ?");
     ps.setString(1,member.getMid());
     
     ResultSet rs = ps.executeQuery();

%>
<table border=1 cellpadding=5>

<tr style="color:white;background-color:navy;font:700 10pt verdana">
<th>Member Name
<th>Relationship
<th>Age
<th>Options
</tr>

<%
 while( rs.next())
 {
     
%>
<tr>
<td><%=rs.getString("fmname")%>
<td><%=rs.getString("fmrelation")%>
<td><%=rs.getString("fmage")%>
<td>
<a href="deletefamilymember.jsp?fmname=<%=rs.getString(1)%>">Delete</a>
&nbsp;
<a href="updatefamilymember.jsp?fmname=<%=rs.getString(1)%>">Edit</a>
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
