
<jsp:useBean id="member" class="classmates.MemberBean" scope="session" />

<%@ page import="java.sql.*"%>

<table border=1 cellpadding="5">
<tr>
<th>Name
<th>Occupation
<th>Branch
<th>Year
</tr>

<%
     String query = (String) request.getAttribute("query");
     Connection con = member.getConnection();
     Statement st = con.createStatement();
     ResultSet rs = st.executeQuery(query);
     while ( rs.next())
     {

%>

<tr>
<td><a href=memberdetails.jsp?lname=<%=rs.getString("lname")%>><%=rs.getString("fullname")%></a>
<td><%=rs.getString("occup")%>

<td><%=rs.getString("branch")%>

<td><%=rs.getString("year")%>
</tr>


 <%
      }
      rs.close();
      st.close();
      con.close();
%>

      
</table>