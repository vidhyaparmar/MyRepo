<jsp:useBean id="member" class="classmates.MemberBean" scope="session" />

<link rel="stylesheet"  href="style.css">
<html>
<script language="javascript">

function check()
{
   if ( f1.newpwd.value !=  f1.confirmpwd.value )
   {
         alert("New password and confirm password are not matching.");
         f1.confirmpwd.focus()
         return false;
   }
   return true;
}

</script>

  
<body>
<h2>Change Password </h2>
<form name=f1  onsubmit="return check()" action="changepassword.jsp" method="post">
<table>
<tr>
<td>
Old Password 
<td>
<input type=password name=oldpwd size=15>
</tr>
<tr>
<td>
New Password
<td>
<input type=password name=newpwd  size=15>
</tr>
<tr>
<td>
Confirm New Password
<td>
<input type=password name=confirmpwd  size=15>
</tr>
</table>
<p>
<input type=submit value="Change Password">
</form>

<%
    // process input 
 
   String oldpwd = request.getParameter("oldpwd");
   String newpwd = request.getParameter("newpwd");
 
   if (oldpwd == null ) return;
   
   if (! oldpwd.equals(member.getPwd()) )
   {
     out.println("Sorry! Invalid Password!");
     return;
   }
   
   if(member.updatePassword(newpwd) ) 
     out.println("Password Changed Successfully!");
   else
     out.println("Sorry! Some problem occurred while changing pasword!");
          
 %>
</body>
</html>   