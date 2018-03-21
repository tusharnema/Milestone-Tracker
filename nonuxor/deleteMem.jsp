<%@ page
  import="java.sql.*,com.cl.sql.PoolManager,oracle.jdbc.driver.OracleTypes,oracle.sql.CLOB,java.io.*,java.text.*, java.net.*,com.cl.auth.EncrDec,com.cl.auth.IlligalAccess,java.util.*,org.apache.log4j.*"
  buffer="none"%>

  <%
  Integer projectSes = Integer.parseInt(request.getParameter("projectId"));
 Integer groupId = Integer.parseInt(request.getParameter("groupId"));
  String status = "";
  
  Connection connection = null;
  PoolManager poolManager = PoolManager.getInstance();
  Category logCategory = Category.getInstance("clsite.mywain.project_list.jsp");
  connection = poolManager.getConnection("erp");
  CallableStatement call = null;
  ResultSet rs = null;
  ResultSet rs1 = null;

  
  
  
 

try{


  String remove_mem ="";

    
   remove_mem = request.getParameter("memname");
  
  

  
   try{
        call = connection.prepareCall("CALL ERP.CL_INNOVATION_PKG.MT_DELETE_MEMBER(?,?,?)");
        call.setString(1,remove_mem);
		call.setInt(2,groupId);
        call.registerOutParameter(3,OracleTypes.VARCHAR);
		
        call.execute();
        status=call.getString(3);
        
        }catch(Exception e)
        {
            throw e;
        }
    


   
    

    
    
    
    
} catch (Exception exec) {
    //logCategory.error(exec);
    throw exec;
  } 
  if(status.equals("DELETED"))
	  response.sendRedirect("pd.jsp?projectId="+projectSes);
  else
	  response.sendRedirect("http://google.co.in");

%>
