<%@ page import="java.sql.*,java.util.*,javax.mail.internet.*,javax.mail.*,javax.activation.*"%>
<link href="style.css" rel="stylesheet">
<html>
<body>
<h2>Forgot Password</h2>
<form action="forgotpassword.jsp" method="post">
Enter your email address:  
<input type=text name=email  size=40>
<p>
<input type=submit value="Submit">
&nbsp;
<input type=button onclick="javascript:history.back()" value="Back">
</form>

<%
  String  email = request.getParameter("email");
  if (email == null ) return;

  Connection con = null;
  PreparedStatement  ps  = null;
  ResultSet rs = null;
  try
  {
  con = classmates.Database.getConnection();
  ps=  con.prepareStatement("select pwd from members where email = ?");
  ps.setString(1,email);
  rs = ps.executeQuery();

  if ( ! rs.next() )
     out.println("Sorry! Email Address Not Found In Our Database.");
  else
  {
   String   pwd = rs.getString("pwd");
   String body = "Dear Subscriber, <p>Here is your password :"+ pwd + "<p>Thank you for using this service. <p>Webmaster,<br>classmates.com";
   Properties props = System.getProperties();
   Session msession = Session.getDefaultInstance(props, null);
   Message msg = new MimeMessage(msession);
   msg.setFrom(new InternetAddress("admin@classroom.com"));
   msg.setRecipient(Message.RecipientType.TO, 
      new InternetAddress(email));
   msg.setDataHandler(
            new DataHandler(body,"text/html"));
  msg.setSubject("Password Recovery");
   // send message
  Transport.send(msg);
  out.println("Password is sent to email address. Please use those details to login.");
  } // else

 } // end of try
 catch ( Exception ex)
 {
     out.println("Sorry! Error : " + ex.getMessage());
 }
 finally
 {  
    rs.close();
    ps.close();
    con.close();
 }
%>
<p>
<a href=login.jsp>Login Page</a>
</body>
</html>   
