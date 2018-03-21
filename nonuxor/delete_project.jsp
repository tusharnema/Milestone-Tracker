<%@ page
  import="java.sql.*,com.cl.sql.PoolManager,oracle.jdbc.driver.OracleTypes,oracle.sql.CLOB,java.io.*,java.text.*, java.net.*,com.cl.auth.EncrDec,com.cl.auth.IlligalAccess,java.util.*,org.apache.log4j.*"
  buffer="none"%>

  <%
 
  String status = "";
  
  Connection connection = null;
  PoolManager poolManager = PoolManager.getInstance();
  Category logCategory = Category.getInstance("clsite.mywain.project_list.jsp");
  connection = poolManager.getConnection("erp");
  CallableStatement call = null;
  ResultSet rs = null;
  ResultSet rs1 = null;

  
  
  
 

try{


  String remove_project ="";

    
   remove_project = request.getParameter("proname");
  
  

  
   try{
        call = connection.prepareCall("CALL ERP.CL_INNOVATION_PKG.MT_DELETE_PROJECT(?,?)");
        call.setString(1,remove_project);
		
        call.registerOutParameter(2,OracleTypes.VARCHAR);
		
        call.execute();
        status=call.getString(2);
        
        }catch(Exception e)
        {
            throw e;
        }
    


   
    

    
    
    
    
} catch (Exception exec) {
    //logCategory.error(exec);
    throw exec;
  } 

	  response.sendRedirect("mentor.jsp");
  

%>
