<%@ page
	import="java.sql.*,com.cl.sql.PoolManager,oracle.jdbc.driver.OracleTypes,oracle.sql.CLOB,java.io.*,java.text.*, java.net.*,com.cl.auth.EncrDec,com.cl.auth.IlligalAccess,java.util.*,org.apache.log4j.*"
	buffer="none"%>
<%
Integer projectSes = (Integer) session.getAttribute("projectSession");

   session.setAttribute("projectSession",projectSes);
	
	int taskId=0;
	
	 try {
taskId=Integer.parseInt(request.getParameter("taskid"));} catch(Exception exec ){taskId=0;}

int status= -1;
String sub_name="";
String m_com="";

	 sub_name = request.getParameter("sub_name"); 
	 status=Integer.parseInt(request.getParameter("stat"));
	  m_com = request.getParameter("mcom"); 
		
	//out.println(projectSes+sub_name);

	int userId = 0;
		try{ userId = Integer.parseInt((String)session.getAttribute("userId"));}catch(Exception e){userId=0;}  //getting userid of person who is logged in i.e the user on which the session is named.
	if(userId<=0)
	{
	  response.sendRedirect("login.jsp"); //if no user is logged in, first redirect to the login page
	return;}
	 
	
	
 

	Connection connection = null;
	PoolManager poolManager = PoolManager.getInstance();
	Category logCategory = Category.getInstance("nonuxor.rt.jsp");
	
	CallableStatement call = null;
	ResultSet rs = null;

	int chk;

		connection = poolManager.getConnection("erp");
		

try{
    call = connection.prepareCall("{call erp.CL_INNOVATION_PKG.MT_SUB_APPROVE(?,?,?,?,?,?)}");

    
    call.setInt(1,projectSes);
    call.setInt(2,taskId);
    call.setString(3,sub_name);
    call.setString(4,m_com);
    call.setInt(5,status );
   

   call.registerOutParameter(6,OracleTypes.NUMBER);
		

           call.execute();
	
	chk=call.getInt(6);
		 

		}catch(Exception exec){throw exec;}
		
		

   
		try {
			call.close();
		} catch (Exception exl) {
		}
		
		if(chk==1)	
		response.sendRedirect("project_page_new.jsp?projectId="+projectSes);
		else
			response.sendRedirect("http://google.co.in");
			
		
%>