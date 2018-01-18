<html>
<link rel="stylesheet" href="style.css">
<body>
<h1 align="center">CLASSMATES.COM </h1>
<table width="100%" height="100%">
<tr>
<td width="30%" style="background-color:tan" valign="top">
<h3>Login </h3>
<form  action="login.jsp" method=post>
<b>Email Address</b>
<br>
<input type=text size=30 name=email>
<br>
<b>Password</b>
<br>
<input type=password  size=20 name=pwd>
<p>
<input type=submit value="Login">
</form>

<%

if ( request.getParameter("email") != null )
{
%>

<jsp:useBean id="member" class="classmates.MemberBean" scope="session" />

<jsp:setProperty name="member"
   property="*" />
   
<%
   if  ( member.login() )
   {
    response.sendRedirect("home.jsp");
   }
   else
   {
     out.println("<p><span style=color:red>Invalid Login</span>");
    }
  }
%>
	   
<p>
<a href="forgotpassword.jsp">Forgot Password?</a>
<p>
<a href="register.html">New User? Register!</a>
   
</td>


<td valign="top">
<h3>About Classmates.com </h3>
This website allows students of XYZ college to get details about their classmates.

<p>
<h4>Contact Details: </h4>

<img src="image.gif">
</td>
</tr>
</table>
</body>
</html>
