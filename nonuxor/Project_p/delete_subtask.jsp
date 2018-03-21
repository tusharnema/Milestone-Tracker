<%@ page
  import="java.sql.*,com.cl.sql.PoolManager,oracle.jdbc.driver.OracleTypes,oracle.sql.CLOB,java.io.*,java.text.*, java.net.*,com.cl.auth.EncrDec,com.cl.auth.IlligalAccess,java.util.*,org.apache.log4j.*"
  buffer="none"%>

  <%


    int taskId=0;
  int project_id=0;
 
taskId=Integer.parseInt(request.getParameter("taskid"));
 project_id = (Integer) session.getAttribute("projectSession");
   session.setAttribute("projectSession",project_id);

  String status = "";
  
  Connection connection = null;
  PoolManager poolManager = PoolManager.getInstance();
  Category logCategory = Category.getInstance("clsite.mywain.project_list.jsp");
  connection = poolManager.getConnection("erp");
  CallableStatement call = null;
  ResultSet rs = null;
  ResultSet rs1 = null;

  
  
  
 

try{


  String remove_subtask ="";

    
   remove_subtask = request.getParameter("subname");
  
  

  
   try{
        call = connection.prepareCall("CALL ERP.CL_INNOVATION_PKG.MT_DELETE_SUBTASK(?,?,?,?)");
        call.setInt(1,project_id);
        call.setInt(2,taskId);
        call.setString(3,remove_subtask);
		
        call.registerOutParameter(4,OracleTypes.VARCHAR);
		
        call.execute();
        status=call.getString(4);
        
        }catch(Exception e)
        {
            throw e;
        }
    


   
    

    
    
    
    
} catch (Exception exec) {
    //logCategory.error(exec);
    throw exec;
  } 

	  response.sendRedirect("project_page_new.jsp");
  

%>
