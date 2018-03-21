<%@ page
  import="java.sql.*,com.cl.sql.PoolManager,oracle.jdbc.driver.OracleTypes,oracle.sql.CLOB,java.io.*,java.text.*, java.net.*,com.cl.auth.EncrDec,com.cl.auth.IlligalAccess,java.util.*,org.apache.log4j.*"
  buffer="none"%>

  <%

  int projectId = 0;
  
  Integer projectSes = (Integer) session.getAttribute("projectSes");
   session.setAttribute("projectSes",projectSes);
  out.println(projectSes);
  int userId = 0;
  int groupId = 0;
  int status = 0;

  
    try{ userId = Integer.parseInt((String)session.getAttribute("userId"));}catch(Exception e){userId=0;}
  if(userId<=0)
  {
    response.sendRedirect("login.jsp");
    return;
  }


  String[] person= request.getParameterValues("mem"); 
  String[] ptype= request.getParameterValues("typ"); 

String personk="";
String ptypek="";

  Connection connection = null;
  PoolManager poolManager = PoolManager.getInstance();
  Category logCategory = Category.getInstance("clsite.mywain.project_list.jsp");
  connection = poolManager.getConnection("erp");
  CallableStatement call = null;
  ResultSet rs = null;


try{
    
	try{
	call = connection.prepareCall("{call erp.CL_INNOVATION_PKG.GET_GROUP(?,?)}");
    
    call.setInt(1,projectSes);	
  	call.registerOutParameter(2,OracleTypes.NUMBER);
	call.execute();
	groupId = call.getInt(2);
	out.println(groupId);
	}
	catch(Exception exec){
	throw exec;}
	
	
	

for (int i = 0; i < person.length; i++) {

personk = person[i];
ptypek = ptype[i];

    call = connection.prepareCall("{call erp.CL_INNOVATION_PKG.SAVE_MEMBERS(?,?,?)}");
    
    call.setInt(1,groupId);	
  	call.setString(2,personk);
  	call.setString(3,ptypek);

  	call.execute();
   

}





    
    
    
    
} catch (Exception exec) {
    //logCategory.error(exec);
    throw exec;
  } 
  if(status==1)
	  response.sendRedirect("pd.jsp");
  else
	  response.sendRedirect("pd.jsp");
%>