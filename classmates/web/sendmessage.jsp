<%@ page import="java.sql.*"%>
<html>
<link rel="stylesheet"  href="style.css">
<body>
<h2>Send Message</h2>

<jsp:useBean id="member" class="classmates.MemberBean" scope="session" />
<jsp:setProperty  name="member" property="*" />

<form action="sendmessage.jsp" method=post>
<input type=hidden value=<%=request.getParameter("mid")%> name="mid" >
<table cellpadding=3>
<tr>
<td>
Subject
<td>
<input type=text name=subject size=50> 
</tr>
<tr>
<td>Body
<td>
<textarea name=body  cols=50 rows=5></textarea>
</td>
</tr>
</table>

<input type=submit value="Send">

<%
  // return if it is first time
  if ( request.getParameter("subject") == null)  return;
  
  String mid = request.getParameter("mid");
%>

<jsp:useBean id="message"  class="classmates.MessageBean"  scope="page" />
<jsp:setProperty name="message" property="*"/>

<p>
<table border=1 cellpadding=5 width=100%>
<tr style="color:white;background-color:navy;font:700 10pt verdana">
<td>Result</td>
</tr>
<tr>
<td>
<%
  String msg  = message.send(member.getMid(),mid);
  if ( msg == null) 
     out.println("Member has been sent successfully");
  else
      out.println("Error : " + msg);
 
%>
</tr>
</table>

</body>
</html>
     
    
   
