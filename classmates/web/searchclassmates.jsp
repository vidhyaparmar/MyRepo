<jsp:useBean id="member" scope="session"   class="classmates.MemberBean"/>

<%@ page import="java.sql.*,classmates.*"%>

<html>
<link rel="stylesheet" href="style.css">
<body>
<h2>Search Classmates </h2>
<%
  String  fullname =  request.getParameter("fullname");
  if ( fullname == null) fullname= "";

  String  branch=  request.getParameter("branch");
  if (branch == null)  branch = "ALL";
  
  String  year =  request.getParameter("year");
  if ( year== null)  year = "";

  String  address =  request.getParameter("address");
  if ( address == null)  address = "";
%>

<form action="searchclassmates.jsp" method="post">
<table>
<tr> 
<td>Name Contains
<td><input type=text size=30  value='<%=fullname%>' name=fullname>
</tr>

<tr>
<td>Branch
<td>
<select name=branch>
<option  value="ALL" <%= branch.equals("ALL")?"SELECTED":"" %> >ALL</option>
<option value="BECS" <%= branch.equals("BECS")?"SELECTED":"" %> >BE CS</options>
<option value="BEEC" <%= branch.equals("BEEC")?"SELECTED":"" %> >BE EC</options>
<option value="MCA" <%= branch.equals("MCA")?"SELECTED":"" %> >MCA</options>
</select>
Year of Passing
<input type=text size=10  value='<%=year%>' name=year>
</td>
</tr>
<tr> 
<td>Address Contains
<td><input type=text size=30  value='<%=address%>' name=address>
</tr>
</table>
<p>
<input type=submit value=Search>
</form>
<%
  if (request.getParameter("fullname") == null)
  return;
	  
  String  cond = " mid <> " + member.getMid();
  
  if  ( fullname.length() >  0 )
     cond = cond + "  and  fullname  like '%"  + fullname + "%'";

  if  ( ! branch.equals("ALL") )
     cond = cond + "  and  branch = '"  + branch+ "'";

  if  ( address.length() >  0 )
     cond = cond + "  and address like '%"  + address + "%'";

  if  ( year.length() >  0 )
     cond = cond + "  and year = "  + year;

  String query = "select  * from members where " +  cond;
%>

  
<table border=1 cellpadding="5" width=100%>
<tr>
<th>Full Name
<th>Occupation
<th>Branch
<th>Year
</tr>
  
 <%
     Connection con = Database.getConnection();
     Statement st = con.createStatement();
     ResultSet rs = st.executeQuery(query);
     while ( rs.next())
     {

%>
  
<tr>
<td>
<a href=memberdetails.jsp?mid=<%=rs.getString("mid")%>> 
<%=rs.getString("fullname")%></a>
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
</body>
</html>
  
