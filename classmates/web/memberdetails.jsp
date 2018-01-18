<link rel="stylesheet"  href="style.css">

<jsp:useBean id="member" class="classmates.MemberBean" scope="session" />

<%@page import="java.sql.*,classmates.*"%>
<%
    String mid=request.getParameter("mid");
    Connection con = Database.getConnection();
    PreparedStatement ps = con.prepareStatement("select * from members where mid = ?");
    ps.setString(1,mid);
    ResultSet rs = ps.executeQuery();
    rs.next();
%>
<h2>Member Details</h2>

<table>
<tr>
<td valign="top">


<table border=1 cellpadding=5>
<tr>
<td>Name 
<td><%=rs.getString("fullname")%>
</tr>
<tr>
<td>Branch
<td><%=rs.getString("branch")%>
</tr>

<tr>
<td>Year Passed
<td><%=rs.getString("year")%>
</tr>

<tr>
<td>Email
<td><%=rs.getString("email")%>
</tr>

<tr>
<td>Address
<td><%=rs.getString("address")%>
</tr>

<tr>
<td>Phone No.
<td><%=rs.getString("phone")%>
</tr>

<tr>
<td>Qualification
<td><%=rs.getString("qual")%>
</tr>


<tr>
<td>Current Occupation 
<td><%=rs.getString("occup")%>
</tr>

<tr>
<td>From Date 
<td><%=rs.getString("fromdate")%>
</tr>
</table>
</td>
<td valign="top">
<img src=pictures\<%=mid%>.jpg width=100 height=100>

<p>
<a href=sendmessage.jsp?mid=<%=mid%>>Send Message</a>
</td>
</tr>
</table>

<h3>Family Members </h3>

<%
     rs.close();
     ps = con.prepareStatement("select * from familymembers where mid = ?");
     ps.setString(1,mid);
     
     rs = ps.executeQuery();

%>
<table border=1 cellpadding=5>

<tr>
<th>Member Name
<th>Relationship
<th>Age
</tr>

<%
    while( rs.next())
    {
     
%>
<tr>
<td><%=rs.getString("fmname")%>
<td><%=rs.getString("fmrelation")%>
<td><%=rs.getString("fmage")%>
</tr>

<%
    }
    rs.close();
%>
</table>


<h3>Experience Details </h3>

<%
     rs.close();
     ps = con.prepareStatement("select * from member_experience where mid = ?");
     ps.setString(1,mid);
     
     rs = ps.executeQuery();

%>

<table border=1 cellpadding=5>

<tr>
<th>Company Name
<th>Postion
<th>Location
<th>From Date
<th>To Date
</tr>

<%
   while( rs.next())
   {
     
%>
<tr>
<td><%=rs.getString("company")%>
<td><%=rs.getString("occup")%>
<td><%=rs.getString("location")%>
<td><%=rs.getString("fromdate")%>
<td><%=rs.getString("todate")%>
</tr>

<%
    }
    rs.close();
%>
</table>


</body>
</html>
