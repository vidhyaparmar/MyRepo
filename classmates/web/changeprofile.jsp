<html>
<link rel="stylesheet"  href="style.css">
<body>


<%@page import="java.sql.*,classmates.*"%>
<jsp:useBean id="member" class="classmates.MemberBean" scope="session" />

<%
     // load data from table
     Connection con = Database.getConnection();
     PreparedStatement ps = con.prepareStatement("select phone,address,qual,occup,to_char(fromdate,'dd-mon-yy') fromdate from members where mid = ?");
     ps.setString(1,member.getMid());
     ResultSet rs = ps.executeQuery();
     rs.next();
   
%>

<h2>Change Member Profile </h2>

<form action="changeprofilefinal.jsp" method="post">
<table>
<tr>
<td>
Phone Number
<td>
<input type=text name=phone size=30 value='<%=rs.getString("phone")%>'>
</tr>
<tr>
<td>
Address
<td>
<textarea  name=address rows=5 cols=30><%=rs.getString("address")%></textarea>
</tr>

<tr>
<td>
Qualification
<td>
<input type=text  name=qual  size=30  value='<%=rs.getString("qual")%>'>
</tr>

<tr>
<td>
Occupation
<td>
<input type=text name=occup size=50 value='<%=rs.getString("occup")%>'>
</tr>
	
	
<tr>
<td>
From Date
<td>
<input type=text name=fromdate size=10 value='<%=rs.getString("fromdate")%>'>
</tr>

</table>
<p>

<input type=submit value="Change">
<input type=reset value="Clear All">
<p>
</form>

<%

     rs.close();
     ps.close();
     con.close();
%>
</body>
</html>   