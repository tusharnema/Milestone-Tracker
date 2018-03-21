<%@ page language="java" import="java.util.*,java.io.*,java.sql.*,com.cl.sql.PoolManager,org.apache.log4j.*, oracle.jdbc.driver.*,oracle.sql.BLOB,com.oreilly.servlet.multipart.*, com.oreilly.servlet.*" %>

<%		



Integer projectSes = (Integer) session.getAttribute("projectSession");

   session.setAttribute("projectSession",projectSes);



	int userId = 0;
		try{ userId = Integer.parseInt((String)session.getAttribute("userId"));}catch(Exception e){userId=0;}  //getting userid of person who is logged in i.e the user on which the session is named.
	if(userId<=0)
	{
	  response.sendRedirect("login.jsp"); //if no user is logged in, first redirect to the login page
	  return;
	}
	
	
PoolManager pool = PoolManager.getInstance();
Connection connection = null;
CallableStatement call = null;
ResultSet rs = null;
String errorMsg="";
Enumeration en = null;
String fieldName = "";
String systemFileName = "";
java.io.File uploadFile = null;
int count = 0;

String folderPath = "/wain-new/test/nonuxor/attach";
String phyDir = application.getRealPath(folderPath);
java.io.File f = new java.io.File(phyDir);
String fileType="";
String fileUrl="";

if(!f.exists())
{
	f.mkdir();
}

MultipartRequest req = new MultipartRequest(request, phyDir, 1073741824, new DefaultFileRenamePolicy());
 

	int taskId=0;
 try {
taskId=Integer.parseInt(req.getParameter("taskid"));} catch(Exception exec ){taskId=0;}

String  status="";
	String sub_name = req.getParameter("sub_name"); //get data from form and store it in respective variables
	String student_remark = req.getParameter("rmk");
	
	out.println(sub_name);
	out.println(student_remark);
	out.println(userId);
	out.println(projectSes);
	out.println(taskId);
	
  try
	{
		connection = pool.getConnection("erp");

		en = req.getFileNames();
		call=connection.prepareCall("{CALL erp.CL_INNOVATION_PKG.MT_FILE_UPLOAD(?,?,?,?,?,?,?)}");

		while(en.hasMoreElements()){
			
			fieldName = (String)en.nextElement();
		if(fieldName.equals("fileUpload")){
		   uploadFile = req.getFile(fieldName);
		   systemFileName = req.getFilesystemName(fieldName);														 
		   fileType = (systemFileName.substring(systemFileName.lastIndexOf(".")+1,systemFileName.length())); 
		   fileUrl =  folderPath+"/"+userId+"."+fileType;
		   	out.println(fileUrl);

		   String filePath = phyDir + java.io.File.separator+userId+"."+fileType;

		   if(uploadFile != null)
			{
				if(uploadFile.length() > 0)
				{
					call.setInt(1,projectSes);		
					call.setInt(2,taskId);	
					call.setInt(3,userId);	
					call.setString(4,sub_name);
					call.setString(5,fileUrl);
					call.setString(6,student_remark);
					call.registerOutParameter(7,OracleTypes.VARCHAR);
					call.execute();	
					status = call.getString(7);

					try
						{
							if(filePath != null)
							{
								File file = new File(filePath);
								if(file.exists())
								{
									file.delete();
								}
							}
						}
						catch(SecurityException ex){} 
						java.io.File fileNewName = new File(filePath);
					    uploadFile.renameTo(fileNewName);
				}
			}
		}
		}
	}catch(SQLException e)
	{
		throw e;
	}	
	finally
	{
		try{call.close();}catch(Exception ex){}
		pool.freeConnection("erp",connection);
	}
	out.println(status);
	if(status.equals("OK"))
	{
		
%>		
	 <script>
		alert("File Uploaded Successfully");
		window.opener.location.reload(true);
		window.close();
	 </script>
	 
<%	
		response.sendRedirect("project_new_student.jsp");
	}else
	{
%>		
	 <script>
		alert("Failed While Uploding File");
		window.close();
	 </script>
<%
	}
%>