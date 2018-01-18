<html>
<body>
<link rel="stylesheet"  href="style.css">


<jsp:useBean id="member" class="classmates.MemberBean" scope="session" />
<%@page import="java.sql.*,classmates.*"%>

<%
  String  phone,address,qual,occup,fromdate;
  
 
  phone = request.getParameter("phone");
  address = request.getParameter("address");
  qual = request.getParameter("qual");
  occup = request.getParameter("occup");
  fromdate = request.getParameter("fromdate");

%>

<table border=1 cellpadding=5  width=100%>
<tr style="color:white;background-color:navy;font:700 12pt verdana">
<td>Result</td>
<tr>
<td>

<%
  if (  member.updateProfile(phone,address,qual,occup,fromdate) )
       out.println("Member Profile Updated Successfully!");
  else
       out.println("Sorry! Member profile could not be changed!" );
%>


</tr>
</table>

<p>

<a href="homepage.jsp">Home Page</a>
</body>
</html>