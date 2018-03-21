<%@ page
	import="java.sql.*,com.cl.sql.PoolManager,oracle.jdbc.driver.OracleTypes,oracle.sql.CLOB,java.io.*,java.text.*, java.net.*,com.cl.auth.EncrDec,com.cl.auth.IlligalAccess,java.util.*,org.apache.log4j.*"
	buffer="none"%>
<%
	int projectId = 0;
	String project_name = request.getParameter("P_name"); //get data from form and store it in respective variables


 
	
int success ;

  String topName = request.getParameter("top_name");
  String area = request.getParameter("Area");
   String spcl = request.getParameter("spl");
  String startDate = request.getParameter("SD");
  String endDate = request.getParameter("ED");
  String nov = request.getParameter("Novelity");
  String app = request.getParameter("Application");
  String desc = request.getParameter("Desc");
	


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
	String instType = request.getParameter("instType");
	if (instType == null || instType.equals("null"))
		instType = null;
	CallableStatement call = null;
	ResultSet rs = null;

	

		connection = poolManager.getConnection("erp");

		call = connection.prepareCall("{call erp.CL_INNOVATION_PKG.ADD_PROJECT(?,?,?,?,?,?,?,?,?,?,?)}");
		call.setInt(1, userId );
		call.setString(2, project_name );
		call.setString(3,spcl);

		call.setString(4,topName);
		call.setString(5,area);
		call.setString(6,startDate);
		call.setString(7,endDate);
		call.setString(8,nov);
		call.setString(9,app);
		call.setString(10,desc);




		call.registerOutParameter(11, OracleTypes.NUMBER);
		call.execute();
		success = call.getInt(11);
		if(success > 0 )
		   response.sendRedirect("mentor.jsp");
		try {
			call.close();
		} catch (Exception exl) {
		}

		
%>