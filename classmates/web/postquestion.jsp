<%@ page import="java.sql.*"%>
<html>
<style>
td {font:10pt verdana}
</style>

<body bgcolor="lavender">
<center>
<div style="color:lavender;background-color:purple;font:700 14pt arial">Post Question </div>

<jsp:useBean id="user" class="jd.UserBean" scope="session" />
<jsp:setProperty  name="user" property="*" />

<form action="postquestion.jsp" method=post>
<table cellpadding=3>
<tr>
<td width=15%>Select Topic 
<td>
<select name=topic>
<%
   Connection con = user.getConnection();
   Statement st = con.createStatement();
   ResultSet rs = st.executeQuery("select tcode,topic from topics order by topic");
   while ( rs.next())
   {
     out.println("<option value=" +  rs.getString("tcode") + ">" + rs.getString("topic") + "</option>");
   }
   rs.close();
   st.close();
   con.close();
%>
</select>
</tr>
<tr>
<td valign="top">Enter Question
<td><textarea name=question  rows=5 cols=60></textarea>
</tr>
</table>

<input type=submit value="Post Question">
<input type=reset value="Clear All">

<p>
<a href="home.jsp">Home Page </a>
<%
   if ( request.getParameter("topic") == null)   return;
%>



<jsp:useBean id="question"  class="jd.Question"  scope="page" />
<jsp:setProperty name="question" property="*"/>
<h3>
<%

    int qid= question.postQuestion(user);
    if ( qid > 0 )
         out.println("Question Posted Sucessfully!");
    else
         out.println("An Error Occurred While Posting Question");
%>
</h3>



</center>  
</body>
</html>
     
    
   
