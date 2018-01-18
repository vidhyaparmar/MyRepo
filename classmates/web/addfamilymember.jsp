<%@ page import="java.sql.*"%>
<html>
<link rel="stylesheet"  href="style.css">
<body>
<jsp:useBean id="member" class="classmates.MemberBean" scope="session" />

<jsp:useBean id="familymember"  class="classmates.FamilyMember"  scope="page" />
<jsp:setProperty name="familymember" property="*"/>

<table border=1 width="100%">
<tr style="background-color:navy;color:white;font:700 12pt verdana">
<td>Result </td>
</tr>
<tr>
<td>
<%

  String msg = familymember.add(member.getMid());
  if ( msg == null) 
      out.println("Family Member Is Added Successfully!");
  else
      out.println("Error : " + msg);
 
%>
<p>
To add another member click <a href="addfamilymember.html">here</a>
<p>
To goto home page click <a href="homepage.jsp">here</a>
</td>
</tr>
</table>
</body>
</html>
     
    
   
