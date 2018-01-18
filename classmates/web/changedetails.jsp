<jsp:useBean id="member" class="classmates.MemberBean" scope="session" />
<jsp:setProperty  name="member" property="*" />

<%
   if ( request.getParameter("phone") != null)
   {
      // update data in the table with the changes made in the form
      member.updateDetails();
   }
%>

<html>
<link rel="stylesheet"  href="style.css">

<%
  // get details from table - MEMBERS
   

%>

 
<body>
<center>
<h2>Change Details </h2>
<hr>
<form action="changedetails.jsp" method="post">
<table>
<tr>
<td>
Phone Number
<td>
<input type=text name=phone size=30 value='<%=member.getPhone()%>'>
</tr>
<tr>
<td>
Email
<td>
<input type=text name=email size=30 value='<%=member.getEmail()%>'>
</tr>
<tr>
<td>
Address
<td>
<textarea  name=address rows=5 cols=30><%=member.getAddress()%></textarea>
</tr>

<tr>
<td>
Occupation
<td>
<input type=text name=occup size=50 value='<%=member.getOccup()%>'>
</tr>

<tr>
<td>
Qualification
<td>
<input type=text  name=qual  size=30  value='<%=member.getQual()%>'>
</tr>
	
</table>
<p>

<input type=submit value="Change">
<input type=reset value="Clear All">
<p>
<a href="home.jsp">Go Back</a>
</form>

</center>
</body>
</html>   