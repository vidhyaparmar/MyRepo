<%@ page import="org.apache.commons.fileupload.*,java.util.*,java.io.*"%>
<html>
<link rel="stylesheet"  href="style.css">
<body>
<h2>Upload Member Photo</h2>
<form action="addphoto.jsp"  method="post"  enctype="multipart/form-data">
Select a .jpg file :  <input type=file name=file>
<p>
<input type=submit value="Upload">
</form>
<p>
<jsp:useBean id="member" class="classmates.MemberBean" scope="session" />
<%
     
   // Check that we have a file upload request
   boolean isMultipart = FileUpload.isMultipartContent(request);
   if ( !isMultipart ) return;
   
   
   // Create a new file upload handler 
   DiskFileUpload upload = new DiskFileUpload();
   
   // parse request
   List items = upload.parseRequest(request);
  

   // get uploaded file 
   FileItem  file = (FileItem) items.get(0);
          
   File outfile = new File( request.getRealPath("pictures") + "\\" +  member.getMid() + ".jpg");
   file.write(outfile);
   
   out.println("Photo Uploaded Successfully!");

%>

   
  
</body>
</html>   
