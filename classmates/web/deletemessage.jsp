<html>
<body>
<jsp:useBean id="message" class="classmates.MessageBean" scope="page" />
<h5>
<%
  String msgid =request.getParameter("msgid");
  String msg =  message.delete(msgid);
  if ( msg == null)
     response.sendRedirect("homepage.jsp");
  else
     out.println("Error Occured During Deletion Of Message : " + msg);
%>
</h5>
</body>
</html>