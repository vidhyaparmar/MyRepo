
<link rel="stylesheet"   href="style.css">
<jsp:useBean id="member" scope="session"  class="classmates.MemberBean" />



<%@ page import="java.util.*,java.sql.*"%>

<style>
td {font:10pt verdana}
th {font:700 10pt verdana}
h2 {font:700 16pt arial}
a {font:700 10pt verdana;color:darkgreen}
</style>


<center>
[<a href="changedetails.jsp">Change Details</a>] &nbsp;&nbsp;
[<a href="changepassword.jsp">Change Password</a>] &nbsp;&nbsp;
[<a href="addfamilymember.jsp">Add Family Member</a>] &nbsp;&nbsp;
[<a href="editfamilymembers.jsp">Edit Family Members</a>] &nbsp;&nbsp;
<br>
[<a href="addexperience.jsp">Add Experience</a>] &nbsp;&nbsp;
[<a href="searchclassmates.jsp">Search Classmates</a>] &nbsp;&nbsp;
[<a href="sendmessage.jsp">Send Message</a>] &nbsp;&nbsp;
[<a href="inbox.jsp">Inbox </a>] &nbsp;&nbsp;
[<a href=logout.jsp> Logout </a>]


<h2>Recently Registered Members </h2>

<%
    request.setAttribute("query","select *  from ( select * from members order by dj desc) where rownum <= 5");
%>
<jsp:include  page="memberslist.jsp" />

</center>
</body>
</html>
