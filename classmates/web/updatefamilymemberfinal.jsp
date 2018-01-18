<html>
<body>
<link rel="stylesheet"  href="style.css">


<jsp:useBean id="member" class="classmates.MemberBean" scope="session" />
<%@page import="java.sql.*,classmates.*"%>

<%
  String oldfmname,fmname,rel,age;
  
  oldfmname = request.getParameter("oldfmname");
  fmname = request.getParameter("fmname");
  rel = request.getParameter("rel");
  age = request.getParameter("age");
%>

 
<jsp:useBean id="family" class="classmates.FamilyMember" scope="page" />
<jsp:setProperty name="family" property="*"/>

<table border=1 cellpadding=5  width=100%>
<tr style="color:white;background-color:navy;font:700 12pt verdana">
<td>Result</td>
<tr>
<td>

<%
  String msg = family.update(member.getMid(),oldfmname);
  if ( msg == null)
     out.println("Family Member Details Updated Successfully!");
  else
     out.println("Error : " + msg);
%>


</tr>
</table>
<p>
<a href="editfamilymembers.jsp">Family Memebers </a>
</body>
</html>