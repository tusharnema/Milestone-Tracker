<%@ page
  import="java.sql.*,com.cl.sql.PoolManager,oracle.jdbc.driver.OracleTypes,oracle.sql.CLOB,java.io.*,java.text.*, java.net.*,com.cl.auth.EncrDec,com.cl.auth.IlligalAccess,java.util.*,org.apache.log4j.*"
  buffer="none"%>
<%
  String person = "";
  int groupId;
int size;


String personName = "";

 Integer projectSes = (Integer) session.getAttribute("projectSession");


out.println(projectSes);
  String index=request.getParameter("psize");

  size  = Integer.parseInt(request.getParameter("psize").toString());

  for(int i=1;i<=size;i++)
{
		
		person = "person"+Integer.toString(i);
		personName="personName"+Integer.toString(i);

   personName = request.getParameter("person"); //get data from form and store it in respective variables
}
 
  


  personName = "";


  int userId = 0;
    try{ userId = Integer.parseInt((String)session.getAttribute("userId"));}catch(Exception e){userId=0;}  //getting userid of person who is logged in i.e the user on which the session is named.
  if(userId<=0)
  {
    response.sendRedirect("login.jsp"); //if no user is logged in, first redirect to the login page
    return;
  }
  
  

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

for(int i=1;i<=size;i++){

  personName=personName+Integer.toString(i);
    

    call = connection.prepareCall("{call erp.CL_INNOVATION_PKG.SAVE_MEMBERS(?,?)}");
    
    call.setInt(1,groupId);	
  	call.setString(2,personName);	

		
    
    call.execute();
    

 

  }    
    
    
    //out.println("userId "+userId );
    
    
} catch (Exception exec) {
    //logCategory.error(exec);
    throw exec;
  } 
    
%>


<html>
 <body>
 <br><br>
  <table width="200px" align="center" style="border:1px solid #000000;">
   <tr><th>Person List</th></tr> 
<%
 person ="";
 size=0;
if(request.getParameter("psize")!=null && request.getParameter("psize")!="")
{
	try
	{
		size  = Integer.parseInt(request.getParameter("psize").toString());
		//out.println(size);
		for(int i=1;i<=size;i++)
		{
		person = "person"+i;
		%>
		<tr><td style="background-color:#f7f7f7;color:green;font-weight:bold;text-align:center;"><%=request.getParameter(person).toString()%></td></tr>
		<%
		}
	}
	catch(Exception e)
	{
		out.println("Error1 : " + e.getMessage());
	}
	 
}
else if(request.getParameter("person1")!=null && request.getParameter("person1")!="")
{
	 
	try
	{
		%>
		<tr><td style="background-color:#efefef;color:#ff0000;font-weight:bold;text-align:center;"><%=request.getParameter("person1").toString()%></td></tr>
		<%
	}
	catch(Exception e)
	{
		out.println("Error2 : " +e.getMessage());
	}
	 
	
}
else
{
	%>
	 <tr><td><%="No Person Found"%></td></tr>
	 <%
}
	

%>
</table>
</html>