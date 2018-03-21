<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" import="com.google.gson.*,javax.crypto.Mac,javax.crypto.SecretKey,javax.crypto.spec.SecretKeySpec,java.net.URI,org.apache.commons.codec.binary.Base64,com.google.gson.Gson,javax.servlet.http.Cookie,java.net.URL,java.net.URLDecoder,java.security.*,java.io.*,java.util.*,java.net.*,java.sql.*,java.sql.Types,oracle.jdbc.driver.OracleTypes,com.cl.sql.PoolManager,org.apache.log4j.*,oracle.sql.BLOB" buffer="none"%>

<%!
	Category logCategory = Category.getInstance("wain.socialAuth.functions.jsp");
	private String CLIENT_ID = "";
	private String CLIENT_SECRET = "";
	private String HOST = "http://www.wainconnect.com/";
	private String REDIRECT_URL = "";
	private String SCOPE = "";

    private void setAppCredentials(String authType){
		if(authType.equals("f"))
		{
				CLIENT_ID = "506948779671053";
				CLIENT_SECRET = "575656e19cf877396a03c7f6ba4e80be";
				REDIRECT_URL = HOST+"socialAuth/facebookAuth.jsp";
				SCOPE = "email,user_about_me,user_birthday";
				//public_profile&scope=email&scope=user_friends&scope=user_actions.books
		}if(authType.equals("g")){

			    CLIENT_ID = "462391481069-4l4ciudq1d0jdq0a3jbm2p6rrj9v8gb2.apps.googleusercontent.com";
				CLIENT_SECRET = "sHWF2dhzExQuluZwjFniA6VE";
				REDIRECT_URL = HOST+"socialAuth/googleAuth.jsp";
				SCOPE = "https://www.googleapis.com/auth/userinfo.email https://www.googleapis.com/auth/userinfo.profile https://www.googleapis.com/auth/plus.me https://www.googleapis.com/auth/plus.login";

		}else if(authType.equals("l")){
			    CLIENT_ID = "81xr1qjqp45t3f";
				CLIENT_SECRET = "dyZ2MJGsOSZZ2WCD";
				REDIRECT_URL = HOST+"socialAuth/linkedInAuth.jsp";
				SCOPE = "r_basicprofile r_emailaddress"; // w_share,rw_company_admin,r_fullprofile,r_network 

		 }else if(authType.equals("t")){
			    CLIENT_ID = "t6MTlhWY8MU0pxSZspujq9wxk";
				CLIENT_SECRET = "BUxAQdfcU5xRUOUOi2T0Fp5VRcjLi7mmQjf9zdjLR1vGqksu9D";
				REDIRECT_URL = HOST+"socialAuth/twitterAuth.jsp";
				SCOPE="";
		 }
	    
	}

   public String getHttpResponse(String urlString,String requestType)throws Exception
   {
		String line="";
		StringBuilder responseBuilder=new StringBuilder();
		BufferedReader reader = null;
		URL url = null;
		HttpURLConnection conn = null;
		try{
		  if("POST".equals(requestType)){
			 String temp[] = urlString.split("\\?");
		   	url = new URL(temp[0]);
            conn = (HttpURLConnection)url.openConnection();
			conn.setRequestMethod(requestType);
			conn.setDoOutput(true);
			DataOutputStream wr = new DataOutputStream(conn.getOutputStream());
			wr.writeBytes((temp.length>1)?temp[1]:"");
			wr.flush();
			wr.close();
		  }else{
		    url = new URL(urlString);
            conn = (HttpURLConnection)url.openConnection();
			conn.setRequestMethod(requestType);
		  }

          reader = new BufferedReader(new InputStreamReader(
            conn.getInputStream()));
          while ((line = reader.readLine()) != null) {
            responseBuilder.append(line);
          }
          reader.close();
          System.out.println(responseBuilder);
		  return responseBuilder.toString();
		}catch(Exception e)
	    { 
			e.printStackTrace();saveInfo("error.txt","httpResponse",e.toString());
    		 throw e;
		}
   }

   private boolean saveInfo(javax.servlet.http.HttpServletRequest req,String source,String data){
    String f = "socialResponse.txt";
			 try(FileWriter fw = new FileWriter(f,true);
					 BufferedWriter bw = new BufferedWriter(fw);
					 PrintWriter pw = new PrintWriter(bw))
					 {
						pw.println(source+" @ "+new java.util.Date()+" : "+data);
							return true;
                     }catch(IOException e){}
		return false;
   }

      private boolean saveInfo(String fileName,String source,String data){
			 try(FileWriter fw = new FileWriter(fileName,true);
					 BufferedWriter bw = new BufferedWriter(fw);
					 PrintWriter pw = new PrintWriter(bw))
					 {
						pw.println(source+" @ "+new java.util.Date()+" : "+data);
							return true;
                     }catch(IOException e){saveInfo("error.txt","SvaeInfo",e.toString());}
		return false;
   }

   private boolean exists(String URLName){
	  try {
		HttpURLConnection.setFollowRedirects(false);
	    HttpURLConnection con =
		   (HttpURLConnection) new URL(URLName).openConnection();
	    con.setRequestMethod("HEAD");
		return (con.getResponseCode() == HttpURLConnection.HTTP_OK);
		}
	  catch (Exception e) {
		saveInfo("error.txt",URLName+" Exists",e.toString());
        return false;
       }
	}

    public int saveUserDetails(String name,String username,String email,String dob,String gender,String mobile,String userType,String userSubType,String proType,String address,String profilePicUrl,String source,String sourceId)throws Exception {
	    String responseData="",password="";
		int userId=0;
		Connection connection = null;
		PoolManager poolManager = PoolManager.getInstance();
		CallableStatement call = null;
		ResultSet rs = null;
		
		try
		{
			
		connection = poolManager.getConnection("erp");
		connection.setAutoCommit(false);
		call=connection.prepareCall("{CALL ERP.CL_INNOVATION_PKG.CHECK_USER(?,?)}");
		call.setString(1,email);
		call.registerOutParameter(2,OracleTypes.NUMBER);		
		call.execute();
		userId = call.getInt(2);
		 if(userId > 0) // Record Found
		  { 
			responseData="You are already registered, Please go for forget password.";
			if(source != null && (source.indexOf("+") != -1 || source.equals("DIRECT")))
			{
				return -1;
			}
			//save users details
			try{
			  call=connection.prepareCall("{CALL ERP.CL_WAIN_PKG.UPDATE_USER_DETAILS(?,?,?,?,?,?,?)}");
				call.setInt(1,userId);
				call.setString(2,dob);
				call.setString(3,gender);
				call.setString(4,source);
				call.setString(5,sourceId);
				call.registerOutParameter(6, OracleTypes.BLOB);
				call.registerOutParameter(7,OracleTypes.NUMBER);		
				call.execute();
				if(profilePicUrl != null && !"".equals(profilePicUrl) && exists(profilePicUrl))
				{
					BLOB blob = (BLOB) call.getObject(6);
					File file = new File("image.jpg");
					URL url = new URL(profilePicUrl);
					if(blob != null)
					try(InputStream is = url.openStream();
					OutputStream fos = new FileOutputStream(file);
					FileInputStream fis  = new FileInputStream(file);
					OutputStream bos = blob.getBinaryOutputStream())
				    { 

						byte[] data = new byte[1048];
						int length;
						while ((length = is.read(data)) != -1) {
							fos.write(data, 0, length);
						}
						data = new byte[fis.available()];
						fis.read(data);bos.write(data);file.delete();
				    }catch(Exception e){
						saveInfo("error.txt",source+" already registered pic save for "+userId,e.toString());
						}
			    }
			}catch(Exception e){ 
			 // e.printStackTrace();
			  saveInfo("error.txt",source+" already registered data Update",e.toString());
		      throw e;
			}
			//return true;				
		  }
		else
		{
			call = connection.prepareCall("{CALL ERP.ERP_USER_PKG.GET_RANDOM_PASSWORD(?)}");
			call.registerOutParameter(1,OracleTypes.VARCHAR);		
			call.execute();
			password = call.getString(1);

			call = connection.prepareCall("{CALL ERP.CL_INNOVATION_PKG.CL_ADD_USER(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
			call.setString(1,email);
			call.setString(2,password);
			call.setString(3,name);
			call.setString(4,mobile);
			call.setString(5,dob); // dateofbirth
			call.setString(6,gender);
			call.setString(7,userType);
			call.setString(12,userSubType);
			call.setString(11,proType);
			call.setString(10,address);
			
			call.setString(8,source);
			call.setString(9,sourceId);
			call.registerOutParameter(13, OracleTypes.BLOB);
			call.setString(14,"ACTIVE");
			call.registerOutParameter(15, OracleTypes.VARCHAR);
			call.registerOutParameter(16, OracleTypes.NUMBER);
			call.execute();
			username=call.getString(15);
			userId = call.getInt(16);
			if(userId == -2){
				throw new Exception(username);
			  }
			if(profilePicUrl != null && !"".equals(profilePicUrl) && exists(profilePicUrl))
				{
					BLOB blob = (BLOB) call.getObject(10);
					File file = new File("image.jpg");
					URL url = new URL(profilePicUrl);
					try(InputStream is = url.openStream();
					OutputStream fos = new FileOutputStream(file);
					FileInputStream fis  = new FileInputStream(file);
					OutputStream bos = blob.getBinaryOutputStream())
				    { 
						byte[] data = new byte[1048];
						int length;
						while ((length = is.read(data)) != -1) {
							fos.write(data, 0, length);
						}
						data = new byte[fis.available()];
						fis.read(data);bos.write(data);file.delete();
				    }catch(Exception e){
						saveInfo("error.txt",source+" registration pic save for "+userId,username+e.toString());
						}
			    }

			if(mobile != null && mobile.length()==10)
			{
				try{
				call = connection.prepareCall("{CALL ERP.CL_SMS_MSG_PKG.SEND_SMS_GUPSUP(?,?,?)}");	
				call.setString(1,"WAIN");
				call.setString(2,"Thanks for registering with Wain. Your password is "+password);
				call.setString(3,mobile);	// mobile no. FOR SMS SERVICE
				call.execute();
				call.close();
				}catch(Exception e){saveInfo("error.txt",source,e.toString());}
			}
			//connection.commit();

			if(email != null && !email.equals("null") && !email.equals(""))
			{
				String[] toEmail = {email};
				StringBuffer emailContent = new StringBuffer();

				emailContent.append("Dear "+name+",<br/><br/>");
				
				emailContent.append("Welcome to WAINCONNECT!<br/>Your signup has been successfully completed.<br/><br/>WAIN platform is to provide interlinked opportunities for Academic Institutions and Corporations to collaborate in Research and Innovation, Academia-Industry Development Programs, Skills Development, project-based and strategic partnerships.<br/><br/>");
				emailContent.append("While you have been provided with some basic services on your account, your access would be dependent on the subscriptions.  For more detail please drop us mail on info@wainconnect.com.<br/><br/>");
				emailContent.append("Your log-in credentials are as under:<br/><br/>");
				emailContent.append("<font color=\"#FF0000\">Login : <b>"+username+"</b><br/>Password : <b>"+password+"</b></font><br/><br/>");
				emailContent.append("Did you face any problem, please feel free to drop us an email at info@wainconnect.com<br/><br/>");
				emailContent.append("<br/>Best Wishes,<br/>WAIN Team.");

				try{
						call=connection.prepareCall("{CALL cl_mail_pkg.send_mail(?,?,?,?,?,?)}");
						call.setString(1,"info@wainconnect.com");
						call.setString(2,email);
						call.setString(3,"WAINCONNECT");
						call.setString(4,"User");
						call.setString(5,"Welcome to Wainconnect");
						call.setString(6,emailContent.toString());
						call.execute();
					//	connection.commit();
				}
				catch(Exception ex)
				{
					//connection.rollback();
					saveInfo("error.txt","registration mail sent",ex.toString());
					logCategory.fatal(ex+"Wainconnect E-mail not send for this user signup module :- "+name);
				}

			}
			connection.commit();
		//	return true;
		  }
		}
		catch(Exception e)
		{
			connection.rollback();
			logCategory.error(e);
			saveInfo("error.txt",source,e.toString());
			responseData = "#@#failure#@#";
			userId = 0;
			throw e;
		}
		finally
		{
			if(call != null)
				call.close();
			if(rs != null)
				rs.close();
			poolManager.freeConnection("erp",connection);							
		}
		return userId;
   }

    public Boolean setUserDetails(String email,String source,HttpSession session)throws Exception{
	    String responseData="";
		Connection connection = null;
		PoolManager poolManager = PoolManager.getInstance();
		CallableStatement call = null;
		ResultSet rs = null;

		try
		{
		if(email != null && !"".equals(email) && !"null".equals(email))
		{
		connection = poolManager.getConnection("erp");
		call=connection.prepareCall("{CALL ERP.CL_WAIN_PKG.GET_USER_DETAILS(?,?)}");
		call.setString(1,email);
		call.registerOutParameter(2,OracleTypes.CURSOR);		
		call.execute();
		rs = (ResultSet)call.getObject(2);
			while(rs.next())
			{
			   if("ACTIVE".equals(rs.getString("STATUS")))
				{		   
				   session.setAttribute("userId",rs.getString("USER_ID"));
				   session.setAttribute("email",rs.getString("EMAIL"));
				   session.setAttribute("name",rs.getString("NAME"));
				   session.setAttribute("username",rs.getString("USERNAME"));
				   session.setAttribute("password",rs.getString("PASSWORD"));
				   session.setAttribute("userType",rs.getString("USER_TYPE"));			   
				  //USER_ID,NAME,USERNAME,EMAIL,PASSWORD,MOBILE_NO,DOB,GENDER,USER_TYPE,
					//  RECORD_DATE,FB_ID,G_ID,L_ID,PROFILE_PIC,STATUS
			        return true;
				}else
				  responseData = "#@#failure#@#";	
				 // inactive user
			}
		}  
	 }catch(Exception e){
	    logCategory.error("get "+email+"'s setUserDetails method : "+e);
		saveInfo("error.txt",email+"'s setUserDetails",e.toString());
		throw e;
	 }finally
		{
			if(call != null)
				call.close();
			if(rs != null)
				rs.close();
			poolManager.freeConnection("erp",connection);							
		}
		return false;
	}

   

%>
