<link rel="stylesheet"  href="style.css">
<h2>Updating Family Member Details</h2>
<jsp:useBean id="member" class="classmates.MemberBean" scope="session" />

<%@page import="java.sql.*,classmates.*"%>


<%
  String fmname,rel,age;
  
  fmname = request.getParameter("fmname");
  Connection con = Database.getConnection();
  PreparedStatement ps = con.prepareStatement("select * from familymembers where mid = ? and fmname = ?");
  ps.setString(1,member.getMid());
  ps.setString(2, fmname);
  ResultSet rs = ps.executeQuery();
  rs.next();
  fmname = rs.getString("fmname");
  rel= rs.getString("fmrelation");
  age = rs.getString("fmage");
  rs.close();
  ps.close();
  con.close();

%>

<form  action="updatefamilymemberfinal.jsp" method="post">
<table cellpadding=3>
<tr>
<td >Family Member Name
<td>
<input type=hidden name=oldfmname value='<%=fmname%>'>
<input type=text name=fmname size=20  value='<%=fmname%>'>
</tr>
<tr>
<td>
Relationship
<td>
<select name=rel>
<option value=daughter <%=rel.equals("daughter")?"SELECTED":""%>>Daughter
<option value=son <%=rel.equals("son")?"SELECTED":""%>>Son
<option value=spouse <%=rel.equals("spouse")?"SELECTED":""%>>Spouse
</select>
</td>
</tr>

<tr>
<td>Age
<td><input type=text name=age size=10   value=<%=age%>>  
</tr>
</table>

<input type=submit value="Update">
<input type=reset value="Clear All">
</form>

</body>
</html>
     
    
   



