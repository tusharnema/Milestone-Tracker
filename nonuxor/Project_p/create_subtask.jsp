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
 




	
   Integer taskId = (Integer) session.getAttribute("taskId");
  String subtask_name = req.getParameter("sub_name"); //get data from form and store it in respective variables
  String subtask_description = req.getParameter("sub_desc");
  
  
  String start_date=req.getParameter("sd");
  String end_date=req.getParameter("ed");
  String status="";


  String[] person= req.getParameterValues("mem"); 
 
String personk="";
	
	out.println(subtask_name);
	//out.println(student_remark);
	out.println(userId);
	out.println(projectSes);
	
	
  try
	{
		connection = pool.getConnection("erp");

		en = req.getFileNames();
    int j=0;
		
    for (int i = 0; i < person.length; i++) 



{
j++;
  out.println(person[i]);

personk = person[i];
    call = connection.prepareCall("{call erp.CL_INNOVATION_PKG.ADD_SUBTASK(?,?,?,?,?,?,?,?,?,?)}");

    while(en.hasMoreElements()){
      
      fieldName = (String)en.nextElement();
    if(fieldName.equals("fileUpload")){
       uploadFile = req.getFile(fieldName);
       systemFileName = req.getFilesystemName(fieldName);                            
       fileType = (systemFileName.substring(systemFileName.lastIndexOf(".")+1,systemFileName.length())); 
       fileUrl =  folderPath+"/"+userId+"."+fileType;
        out.println(fileUrl);

       String filePath = phyDir + java.io.File.separator+userId+"."+fileType;
        
          
    call.setInt(2,userId);
    call.setInt(1,taskId );
    call.setString(6,subtask_name );
    call.setString(7,subtask_description);
    call.setString(3,start_date );
    call.setString(4,end_date );
    call.setString(5,fileUrl);


   
            call.setString(8,personk );
      call.setInt(9,projectSes);
      call.registerOutParameter(10, OracleTypes.VARCHAR);
           call.execute();
        status = call.getString(10);

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
if(j!=1){
    call.setInt(2,userId);
    call.setInt(1,taskId );
    call.setString(6,subtask_name );
    call.setString(7,subtask_description);
    call.setString(3,start_date );
    call.setString(4,end_date );
    call.setString(5,fileUrl);


   
            call.setString(8,personk );
      call.setInt(9,projectSes);
      call.registerOutParameter(10, OracleTypes.VARCHAR);
           call.execute();
        status = call.getString(10);
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
    response.sendRedirect("project_page_new.jsp?projectId="+projectSes);
  }else
  {
%>    
   <script>
    alert("Failed While Uploding File");
    window.close();
   </script>
<%response.sendRedirect("http://google.co.in");
  }
%>