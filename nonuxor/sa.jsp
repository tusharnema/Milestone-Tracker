<%@ include file="socialAuth/myfunctions.jsp"%>
<%@ page
  import="java.sql.*,com.cl.sql.PoolManager,oracle.jdbc.driver.OracleTypes,oracle.sql.CLOB,java.io.*,java.text.*, java.net.*,com.cl.auth.EncrDec,com.cl.auth.IlligalAccess,java.util.*,org.apache.log4j.*"
  buffer="none"%>

 <%


 Connection connection = null;
  PoolManager poolManager = PoolManager.getInstance();
  Category logCategory = Category.getInstance("clsite.mywain.project_list.jsp");

  session.setAttribute("emailByUser",email);
  
  CallableStatement call = null;
  ResultSet rs = null;



    int userId = 0;
	String authType = request.getParameter("authType");
   	String redirectUri = request.getParameter("redirect_uri");
   	String email = request.getParameter("email");



try{
    connection = poolManager.getConnection("erp");

    call = connection.prepareCall("{call erp.CL_INNOVATION_PKG.GET_USER(?,?)}");
    
    call.setInt(1,userId);
    call.registerOutParameter(2, OracleTypes.CURSOR);
    call.execute();
    

    
    rs = (ResultSet) call.getObject(2);

      
    
    
    //out.println("userId "+userId );
    
    
} catch (Exception exec) {
    //logCategory.error(exec);
    throw exec;
  } 








	String csrf = String.valueOf(new java.util.Random().nextInt(900000) + 100000); 
	  session.setAttribute("socialCsrf",csrf);
	  if(redirectUri != null && redirectUri.length() > 0)
	   {
	     session.setAttribute("redirectUri",redirectUri);
	   }
	   if(email != null && email.length() > 0)
	     session.setAttribute("emailByUser",email);
	   else
    	 session.removeAttribute("emailByUser");
while(rs.next()){
	
	if(authType != null)
	{
	   if(authType.equals("f")){
		 setAppCredentials("f");
		 response.sendRedirect("https://www.facebook.com/dialog/oauth?response_type=code&client_id="+CLIENT_ID+"&redirect_uri="+REDIRECT_URL+"&scope="+SCOPE);
	   }else if(authType.equals("g")){
		 setAppCredentials("g");
		 response.sendRedirect("https://accounts.google.com/o/oauth2/auth?redirect_uri="+REDIRECT_URL+"&response_type=code&client_id="+CLIENT_ID+"&scope="+SCOPE); //+"&approval_prompt=force"
	   }else if(authType.equals("l")){
		  setAppCredentials("l");
		  response.sendRedirect("https://www.linkedin.com/uas/oauth2/authorization?response_type=code&client_id="+CLIENT_ID+"&redirect_uri="+REDIRECT_URL+"&state="+csrf+"&scope="+SCOPE);//&state=987654321
	   }else if(authType.equals("t")){
	      //setAppCredentials("t");
		  response.sendRedirect("twitterAuth.jsp?authType=t");
	   }else if(authType.equals("DIRECT")){
	       userId = saveUserDetails(request.getParameter("name"),"",request.getParameter("email"),"","","","INDIVIDUAL","",authType,"NA");

	      
		   if(userId>0)
			response.sendRedirect("../mylogin.jsp?msg=You are registered successfully, Your username is "+rs.getString("USERNAME")+" and password is "+rs.getString("PASSWORD")+".");
		   else if(userId == -1)
				response.sendRedirect("../login.jsp?msg=You are already registered, Please go for forget password.");
	   }else{
		      out.println("@@@@@@@@@@Registeration");
			if(saveUserDetails("Prince Gupta","zigri2612","prince_gupta2612@yahoo.in","26-12-1992","MALE","8802583599","INDIVIDUAL","http://www.clauncher.com/wain-new/images/featured-5.jpg","NONE","NA")>0)
				out.println("##########Register sucessfully");
			setUserDetails("prince_gupta2612@yahoo.in","NONE",session);
		 }
	   }
	}
	
%>