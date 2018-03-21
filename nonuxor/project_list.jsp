<%@ page
	import="java.sql.*,com.cl.sql.PoolManager,oracle.jdbc.driver.OracleTypes,oracle.sql.CLOB,java.io.*,java.text.*, java.net.*,com.cl.auth.EncrDec,com.cl.auth.IlligalAccess,java.util.*,org.apache.log4j.*"
	buffer="none"%>
<%
	int projectId = 0;

	String projectName = ""; //get data from form and store it in respective variables
	String orgName = "";
	String groupName = "";
	


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
	
	CallableStatement call = null;
	ResultSet rs = null;

	StringBuffer projBuff = new StringBuffer();
	StringBuffer univBuff = new StringBuffer();
	int projBuffCnt = 0;
	int univBuffCnt = 0;
	int projCnt = 0;
	int projTotCnt = 0;
	int stuCnt = 0;
	int success;
	String topicName = "";
	String targetProject = "NA";
	String projectTitle = "";
	String focusedArea = "";
	String description = "";
	String keywords = "NA";
	String free = "NA";
try{
		connection = poolManager.getConnection("erp");

		call = connection.prepareCall("{call erp.CL_INNOVATION_PKG.LIST_PROJECT(?,?)}");
		
		call.setInt(1,userId);
		call.registerOutParameter(2, OracleTypes.CURSOR);
		call.execute();
		

		
		rs = (ResultSet) call.getObject(2);

			
			projectName = rs.getString("PROJECT_NAME");
			orgName = rs.getString("ORG_NAME");
			groupName = rs.getString("G_NAME");
		
		//out.println("userId "+userId );
		
		
} catch (Exception exec) {
		//logCategory.error(exec);
		throw exec;
	} 
		
%>
<html>
<head>
	<h1>testing project list </h1>
</head>
<body>

<!-- Active projects -->


    
    <div id="Act" class="tab-pane active abc">

      <div id="Act" class="tabcontent " >
        <div class="more-services-container section-container" background-color="#ccffcc" >
          <div class="container">
            
              <div class="row">
                  <div class="col-sm-6 more-services section-description wow fadeIn">
                     <center> <h2 style="padding">Active Projects</h2></center>
                      <div class="divider-1 wow fadeInUp"><span></span></div>

                  </div>

                  <div class="col-sm-6 more-services section-description wow fadeIn">
                     <center><h2 style="padding">Progress bar <br> <br></h2></center> 
                      <div class="divider-1 wow fadeInUp"><span></span></div>
                  </div>
              </div>

              
              <% while (rs.next() ){
              %>
              <div class="row">
                  <div class="col-sm-6 more-services-box wow fadeInLeft">

                    <div class="row">
                      <div class="col-sm-3">
                        <div class="more-services-box-icon">
                          <i class="fa fa-paperclip"></i>
                        </div>
                      </div>
                      <div class="col-sm-9">
                        <a href="Project_p/project_page.html"> <%=rs.getString("PROJECT_NAME")%></a>
                          <p>
                           survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset 

                          </p>
                      </div>
                    </div>
                  </div>
                  <div class="col-sm-6 more-services-box wow fadeInLeft">
                    <div class="row">
                      <br>
                      <br>
                      <div class="col-sm-3">
                        
                      </div>
                      <div class="col-sm-9">
                        
                        
                        
  <div class="progress">

    <div class="progress-bar" role="progressbar" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100" style="width:20%" vertical-align="middle">
      <span class="sr-only">70% Complete</span>
    </div>
  </div>
			  <%}%>

                      </div>
                    </div>
                  </div>
              </div>
              
              



             </div> 

       </div>
     </div>



    </div>






	</body>
	</html>
