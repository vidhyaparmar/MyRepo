<html>
<jsp:useBean id="member" class="classmates.MemberBean" scope="session" />
<jsp:setProperty  name="member" property="*" />

<%
   try
   {
        member.registerUser();
        out.println("<h4>User Registration Is Sucessful. Please click <a href=home.jsp>here</a> to continue..</h4>");
   }
   catch(Exception ex)
   {
        out.println("<h4>Error Occurred During User Creation. Error : " + ex.getMessage() + "<P>Use BACK button to try again!</h4>");
   }
%>




