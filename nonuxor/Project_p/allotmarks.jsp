<%@ page
	import="java.sql.*,com.cl.sql.PoolManager,oracle.jdbc.driver.OracleTypes,oracle.sql.CLOB,java.io.*,java.text.*, java.net.*,com.cl.auth.EncrDec,com.cl.auth.IlligalAccess,java.util.*,org.apache.log4j.*"
	buffer="none"%>
<%
Integer projectSes = (Integer) session.getAttribute("projectSession");

   session.setAttribute("projectSession",projectSes);
	
	int taskId=0;
	
	 try {
taskId=Integer.parseInt(request.getParameter("taskid"));} catch(Exception exec ){taskId=0;}

String  status="";
	int com_imp = Integer.parseInt(request.getParameter("ci")); //get data from form and store it in respective variables
	int novelity = Integer.parseInt(request.getParameter("nov"));
	
	
	int appli=Integer.parseInt(request.getParameter("app"));
	int remarks=Integer.parseInt(request.getParameter("remark"));
	int stat=Integer.parseInt(request.getParameter("rad"));



	int userId = 0;
		try{ userId = Integer.parseInt((String)session.getAttribute("userId"));}catch(Exception e){userId=0;}  //getting userid of person who is logged in i.e the user on which the session is named.
	if(userId<=0)
	{
	  response.sendRedirect("login.jsp"); //if no user is logged in, first redirect to the login page
	  return;
	}
	
	
 

	Connection connection = null;
	PoolManager poolManager = PoolManager.getInstance();
	Category logCategory = Category.getInstance("nonuxor.rt.jsp");
	
	CallableStatement call = null;
	ResultSet rs = null;

	

		connection = poolManager.getConnection("erp");
		

try{
    call = connection.prepareCall("{call erp.CL_INNOVATION_PKG.MT_ALLOT_MARKS(?,?,?,?,?,?,?,?,?)}");

    call.setInt(1,userId);
    call.setInt(2,projectSes);
    call.setInt(3,taskId);
    call.setInt(4,com_imp);
    call.setInt(5,novelity);
    call.setInt(6,appli );
    call.setInt(7,remarks);
    call.setInt(8,stat);


   
			call.registerOutParameter(9, OracleTypes.VARCHAR);

           call.execute();

		    status = call.getString(9);

		}catch(Exception exec){throw exec;}
		
		

   
		try {
			call.close();
		} catch (Exception exl) {
		}
		if(status.equals("OK"))
		response.sendRedirect("project_page_new.jsp?projectId="+projectSes);
		else
			response.sendRedirect("http://google.co.in");
			
		
%>