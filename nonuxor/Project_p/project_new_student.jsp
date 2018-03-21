<%@ page
  import="java.sql.*,com.cl.sql.PoolManager,oracle.jdbc.driver.OracleTypes,oracle.sql.CLOB,java.io.*,java.text.*, java.net.*,com.cl.auth.EncrDec,com.cl.auth.IlligalAccess,java.util.*,org.apache.log4j.*"
  buffer="none"%>
<%

  int project_id = 0;
  String New_Sub_Name="";
  try{
	  
   project_id = Integer.parseInt(request.getParameter("projectId")); } catch (Exception e){project_id=0;}
   
    int userId = 0;
    try{ userId = Integer.parseInt((String)session.getAttribute("userId"));}catch(Exception e){userId=0;}  //getting userid of person who is logged in i.e the user on which the session is named.
  if(userId<=0)
  {
    response.sendRedirect("login.jsp"); //if no user is logged in, first redirect to the login page
    return;
  }
   
   
 if(project_id==0){
  
 project_id = (Integer) session.getAttribute("projectSession"); }
  
   session.setAttribute("projectSession",project_id);
  String name = (String) session.getAttribute("name");
  
 
  
  //out.println(project_id);
  
  
  

  int groupId = 0;
    try{ userId = Integer.parseInt((String)session.getAttribute("userId"));}catch(Exception e){userId=0;}
  if(userId<=0)
  {
    response.sendRedirect("login.jsp");
    return;
  }


  Connection connection = null;
  PoolManager poolManager = PoolManager.getInstance();
  Category logCategory = Category.getInstance("clsite.mywain.project_list.jsp");
  
  CallableStatement call = null;
  ResultSet rs = null;
ResultSet rs2 = null;
ResultSet rss2 = null;
ResultSet rss4 = null;
ResultSet rss3 = null;
ResultSet rss5 = null;
ResultSet rss6 = null;

ResultSet rsn = null;
ResultSet nr2 = null;
ResultSet nr3 = null;
ResultSet nr4 = null;
ResultSet nr5 = null;
ResultSet nr6 = null;

ResultSet n22 = null;
ResultSet n3 = null;
ResultSet n33 = null;
ResultSet n4 = null;
ResultSet n44 = null;
ResultSet n5 = null;
ResultSet n55 = null;
ResultSet n6 = null;
ResultSet n66 = null;

ResultSet rda = null;
ResultSet rda2 = null;
ResultSet rdate = null;
ResultSet rdate2 = null;
ResultSet rdate3 = null;
ResultSet rdate4 = null;
ResultSet rdate5 = null;
ResultSet rdate6 = null;



ResultSet atno = null;
ResultSet amno = null;
  
  

try{
    connection = poolManager.getConnection("erp");
	
	try{
	call = connection.prepareCall("{call erp.CL_INNOVATION_PKG.GET_GROUP(?,?)}");
    
    call.setInt(1,project_id);	
  	call.registerOutParameter(2,OracleTypes.NUMBER);
	call.execute();
	groupId = call.getInt(2);
	
	}
	catch(Exception exec){
	throw exec;}



try{
  call = connection.prepareCall("{call erp.CL_INNOVATION_PKG.GET_SUBTASK(?,?,?)}");
    
    call.setInt(1,2);
    call.setInt(2,project_id );  
    call.registerOutParameter(3,OracleTypes.CURSOR);
  call.execute();
  rss2 = (ResultSet) call.getObject(3);
  
  }
  catch(Exception exec){
  throw exec;}
   

  try{
  call = connection.prepareCall("{call erp.CL_INNOVATION_PKG.GET_SUBTASK(?,?,?)}");
    
    call.setInt(1,3);
    call.setInt(2,project_id );  
    call.registerOutParameter(3,OracleTypes.CURSOR);
  call.execute();
  rss3 = (ResultSet) call.getObject(3);
  
  }
  catch(Exception exec){
  throw exec;}
   
   try{
  call = connection.prepareCall("{call erp.CL_INNOVATION_PKG.GET_SUBTASK(?,?,?)}");
    
    call.setInt(1,4);
    call.setInt(2,project_id );  
    call.registerOutParameter(3,OracleTypes.CURSOR);
  call.execute();
  rss4 = (ResultSet) call.getObject(3);
  
  }
  catch(Exception exec){
  throw exec;}
   
   try{
  call = connection.prepareCall("{call erp.CL_INNOVATION_PKG.GET_SUBTASK(?,?,?)}");
    
    call.setInt(1,5);
    call.setInt(2,project_id );  
    call.registerOutParameter(3,OracleTypes.CURSOR);
  call.execute();
  rss5 = (ResultSet) call.getObject(3);
  
  }
  catch(Exception exec){
  throw exec;}
   

   try{
  call = connection.prepareCall("{call erp.CL_INNOVATION_PKG.GET_SUBTASK(?,?,?)}");
    
    call.setInt(1,6);
    call.setInt(2,project_id );  
    call.registerOutParameter(3,OracleTypes.CURSOR);
  call.execute();
  rss6 = (ResultSet) call.getObject(3);
  
  }
  catch(Exception exec){
  throw exec;}
   

	try{
 
  call = connection.prepareCall("{call erp.CL_INNOVATION_PKG.MT_GET_MARKS(?,?,?,?,?)}");
    
    call.setInt(1,2);
    call.setInt(2,project_id );  
	call.setInt(3,userId ); 
    call.registerOutParameter(4,OracleTypes.CURSOR);
     call.registerOutParameter(5,OracleTypes.CURSOR);
  call.execute();
  nr2 = (ResultSet) call.getObject(4);
   n22 = (ResultSet) call.getObject(5);
  

  }
  catch(Exception exec){
  throw exec;}


  try{
  call = connection.prepareCall("{call erp.CL_INNOVATION_PKG.MT_GET_MARKS(?,?,?,?,?)}");
    
    call.setInt(1,3);
    call.setInt(2,project_id );  
  call.setInt(3,userId ); 
    call.registerOutParameter(4,OracleTypes.CURSOR);
     call.registerOutParameter(5,OracleTypes.CURSOR);
  call.execute();
  n3 = (ResultSet) call.getObject(4);
   n33 = (ResultSet) call.getObject(5);
  
  
  }
  catch(Exception exec){
  throw exec;}
   


  try{
  call = connection.prepareCall("{call erp.CL_INNOVATION_PKG.MT_GET_MARKS(?,?,?,?,?)}");
    
    call.setInt(1,4);
    call.setInt(2,project_id );  
  call.setInt(3,userId ); 
    call.registerOutParameter(4,OracleTypes.CURSOR);
     call.registerOutParameter(5,OracleTypes.CURSOR);
  call.execute();
  n4 = (ResultSet) call.getObject(4);
   n44 = (ResultSet) call.getObject(5);
  
  
  }
  catch(Exception exec){
  throw exec;}
   

  try{
  call = connection.prepareCall("{call erp.CL_INNOVATION_PKG.MT_GET_MARKS(?,?,?,?,?)}");
    
    call.setInt(1,5);
    call.setInt(2,project_id );  
  call.setInt(3,userId ); 
    call.registerOutParameter(4,OracleTypes.CURSOR);
     call.registerOutParameter(5,OracleTypes.CURSOR);
  call.execute();
  n5 = (ResultSet) call.getObject(4);
   n55 = (ResultSet) call.getObject(5);
  
  
  }
  catch(Exception exec){
  throw exec;}
  


  try{
  call = connection.prepareCall("{call erp.CL_INNOVATION_PKG.MT_GET_MARKS(?,?,?,?,?)}");
    
    call.setInt(1,6);
    call.setInt(2,project_id );  
  call.setInt(3,userId ); 
    call.registerOutParameter(4,OracleTypes.CURSOR);
     call.registerOutParameter(5,OracleTypes.CURSOR);
  call.execute();
  n6 = (ResultSet) call.getObject(4);
   n66 = (ResultSet) call.getObject(5);
  
  
  }
  catch(Exception exec){
  throw exec;}


  try{
  call = connection.prepareCall("{call erp.CL_INNOVATION_PKG.GET_LIST_MEMBERS(?,?)}");
    
    call.setInt(1,groupId);  
    call.registerOutParameter(2,OracleTypes.CURSOR);
  call.execute();
  rs2 = (ResultSet) call.getObject(2);
  
  }
  catch(Exception exec){
  throw exec;}


    call = connection.prepareCall("{call erp.CL_INNOVATION_PKG.NAME_PROJECT(?,?)}");
    
    call.setInt(1,project_id);
    call.registerOutParameter(2, OracleTypes.CURSOR);
    call.execute();
    

    
    rs = (ResultSet) call.getObject(2);

    
session.setAttribute("group_Id",groupId);
Integer gid = (Integer) session.getAttribute("group_Id");
  
    
    
    
    
} catch (Exception exec) {
    //logCategory.error(exec);
    throw exec;
  } 

%>




<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Project Page</title>

    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/4-col-portfolio.css" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> <!--upper problem -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<!--added after -->

<link href="layout/styles/layout.css" rel="stylesheet" type="text/css" media="all">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<style>


  .nav-tabs {
    border-bottom: 1px solid #ddd;
    background-color:#521d1d;
    color: black;
}

.card {
    position: relative;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-direction: column;
    flex-direction: column;
    min-width: 0;
    word-wrap: break-word;
    background-color: #fff;
    background-clip: border-box;
    border: 1px solid rgba(0,0,0,.125);
    border-radius: .25rem;
    background-color: #050101;
    color: #f9f4fc;
}

.card-body {
    -ms-flex: 1 1 auto;
    flex: 1 1 auto;
    padding: 2.25rem;
    height:375px;
    overflow:scroll;
    overflow-x: hidden;
}
.card a{
  color: #fff;
}
.nav-tabs a{
  color:#01010c;
}
.card p{
  font-size: 14px;
}
  
.mt-4, .my-4 {
    margin-top: -4.5rem!important;
}  

.mb-4, .my-4 {
    margin-bottom: 3.5rem!important;
}
.modal_design{

  height:relative;
  width:relative;
}

.btn-group-lg > .btn, .btn-lg {
    padding: 4px 4px;
    font-size: 18px;
    line-height: 1.3333333;
    border-radius: 13px;
    float:right;

}

  .nav-pills > li.active > a, .nav-pills > li.active > a:focus, .nav-pills > li.active > a:hover {
    color: #fff;
    background-color: #252729;
}

.nav-tabs>li.active>a, .nav-tabs>li.active>a:focus, .nav-tabs>li.active>a:hover {
    color: #555;
    background-color: #050101;
    border: 2px solid #f1f1f1;
    border-bottom-color: transparent;
    color: #f7b680;
}

.nav-tabs>li>a:hover {
    border-color: #eee #eee #ddd;
    background-color: #1f1d1d;
}
.nav > li > a {
    position: relative;
    display: block;
    padding: 10px 44px;
    color: #ece1d7;
}
      .section-container {
    margin: 0 auto;
    padding-bottom: 0px;
}
.container {
    padding-right: 15px;
    padding-left: 15px;
    margin-right: auto;
    margin-left: auto;
}
.row {
    margin-right: -15px;
    margin-left: -15px;
}
.section-description {
    margin-top: 0px;
    padding-bottom: 10px;
}
.animated {
    -webkit-animation-duration: 1s;
    animation-duration: 1s;
    -webkit-animation-fill-mode: both;
    animation-fill-mode: both;
}

.abc{
  display:none;
}

a:focus, a:hover {
    color: #138bf8;
    text-decoration: underline;
}

a {
    color: #06111b;
    text-decoration: none;
}

.more-services-container { background-color: #181818; overflow: scroll; min-width: 100%; color: #E4E4E4 }


.card h4{
  font-size: large;

}
.inline{
  display: inline-block;
}
.modal {
    margin: 0;
    line-height: 1.42857143;
    color: black;
}

.form-group{
  color: black;
}

}
.modal-content{
  color:black;
}
#pageintro {
    padding: 105px 0 -15px;
}


.col-form-label {
    padding-top: calc(-3.625rem + 25px);
    padding-bottom: calc(1.375rem + 1px);
    margin-bottom: 3px;
    line-height: 1.5;
    font-size: initial;
}
label, input, textarea, select, button {
    display: block;
    resize: none;
    outline: none;
    color: inherit;
    font-size: inherit;
    font-family: inherit;
    vertical-align: super;
}

  </style>
  </head>

  <body style=" background-color: #1f1d1d;">
   

   



    <div class="bgded overlay" style="background-image:url('images/02.jpg');"> 
  <!-- ################################################################################################ -->
 <div class="wrapper row1">
  
    <header id="header" class="hoc clear"> 
  <div id="logo" class="fl_left" style="float:left;">
         <div class="logo">
                                    <a href="#">
                                        <img src="images/logo-wain.png" alt="logo"/></a>
                                </div>
      </div>
      <!-- ################################################################################################ -->
      
      <nav id="mainav" class="fl_right">
        <ul class="clear">
          <li class="active"><a href="index.html">Home</a></li>
          <li><a class="active" href="#">FAQ</a>
            
          </li>
          <li><a class="drop" href="#"><%=name%></a>
            <ul>
              <li><a href="#">Profile</a></li>
              
                
              </li>
              <li><a href="../../lgt.jsp">Logout</a></li>
            </ul>
          </li>
          
        </ul>
      </nav>
      <!-- ################################################################################################ -->
    </header>
  </div>
  <!-- ################################################################################################ -->
  <!-- ################################################################################################ -->
  <!-- ################################################################################################ -->
  <div id="" class="hoc clear"> 
    <!-- ################################################################################################ -->
    <center><h1 style="padding-bottom:30px;">Milestone Tracker</h1></center>
    <!-- ################################################################################################ -->
    <div class="clear"></div>
  </div>
  <!-- ################################################################################################ -->
</div>
<!-- End Top Background Image Wrapper -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<ul class="breadcrumb">

<li><a href="../student.jsp">Home</a><span class="divider">>></span></li>
<li><a href="project_new_student.jsp">Project Progress</a></li>
</ul>


    <!-- Page Content -->
    <div class="container">

      <!-- Page Heading -->
    <% while(rs.next()){%>
      <div class="row">

        <div class="col-md-12">
    <% String projectName = rs.getString("PROJECT_NAME");
      projectName = projectName.substring(0,1).toUpperCase() + projectName.substring(1).toLowerCase();%>
      <center><h1  class="my-4" style="color:white"> <%=projectName%>
       
      </h1></center>
    </div>

    
   </div>
    <%}%>
    <hr>
      <div class="row">



  <!--task1 starts

      -->



        <div class="col-md-4  portfolio-item">
          <div class="card ">





              <ul class="nav nav-tabs">
    <li class="active"><a data-toggle="tab" href="#home">Task1</a></li>
    
    
    
  </ul>


  

  <div class="tab-content">
    <div id="home" class="tab-pane fade in active">
     
      <div class="card-body">

                <center>
              <h1 class="card-title" style="font-size: 46px;">
                Attend Explanatory Lectures
              </h1>
         </center>    

              
              <br>
              
              <!-- <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#exampleModal" float="right">Create New SubTask</button>-->
                <br>
               <br>
             

                    <%  
              try{
                  call = connection.prepareCall("{call erp.CL_INNOVATION_PKG.MT_GET_DATE(?,?,?,?,?)}");
    
                    call.setInt(1,1);
                    call.setInt(2,project_id );
                     call.setInt(3,userId);
                    
                    
                    call.registerOutParameter(4,OracleTypes.CURSOR);
                    call.registerOutParameter(5,OracleTypes.CURSOR);
                    call.execute();
                    rda = (ResultSet) call.getObject(4);
                    rda2= (ResultSet) call.getObject(5);

  
              }
              catch(Exception exec){
                throw exec;}

                %>
                <%


                if (rda.next()){
        %>
         <hr>

             <div class="row">
        
              
              
            <div class="col-md-12">
             <h5>Expected End Date: <%=rda.getString("END_DATE") %></h5>
            </div>

            <% } else {  %>

             
              <br>
               <hr>
             <div class="row">


              <div class="col-md-6">
              
            </div>
                 <i class="fa fa-lock" style="font-size:48px;color:White"></i> 

                <%}%>

                <hr>

  

            </div>
            </div>



     
    </div>







    
  </div>


</div>

            
            
          </div>


  <!--- task1 ended



  task2 starts 
####################################################################################################################################################################################################################################################################################################################################
-->

       
        <div class="col-md-4  portfolio-item">
          <div class="card ">





              <ul class="nav nav-tabs">
    <li class="active"><a data-toggle="tab" href="#home2">Task2</a></li>
    <li><a data-toggle="tab" href="#task2">Subtasks</a></li>
  <!--<li><a data-toggle="tab" href="#not2">Rating</a></li>-->
  

    
    
  </ul>
  <% int flag2=0; %>

  <div class="tab-content">
    <div id="home2" class="tab-pane fade in active">
     
      <div class="card-body">
        <center>
              <h1 class="card-title" style="font-size: 46px;">
                Topic Identification
              </h1>

<%
                try{

                n22=null;
 
  call = connection.prepareCall("{call erp.CL_INNOVATION_PKG.MT_GET_MARKS(?,?,?,?,?)}");
    
    call.setInt(1,2);
    call.setInt(2,project_id );  
  call.setInt(3,userId ); 
    call.registerOutParameter(4,OracleTypes.CURSOR);
     call.registerOutParameter(5,OracleTypes.CURSOR);
  call.execute();
  nr2 = (ResultSet) call.getObject(4);
   n22 = (ResultSet) call.getObject(5);
  

  }
  catch(Exception exec){
  throw exec;}


%>
           <%                   int tus2=0;
                int tus2r=1;
                    //out.println(tus2);
     while (nr2.next() && tus2r==1){ 
    tus2r--;
      //out.println("hon");
     tus2=nr2.getInt("STATUS");
    

  //out.println(tus2+"yugsda");

   if(tus2==1){
  %>

  <p style="color:green" ><i class="fa fa-check-circle-o" aria-hidden="true" style="font-size: 5.73em"></i>
 </p> <%} else if(tus2==-1){%> 
  <p style="color:red" ><i class="fa fa-check-circle-o" aria-hidden="true" style="font-size: 5.73em"></i> 
<br />
 
 <%}
}
%>
         </center>


                    <%  
              try{
                  call = connection.prepareCall("{call erp.CL_INNOVATION_PKG.MT_GET_DATE(?,?,?,?,?)}");
    
                    call.setInt(1,2);
                    call.setInt(2,project_id );
                     call.setInt(3,userId);
                    
                    
                    call.registerOutParameter(4,OracleTypes.CURSOR);
                    call.registerOutParameter(5,OracleTypes.CURSOR);
                    call.execute();
                    rdate = (ResultSet) call.getObject(4);
                    rdate2= (ResultSet) call.getObject(5);

  
              }
              catch(Exception exec){
                throw exec;}

                %>

     
             

             
             

            

               


                <%


                if (rdate.next()){
        %>

              
             
              
             
              
              <br>
              <hr>
         <div class="row">
              
              <div class="col-md-6">
                
              <h5>Start Date: <%=rdate.getString("START_DATE") %></h5>
            </div>
            <div class="col-md-6">
             <h5>End Date: <%=rdate.getString("END_DATE") %></h5>
            </div>
              <hr>
            <% } else {  %>
<div class="row">
            <div class="col-md-12">
               <br>
              <br>

              <br>
              <br>
              
              <br>
              <hr>
            </div>
              <div class="col-md-5">
              
            </div>
                   
                   &nbsp &nbsp  <i class="fa fa-lock" style="font-size:48px;color:White"></i> 
                      <hr>

                <%}%>

              

  

            </div>
            </div>
     
    </div>







<!-- subtask of task 2 starts -->


    <div id="task2" class="tab-pane fade">


      
      <div class="card-body" >



        <% int count2 = 0;
    while(rss2.next()) { 
    count2++;%>
        <div class="row">


              <div class="col-md-12">
              <h4 class="card-title">
				
				
				<%
				String s_name="";
				 s_name= rss2.getString("SUB_NAME"); %>
				
                <a href="#"><%=s_name %></a>

              </h4>
            </div>
			

         
        </div>
        <br>

              <p class="card-text"><%=rss2.getString("SUB_DESC") %> </p>

               <div class="row">


              <div class="col-md-12">
             <p class="card-text" style="color:#de9336; display:inline;"> Relevent Article by Mentor:   <a href=<%=rss2.getString("file_url")%>  target=_blank style="color:blue;">Download </a> </p> <br><br>

            </div>
      

         
        </div>
			   
				
				<% 
				
				
			
				 String projectdate = rss2.getString("END_DATE");
				projectdate = projectdate.substring(8,10)+"-"+projectdate.substring(5,8)+projectdate.substring(0,4);
				


				%> 
				<%
         rsn=null;
						  try{
									call = connection.prepareCall("{call erp.CL_INNOVATION_PKG.GET_SUBTASK_MEMBERS(?,?,?,?)}");
    
										call.setInt(1,2);
										call.setInt(2,project_id );
										call.setString(3,s_name);
										
										call.registerOutParameter(4,OracleTypes.CURSOR);
										call.execute();
										rsn = (ResultSet) call.getObject(4);
  
							}
							catch(Exception exec){
								throw exec;}
				
				%>
				
				
				<p class="card-text" style="color:#de9336; display:inline;"> Assigned to:   </p> <% while(rsn.next()) {%>  <%=rsn.getString("member_name")  %> &nbsp <% }%> <br><br>
				<p class="card-text" style="color:#de9336; display:inline;"> Deadline:   </p> <%=projectdate%> </p>
        <hr>
				 
				  <div class="row">
			     <div class="col-md-6">

             <% int j2=200;
                  j2+=count2;
                %>

                  <!-- Trigger the modal with a button -->
                  <button type="button" class="btn btn-info " data-toggle="modal" data-target="#<%=j2%>">Submit Paper</button> </div>
				    <div class="col-md-6" align="right">
				   <button type="button" class="btn btn-info " data-toggle="modal" data-target="#<%=j2*20%>" align="right">View Submissions</button>
           </div> </div>
				  
				  <!--submit task2 -->
				  
  <!-- Modal -->
  <div class="col-md-12 col-md-offset-10">
  <div class="modal fade modal_design" id="<%=j2%>" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content" style = "padding:30px 30px 30px 30px;">
        <div class="modal-header">
          <h4 class="modal-title">Attach Paper</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          
        </div>
        <div class="modal-body">
          
          



          <div class="row">
    
      <form  action = "attach.jsp" method="post" onsubmit="check" enctype="multipart/form-data" >
        <fieldset>

          <!-- Form Name -->
         <div class="form-group">
			
        <input type = "hidden" name = "taskid" value = "2"/>
		 <input type = "hidden" name = "sub_name" value = "<%=s_name%>"/>
		 
              <input type="file" name="fileUpload" />
          <!-- Text input-->
        </div>
          <!-- Text input-->
          <div class="form-group">
            <label class="col-sm-3 control-label" for="textinput">Comment</label>
            <div class="col-sm-9">
              
               <textarea class="form-control" rows="3"  cols="80" placeholder="Your comments"  name="rmk"></textarea><br>
            </div>
          </div>

          

          
          </div>



          
          <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
              <div class="pull-right">
               
                <button type="submit" class="btn btn-primary">Submit</button>
              </div>
            </div>
          </div>

        </fieldset>
      </form>
    </div><!-- /.col-lg-12 -->
</div><!-- /.row -->
<script type="text/javascript">

</script>





        </div>
        
      </div>
      
    </div>
				  
				  
				  <!-- submit task2 ends -->
				  
				    <!-- View task2 starts -->
					
							   <!-- view progress task 2 -->
		   
		     <!-- Modal -->
  <div class="col-md-12 col-md-offset-10">
  <div class="modal fade modal_design" id="<%=j2*20%>" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content" style = "padding:30px 30px 30px 30px;">
        <div class="modal-header">
          <h4 class="modal-title">Attachments</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          
        </div>
        <div class="modal-body" >
          
          



          <div class="row">
    
      <form class="form-horizontal " style="margin-right:122px;margin-left:30px;" role="form">
        <fieldset>

          <!-- Form Name -->
		<% int atco2=0;
			  try{
         atno=null;
          amno=null;
									call = connection.prepareCall("{call erp.CL_INNOVATION_PKG.MT_GET_ATTACHMENT(?,?,?,?)}");
    
										call.setInt(2,2);
										call.setInt(1,project_id );
										call.setString(3,s_name);
										
										call.registerOutParameter(4,OracleTypes.CURSOR);
										call.execute();
										atno = (ResultSet) call.getObject(4);
										
  
							}
							catch(Exception exec){
								throw exec;}
								
								 try{
									call = connection.prepareCall("{call erp.CL_INNOVATION_PKG.MT_GET_ATTACHMENT_MCOM(?,?,?,?)}");
    
										call.setInt(2,2);
										call.setInt(1,project_id );
										call.setString(3,s_name);
										
										call.registerOutParameter(4,OracleTypes.CURSOR);
										call.execute();
										
										amno = (ResultSet) call.getObject(4);
  
							}
							catch(Exception exec){
								throw exec;}
		
		
		while(atno.next()){ 
		atco2++;
		%>
		
		  <div class="form-group">
            <label class="col-sm-5 control-label" for="textinput">Attachment-<%=atco2%></label>
            <div class="col-sm-7">
              Submitted by <%=atno.getString("name") %>: <a href=<%=atno.getString("file_url")%>  target=_blank style="color:blue;">Download </a> 
            </div>
          </div>



		
          <!-- Text input-->
          <div class="form-group">
            <label class="col-sm-5 control-label" for="textinput"><%=atno.getString("name") %> Says:</label>
            <div class="col-sm-7">
            <%=atno.getString("student_comment") %>

        
            </div>
          </div>
		  
		   
		  <hr style= "border-top: 1px solid #9e9797">
		  
		<% } %>
		
				<%if(atco2==0) {%>
		
			No submissions till Now 
			
		<%} atco2=0;%>
		
		
		<hr>
          <!-- Text input-->
      <% String pie2="";
      
      %>
      
       <%  if(amno.next()){ %>
      
      <% pie2= amno.getString("Mentor_comment") ;
      if(pie2==null){ 
      %>
      Mentor Review Pending.
      <% } else { %>
       <div class="modal-header">
          <h4 class="modal-title" float="left">Status</h4>
         
          <br>
        </div>

           <div class="form-group">
            <label class="col-sm-5 control-label" for="textinput">Mentor Says:</label>
            <div class="col-sm-7">
      
            <%=amno.getString("Mentor_comment") %>

        
            </div>
          </div>
      
       <div class="form-group">
            <label class="col-sm-5 control-label" for="textinput">Status:</label>
            <div class="col-sm-7">
      <% int sta=0;
      sta= amno.getInt("status");
      //out.println(sta);
      %>
      
           <% if( sta ==1) {%>
       Accepted <%} else {%>
       
       Re-Submit Please <%}%>

        
            </div>
          </div>
      

      <%} }%>


	   </div>



          
          

        </fieldset>
      </form>
    </div><!-- /.col-lg-12 -->
</div><!-- /.row -->
<script type="text/javascript">

</script>





        </div>
        
      </div>
      
    </div>
		   
		   
		   
		   
		   <!-- viewing progress task2 ends -->
					
					  <!-- view task2 ends -->
				  
				  
				  
				  
				 
			  

               <hr>
			   
			    <%}%>

            </div>
           
    </div>
	
	  <div id="not2" class="tab-pane fade">
	  
		 <div class="card-body" >
		 <%while (nr2.next()) { %>
		 
			<div class="row" style="padding-left:15px ">
			
			<div style = "display:inline-block; padding-top:0px">
			<h4 class="card-title"> Review on task 2.</h4>
			<strong>By CL Mentor <%=nr2.getString("NAME") %></strong> </div> 
			
		<p style="margin-top:10px">		
			Task have been rated(Out of 10) as following: <br>
			
			1. Commercial Impact : <%=nr2.getString("COM_IMPACT") %><br>
			
			2. Novelity: <%=nr2.getString("NOVELITY") %> <br>
			
			3. Application: <%=nr2.getString("APPLICATION") %> <br>
			
			4. Overall: <%=nr2.getString("user_rmks") %> <br>
			
		</p>
			
				
				
			</div>
			<hr>
		 
		 <% } %>
		
		 
		 </div>
	  
	  </div>




  <!-- Modal -->
  <div class="col-md-12 col-md-offset-10">
  <div class="modal fade modal_design" id="myModaltask2view" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content" style = "padding:30px 30px 30px 30px;">
        <div class="modal-header">
          <h4 class="modal-title">Attachments</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          
        </div>
        <div class="modal-body">
          
          



          <div class="row">
    
      <form class="form-horizontal" role="form">
        <fieldset>

          <!-- Form Name -->
          <legend>No attchments found till now.</legend>

          <!-- Text input-->
          <div class="form-group">
            <label class="col-sm-3 control-label" for="textinput">Student Remarks</label>
            <div class="col-sm-7">
              Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, 
            </div>
          </div>

          <!-- Text input-->
          <div class="form-group">
            <label class="col-sm-3 control-label" for="textinput">Comment</label>
            <div class="col-sm-7">
              <input type="text" placeholder="Your comments" class="form-control">
            </div>
          </div>

          

            <label class="col-sm-3 control-label" for="textinput">Remark</label>
            <div class="col-sm-4">
              <input type="text" placeholder="Remarks" class="form-control">
            </div>
          </div>



          
          <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
              <div class="pull-right">
                <button type="submit" class="btn btn-default">Re-Submit</button>
                <button type="submit" class="btn btn-primary">Accept</button>
              </div>
            </div>
          </div>

        </fieldset>
      </form>
    </div><!-- /.col-lg-12 -->
</div><!-- /.row -->
<script type="text/javascript">

</script>





        </div>
        
      </div>
      
    </div>
	
	

  </div>
  




           

            

   
   
    
  </div>


</div>

            
            




<!--task2 ended
#################################################################################################################################################################################################################################################################################################################################### 
 
       

  task3 starts 
####################################################################################################################################################################################################################################################################################################################################
-->

       
        <div class="col-md-4  portfolio-item">
          <div class="card ">





              <ul class="nav nav-tabs">
    <li class="active"><a data-toggle="tab" href="#home3">Task3</a></li>
    <li><a data-toggle="tab" href="#task3">Subtasks</a></li>
  <!--<li><a data-toggle="tab" href="#not3">Rating</a></li>-->
  

    
    
  </ul>
  <% int flag3=0; %>

  <div class="tab-content">
    <div id="home3" class="tab-pane fade in active">
     
      <div class="card-body">
        <center>
              <h1 class="card-title" style="font-size: 46px;">
                Literature Survey
              </h1>

  <%   int tus3=0;
                int tus3r=1;
                 int tus3re=1;
                    
     while (n33.next() && tus3r==1 ) { 
    tus3r--;
     tus3=n33.getInt("status");
    tus3re++;

  //out.println(tus3);

   if(tus3==1){
  %>

  <p style="color:green" ><i class="fa fa-check-circle-o" aria-hidden="true" style="font-size: 5.73em"></i>
 </p> <%} else if(tus3==-1){%> 
  <p style="color:red" ><i class="fa fa-check-circle-o" aria-hidden="true" style="font-size: 5.73em"></i> 
<br />
 
 <%}
}
%>
         </center>


                    <%  
                    rdate=null;
              try{
                  call = connection.prepareCall("{call erp.CL_INNOVATION_PKG.MT_GET_DATE(?,?,?,?,?)}");
    
                    call.setInt(1,3);
                    call.setInt(2,project_id );
                     call.setInt(3,userId);
                    
                    
                    call.registerOutParameter(4,OracleTypes.CURSOR);
                    call.registerOutParameter(5,OracleTypes.CURSOR);
                    call.execute();
                    rdate = (ResultSet) call.getObject(4);
                    rdate3= (ResultSet) call.getObject(5);

  
              }
              catch(Exception exec){
                throw exec;}

                %>

     
             

             
             

            

               


                <%


                if (rdate.next()){
        %>

              
             
              
            
            
              
              <br>
              <hr>
         <div class="row">
              
              <div class="col-md-6">
                
              <h5>Start Date: <%=rdate.getString("START_DATE") %></h5>
            </div>
            <div class="col-md-6">
             <h5>End Date: <%=rdate.getString("END_DATE") %></h5>
            </div>
              <hr>
            <% } else {  %>
<div class="row">
            <div class="col-md-12">
               <br>
              <br>

              <br>
              <br>
              
              <br>
              <hr>
            </div>
              <div class="col-md-5">
              
            </div>
                   
                   &nbsp &nbsp  <i class="fa fa-lock" style="font-size:48px;color:White"></i> 
                      <hr>

                <%}%>

              

  

            </div>
            </div>
     
    </div>







<!-- subtask of task 3 starts -->


    <div id="task3" class="tab-pane fade">


      
      <div class="card-body" >



        <% int count3 = 0;
    while(rss3.next()) { 
    count3++;%>
        <div class="row">


              <div class="col-md-12">
              <h4 class="card-title">
        
        
        <%
        String s_name="";
         s_name= rss3.getString("SUB_NAME"); %>
        
                <a href="#"><%=s_name %></a>

              </h4>
            </div>
      

         
        </div>
        <br>

              <p class="card-text"><%=rss3.getString("SUB_DESC") %> </p>

               <div class="row">


              <div class="col-md-12">
             <p class="card-text" style="color:#de9336; display:inline;"> Relevent Article by Mentor:   <a href=<%=rss3.getString("file_url")%>  target=_blank style="color:blue;">Download </a> </p> <br><br>

            </div>
      

         
        </div>
         
        
        <% 
        
        
      
         String projectdate = rss3.getString("END_DATE");
        projectdate = projectdate.substring(8,10)+"-"+projectdate.substring(5,8)+projectdate.substring(0,4);
        


        %> 
        <%
              try{
              rsn=null;
                  call = connection.prepareCall("{call erp.CL_INNOVATION_PKG.GET_SUBTASK_MEMBERS(?,?,?,?)}");
    
                    call.setInt(1,3);
                    call.setInt(2,project_id );
                    call.setString(3,s_name);
                    
                    call.registerOutParameter(4,OracleTypes.CURSOR);
                    call.execute();
                    rsn = (ResultSet) call.getObject(4);
  
              }
              catch(Exception exec){
                throw exec;}
        
        %>
        
        
        <p class="card-text" style="color:#de9336; display:inline;"> Assigned to:   </p> <% while(rsn.next()) {%>  <%=rsn.getString("member_name")  %> &nbsp <% }%> <br><br>
        <p class="card-text" style="color:#de9336; display:inline;"> Deadline:   </p> <%=projectdate%> </p>
        <hr>
         
          <div class="row">
           <div class="col-md-6">

                  <!-- Trigger the modal with a button -->
                  <button type="button" class="btn btn-info " data-toggle="modal" data-target="#<%=count3%>">Submit Paper</button> </div>
            <div class="col-md-6" align="right">
           <button type="button" class="btn btn-info " data-toggle="modal" data-target="#<%=count3*30%>" align="right">View Submissions</button>
           </div> </div>
          
          <!--submit task3 -->
          
  <!-- Modal -->
  <div class="col-md-12 col-md-offset-10">
  <div class="modal fade modal_design" id="<%=count3%>" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content" style = "padding:30px 30px 30px 30px;">
        <div class="modal-header">
          <h4 class="modal-title">Attach Paper</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          
        </div>
        <div class="modal-body">
          
          



          <div class="row">
    
      <form  action = "attach.jsp" method="post" onsubmit="check" enctype="multipart/form-data" >
        <fieldset>

          <!-- Form Name -->
         <div class="form-group">
      
        <input type = "hidden" name = "taskid" value = "3"/>
     <input type = "hidden" name = "sub_name" value = "<%=s_name%>"/>
     
              <input type="file" name="fileUpload" />
          <!-- Text input-->
        </div>
          <!-- Text input-->
          <div class="form-group">
            <label class="col-sm-3 control-label" for="textinput">Comment</label>
            <div class="col-sm-9">
              
               <textarea class="form-control" rows="3"  cols="80" placeholder="Your comments"  name="rmk"></textarea><br>
            </div>
          </div>

          

          
          </div>



          
          <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
              <div class="pull-right">
               
                <button type="submit" class="btn btn-primary">Submit</button>
              </div>
            </div>
          </div>

        </fieldset>
      </form>
    </div><!-- /.col-lg-12 -->
</div><!-- /.row -->
<script type="text/javascript">

</script>





        </div>
        
      </div>
      
    </div>
          
          
          <!-- submit task3 ends -->
          
            <!-- View task3 starts -->
          
                 <!-- view progress task 3 -->
       
         <!-- Modal -->
  <div class="col-md-12 col-md-offset-10">
  <div class="modal fade modal_design" id="<%=count3*30%>" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content" style = "padding:30px 30px 30px 30px;">
        <div class="modal-header">
          <h4 class="modal-title">Attachments</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          
        </div>
        <div class="modal-body" >
          
          



          <div class="row">
    
      <form class="form-horizontal " style="margin-right:122px;margin-left:30px;" role="form">
        <fieldset>

          <!-- Form Name -->
    <% int atco3=0;
        try{
                atno=null;
                amno=null;
                  call = connection.prepareCall("{call erp.CL_INNOVATION_PKG.MT_GET_ATTACHMENT(?,?,?,?)}");
    
                    call.setInt(2,3);
                    call.setInt(1,project_id );
                    call.setString(3,s_name);
                    
                    call.registerOutParameter(4,OracleTypes.CURSOR);
                    call.execute();
                    atno = (ResultSet) call.getObject(4);
                    
  
              }
              catch(Exception exec){
                throw exec;}
                
                 try{
                  call = connection.prepareCall("{call erp.CL_INNOVATION_PKG.MT_GET_ATTACHMENT_MCOM(?,?,?,?)}");
    
                    call.setInt(2,3);
                    call.setInt(1,project_id );
                    call.setString(3,s_name);
                    
                    call.registerOutParameter(4,OracleTypes.CURSOR);
                    call.execute();
                    
                    amno = (ResultSet) call.getObject(4);
  
              }
              catch(Exception exec){
                throw exec;}
    
    
    while(atno.next()){ 
    atco3++;
    %>
    
      <div class="form-group">
            <label class="col-sm-5 control-label" for="textinput">Attachment-<%=atco3%></label>
            <div class="col-sm-7">
              Submitted by <%=atno.getString("name") %>: <a href=<%=atno.getString("file_url")%>  target=_blank style="color:blue;">Download </a> 
            </div>
          </div>



    
          <!-- Text input-->
          <div class="form-group">
            <label class="col-sm-5 control-label" for="textinput"><%=atno.getString("name") %> Says:</label>
            <div class="col-sm-7">
            <%=atno.getString("student_comment") %>

        
            </div>
          </div>
      
       
      <hr style= "border-top: 1px solid #9e9797">
      
    <% } %>
    
        <%if(atco3==0) {%>
    
      No submissions till Now 
      
    <%} atco3=0;%>
    
    
    <hr>
          <!-- Text input-->
      <% String pie3="";
      
      %>
      
       <%  if(amno.next()){ %>
      
      <% pie3= amno.getString("Mentor_comment") ;
      if(pie3==null){ 
      %>
      Mentor Review Pending.
      <% } else { %>
       <div class="modal-header">
          <h4 class="modal-title" float="left">Status</h4>
         
          <br>
        </div>

           <div class="form-group">
            <label class="col-sm-5 control-label" for="textinput">Mentor Says:</label>
            <div class="col-sm-7">
      
            <%=amno.getString("Mentor_comment") %>

        
            </div>
          </div>
      
       <div class="form-group">
            <label class="col-sm-5 control-label" for="textinput">Status:</label>
            <div class="col-sm-7">
      <% int sta=0;
      sta= amno.getInt("status");
      //out.println(sta);
      %>
      
           <% if( sta ==1) {%>
       Accepted <%} else {%>
       
       Re-Submit Please <%}%>

        
            </div>
          </div>
      

      <%} }%>


     </div>



          
          

        </fieldset>
      </form>
    </div><!-- /.col-lg-12 -->
</div><!-- /.row -->
<script type="text/javascript">

</script>





        </div>
        
      </div>
      
    </div>
       
       
       
       
       <!-- viewing progress task3 ends -->
          
            <!-- view task3 ends -->
          
          
          
          
         
        

               <hr>
         
          <%}%>

            </div>
           
    </div>
  
    <div id="not3" class="tab-pane fade">
    
     <div class="card-body" >
     <%while (n3.next()) { %>
     
      <div class="row" style="padding-left:15px ">
      
      <div style = "display:inline-block; padding-top:0px">
      <h4 class="card-title"> Review on task 3.</h4>
      <strong>By CL Mentor <%=n3.getString("NAME") %></strong> </div> 
      
    <p style="margin-top:10px">   
      Task have been rated(Out of 10) as following: <br>
      
      1. Commercial Impact : <%=n3.getString("COM_IMPACT") %><br>
      
      2. Novelity: <%=n3.getString("NOVELITY") %> <br>
      
      3. Application: <%=n3.getString("APPLICATION") %> <br>
      
      4. Overall: <%=n3.getString("user_rmks") %> <br>
      
    </p>
      
        
        
      </div>
      <hr>
     
     <% } %>
    
     
     </div>
    
    </div>




  <!-- Modal -->
  <div class="col-md-12 col-md-offset-10">
  <div class="modal fade modal_design" id="myModaltask3view" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content" style = "padding:30px 30px 30px 30px;">
        <div class="modal-header">
          <h4 class="modal-title">Attachments</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          
        </div>
        <div class="modal-body">
          
          



          <div class="row">
    
      <form class="form-horizontal" role="form">
        <fieldset>

          <!-- Form Name -->
          <legend>No attchments found till now.</legend>

          <!-- Text input-->
          <div class="form-group">
            <label class="col-sm-3 control-label" for="textinput">Student Remarks</label>
            <div class="col-sm-7">
              Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, 
            </div>
          </div>

          <!-- Text input-->
          <div class="form-group">
            <label class="col-sm-3 control-label" for="textinput">Comment</label>
            <div class="col-sm-7">
              <input type="text" placeholder="Your comments" class="form-control">
            </div>
          </div>

          

            <label class="col-sm-3 control-label" for="textinput">Remark</label>
            <div class="col-sm-4">
              <input type="text" placeholder="Remarks" class="form-control">
            </div>
          </div>



          
          <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
              <div class="pull-right">
                <button type="submit" class="btn btn-default">Re-Submit</button>
                <button type="submit" class="btn btn-primary">Accept</button>
              </div>
            </div>
          </div>

        </fieldset>
      </form>
    </div><!-- /.col-lg-12 -->
</div><!-- /.row -->
<script type="text/javascript">

</script>





        </div>
        
      </div>
      
    </div>
  
  

  </div>
  




           

            

   
   
    
  </div>


</div>

            
            




<!--task3 ended

###################################################################################################################################################################################################################################################################################################################################




       task row 2 starts


       row 2 task 4 starts
       #################################################################################################################################################################################################################################################################################################################################################################################################################################################################################
        -->

       
        <div class="col-md-4  portfolio-item">
          <div class="card ">





              <ul class="nav nav-tabs">
    <li class="active"><a data-toggle="tab" href="#home4">Task4</a></li>
    <li><a data-toggle="tab" href="#task4">Subtasks</a></li>
  <!--<li><a data-toggle="tab" href="#not4">Rating</a></li>-->
  

    
    
  </ul>
  <% int flag4=0; %>

  <div class="tab-content">
    <div id="home4" class="tab-pane fade in active">
     
      <div class="card-body">
        <center>
              <h1 class="card-title" style="font-size: 46px;">
               Preparation of First Draft
              </h1>

<%
                try{

                n44=null;
 
  call = connection.prepareCall("{call erp.CL_INNOVATION_PKG.MT_GET_MARKS(?,?,?,?,?)}");
    
    call.setInt(1,4);
    call.setInt(2,project_id );  
  call.setInt(3,userId ); 
    call.registerOutParameter(4,OracleTypes.CURSOR);
     call.registerOutParameter(5,OracleTypes.CURSOR);
  call.execute();
  nr4 = (ResultSet) call.getObject(4);
   n44 = (ResultSet) call.getObject(5);
  

  }
  catch(Exception exec){
  throw exec;}


%>
           <%                   int tus4=0;
                int tus4r=1;
                    //out.println(tus4);
     while (nr4.next() && tus4r==1){ 
    tus4r--;
      //out.println("hon");
     tus4=nr4.getInt("STATUS");
    

  //out.println(tus4+"yugsda");

   if(tus4==1){
  %>

  <p style="color:green" ><i class="fa fa-check-circle-o" aria-hidden="true" style="font-size: 5.73em"></i>
 </p> <%} else if(tus4==-1){%> 
  <p style="color:red" ><i class="fa fa-check-circle-o" aria-hidden="true" style="font-size: 5.73em"></i> 
<br />
 
 <%}
}
%>
         </center>


                    <%  
              try{
                  call = connection.prepareCall("{call erp.CL_INNOVATION_PKG.MT_GET_DATE(?,?,?,?,?)}");
    
                    call.setInt(1,4);
                    call.setInt(2,project_id );
                     call.setInt(3,userId);
                    
                    
                    call.registerOutParameter(4,OracleTypes.CURSOR);
                    call.registerOutParameter(5,OracleTypes.CURSOR);
                    call.execute();
                    rdate = (ResultSet) call.getObject(4);
                    rdate4= (ResultSet) call.getObject(5);

  
              }
              catch(Exception exec){
                throw exec;}

                %>

     
             

             
             

            

               


                <%


                if (rdate.next()){
        %>

              
             
              
             
              
              <br>
              <hr>
         <div class="row">
              
              <div class="col-md-6">
                
              <h5>Start Date: <%=rdate.getString("START_DATE") %></h5>
            </div>
            <div class="col-md-6">
             <h5>End Date: <%=rdate.getString("END_DATE") %></h5>
            </div>
              <hr>
            <% } else {  %>
<div class="row">
            <div class="col-md-12">
               <br>
              <br>

              <br>
              <br>
              
              <br>
              <hr>
            </div>
              <div class="col-md-5">
              
            </div>
                   
                   &nbsp &nbsp  <i class="fa fa-lock" style="font-size:48px;color:White"></i> 
                      <hr>

                <%}%>

              

  

            </div>
            </div>
     
    </div>







<!-- subtask of task 4 starts -->


    <div id="task4" class="tab-pane fade">


      
      <div class="card-body" >



        <% int count4 = 0;
    while(rss4.next()) { 
    count4++;%>
        <div class="row">


              <div class="col-md-12">
              <h4 class="card-title">
        
        
        <%
        String s_name="";
         s_name= rss4.getString("SUB_NAME"); %>
        
                <a href="#"><%=s_name %></a>

              </h4>
            </div>
      

         
        </div>
        <br>

              <p class="card-text"><%=rss4.getString("SUB_DESC") %> </p>

               <div class="row">


              <div class="col-md-12">
             <p class="card-text" style="color:#de9336; display:inline;"> Relevent Article by Mentor:   <a href=<%=rss4.getString("file_url")%>  target=_blank style="color:blue;">Download </a> </p> <br><br>

            </div>
      

         
        </div>
         
        
        <% 
        
        
      
         String projectdate = rss4.getString("END_DATE");
        projectdate = projectdate.substring(8,10)+"-"+projectdate.substring(5,8)+projectdate.substring(0,4);
        


        %> 
        <%
              try{
              rsn=null;
                  call = connection.prepareCall("{call erp.CL_INNOVATION_PKG.GET_SUBTASK_MEMBERS(?,?,?,?)}");
    
                    call.setInt(1,4);
                    call.setInt(2,project_id );
                    call.setString(3,s_name);
                    
                    call.registerOutParameter(4,OracleTypes.CURSOR);
                    call.execute();
                    rsn = (ResultSet) call.getObject(4);
  
              }
              catch(Exception exec){
                throw exec;}
        
        %>
        
        
        <p class="card-text" style="color:#de9336; display:inline;"> Assigned to:   </p> <% while(rsn.next()) {%>  <%=rsn.getString("member_name")  %> &nbsp <% }%> <br><br>
        <p class="card-text" style="color:#de9336; display:inline;"> Deadline:   </p> <%=projectdate%> </p>
        <hr>
         
          <div class="row">
           <div class="col-md-6">

             <% int j4=400;
                  j4+=count4;
                %>

                  <!-- Trigger the modal with a button -->
                  <button type="button" class="btn btn-info " data-toggle="modal" data-target="#<%=j4%>">Submit Paper</button> </div>
            <div class="col-md-6" align="right">
           <button type="button" class="btn btn-info " data-toggle="modal" data-target="#<%=j4*40%>" align="right">View Submissions</button>
           </div> </div>
          
          <!--submit task4 -->
          
  <!-- Modal -->
  <div class="col-md-12 col-md-offset-10">
  <div class="modal fade modal_design" id="<%=j4%>" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content" style = "padding:30px 30px 30px 30px;">
        <div class="modal-header">
          <h4 class="modal-title">Attach Paper</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          
        </div>
        <div class="modal-body">
          
          



          <div class="row">
    
      <form  action = "attach.jsp" method="post" onsubmit="check" enctype="multipart/form-data" >
        <fieldset>

          <!-- Form Name -->
         <div class="form-group">
      
        <input type = "hidden" name = "taskid" value = "4"/>
     <input type = "hidden" name = "sub_name" value = "<%=s_name%>"/>
     
              <input type="file" name="fileUpload" />
          <!-- Text input-->
        </div>
          <!-- Text input-->
          <div class="form-group">
            <label class="col-sm-3 control-label" for="textinput">Comment</label>
            <div class="col-sm-9">
              
               <textarea class="form-control" rows="3"  cols="80" placeholder="Your comments"  name="rmk"></textarea><br>
            </div>
          </div>

          

          
          </div>



          
          <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
              <div class="pull-right">
               
                <button type="submit" class="btn btn-primary">Submit</button>
              </div>
            </div>
          </div>

        </fieldset>
      </form>
    </div><!-- /.col-lg-12 -->
</div><!-- /.row -->
<script type="text/javascript">

</script>





        </div>
        
      </div>
      
    </div>
          
          
          <!-- submit task4 ends -->
          
            <!-- View task4 starts -->
          
                 <!-- view progress task 4 -->
       
         <!-- Modal -->
  <div class="col-md-12 col-md-offset-10">
  <div class="modal fade modal_design" id="<%=j4*40%>" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content" style = "padding:30px 30px 30px 30px;">
        <div class="modal-header">
          <h4 class="modal-title">Attachments</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          
        </div>
        <div class="modal-body" >
          
          



          <div class="row">
    
      <form class="form-horizontal " style="margin-right:122px;margin-left:30px;" role="form">
        <fieldset>

          <!-- Form Name -->
    <% int atco4=0;
        try{

          atno=null;
          amno=null;

                  call = connection.prepareCall("{call erp.CL_INNOVATION_PKG.MT_GET_ATTACHMENT(?,?,?,?)}");
    
                    call.setInt(2,4);
                    call.setInt(1,project_id );
                    call.setString(3,s_name);
                    
                    call.registerOutParameter(4,OracleTypes.CURSOR);
                    call.execute();
                    atno = (ResultSet) call.getObject(4);
                    
  
              }
              catch(Exception exec){
                throw exec;}
                
                 try{
                  call = connection.prepareCall("{call erp.CL_INNOVATION_PKG.MT_GET_ATTACHMENT_MCOM(?,?,?,?)}");
    
                    call.setInt(2,4);
                    call.setInt(1,project_id );
                    call.setString(3,s_name);
                    
                    call.registerOutParameter(4,OracleTypes.CURSOR);
                    call.execute();
                    
                    amno = (ResultSet) call.getObject(4);
  
              }
              catch(Exception exec){
                throw exec;}
    
    
    while(atno.next()){ 
    atco4++;
    %>
    
      <div class="form-group">
            <label class="col-sm-5 control-label" for="textinput">Attachment-<%=atco4%></label>
            <div class="col-sm-7">
              Submitted by <%=atno.getString("name") %>: <a href=<%=atno.getString("file_url")%>  target=_blank style="color:blue;">Download </a> 
            </div>
          </div>



    
          <!-- Text input-->
          <div class="form-group">
            <label class="col-sm-5 control-label" for="textinput"><%=atno.getString("name") %> Says:</label>
            <div class="col-sm-7">
            <%=atno.getString("student_comment") %>

        
            </div>
          </div>
      
       
      <hr style= "border-top: 1px solid #9e9797">
      
    <% } %>
    
        <%if(atco4==0) {%>
    
      No submissions till Now 
      
    <%} atco4=0;%>
    
    
    <hr>
          <!-- Text input-->
      <% String pie4="";
      
      %>
      
       <%  if(amno.next()){ %>
      
      <% pie4= amno.getString("Mentor_comment") ;
      if(pie4==null){ 
      %>
      Mentor Review Pending.
      <% } else { %>
       <div class="modal-header">
          <h4 class="modal-title" float="left">Status</h4>
         
          <br>
        </div>

           <div class="form-group">
            <label class="col-sm-5 control-label" for="textinput">Mentor Says:</label>
            <div class="col-sm-7">
      
            <%=amno.getString("Mentor_comment") %>

        
            </div>
          </div>
      
       <div class="form-group">
            <label class="col-sm-5 control-label" for="textinput">Status:</label>
            <div class="col-sm-7">
      <% int sta=0;
      sta= amno.getInt("status");
      //out.println(sta);
      %>
      
           <% if( sta ==1) {%>
       Accepted <%} else {%>
       
       Re-Submit Please <%}%>

        
            </div>
          </div>
      

      <%} }%>


     </div>



          
          

        </fieldset>
      </form>
    </div><!-- /.col-lg-12 -->
</div><!-- /.row -->
<script type="text/javascript">

</script>





        </div>
        
      </div>
      
    </div>
       
       
       
       
       <!-- viewing progress task4 ends -->
          
            <!-- view task4 ends -->
          
          
          
          
         
        

               <hr>
         
          <%}%>

            </div>
           
    </div>
  
    <div id="not4" class="tab-pane fade">
    
     <div class="card-body" >
     <%while (nr4.next()) { %>
     
      <div class="row" style="padding-left:15px ">
      
      <div style = "display:inline-block; padding-top:0px">
      <h4 class="card-title"> Review on task 4.</h4>
      <strong>By CL Mentor <%=nr4.getString("NAME") %></strong> </div> 
      
    <p style="margin-top:10px">   
      Task have been rated(Out of 10) as following: <br>
      
      1. Commercial Impact : <%=nr4.getString("COM_IMPACT") %><br>
      
      2. Novelity: <%=nr4.getString("NOVELITY") %> <br>
      
      3. Application: <%=nr4.getString("APPLICATION") %> <br>
      
      4. Overall: <%=nr4.getString("user_rmks") %> <br>
      
    </p>
      
        
        
      </div>
      <hr>
     
     <% } %>
    
     
     </div>
    
    </div>




  <!-- Modal -->
  <div class="col-md-12 col-md-offset-10">
  <div class="modal fade modal_design" id="myModaltask4view" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content" style = "padding:30px 30px 30px 30px;">
        <div class="modal-header">
          <h4 class="modal-title">Attachments</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          
        </div>
        <div class="modal-body">
          
          



          <div class="row">
    
      <form class="form-horizontal" role="form">
        <fieldset>

          <!-- Form Name -->
          <legend>No attchments found till now.</legend>

          <!-- Text input-->
          <div class="form-group">
            <label class="col-sm-3 control-label" for="textinput">Student Remarks</label>
            <div class="col-sm-7">
              Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, 
            </div>
          </div>

          <!-- Text input-->
          <div class="form-group">
            <label class="col-sm-3 control-label" for="textinput">Comment</label>
            <div class="col-sm-7">
              <input type="text" placeholder="Your comments" class="form-control">
            </div>
          </div>

          

            <label class="col-sm-3 control-label" for="textinput">Remark</label>
            <div class="col-sm-4">
              <input type="text" placeholder="Remarks" class="form-control">
            </div>
          </div>



          
          <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
              <div class="pull-right">
                <button type="submit" class="btn btn-default">Re-Submit</button>
                <button type="submit" class="btn btn-primary">Accept</button>
              </div>
            </div>
          </div>

        </fieldset>
      </form>
    </div><!-- /.col-lg-12 -->
</div><!-- /.row -->
<script type="text/javascript">

</script>





        </div>
        
      </div>
      
    </div>
  
  

  </div>
  




           

            

   
   
    
  </div>


</div>

            
            


  <!--row 2 task4 ended
######################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################  
  task 5 starts
-->

         <div class="col-md-4  portfolio-item">
          <div class="card ">





              <ul class="nav nav-tabs">
    <li class="active"><a data-toggle="tab" href="#home5">Task5</a></li>
    <li><a data-toggle="tab" href="#task5">Subtasks</a></li>
  <!--<li><a data-toggle="tab" href="#not5">Rating</a></li>-->
  

    
    
  </ul>
  <% int flag5=0; %>

  <div class="tab-content">
    <div id="home5" class="tab-pane fade in active">
     
      <div class="card-body">
        <center>
              <h1 class="card-title" style="font-size: 46px;">
               Registration of Journal
              </h1>

<%
                try{

                n55=null;
 
  call = connection.prepareCall("{call erp.CL_INNOVATION_PKG.MT_GET_MARKS(?,?,?,?,?)}");
    
    call.setInt(1,5);
    call.setInt(2,project_id );  
  call.setInt(3,userId ); 
    call.registerOutParameter(4,OracleTypes.CURSOR);
     call.registerOutParameter(5,OracleTypes.CURSOR);
  call.execute();
  nr5 = (ResultSet) call.getObject(4);
   n55 = (ResultSet) call.getObject(5);
  

  }
  catch(Exception exec){
  throw exec;}


%>
           <%                   int tus5=0;
                int tus5r=1;
                    //out.println(tus5);
     while (nr5.next() && tus5r==1){ 
    tus5r--;
      //out.println("hon");
     tus5=nr5.getInt("STATUS");
    

  //out.println(tus5+"yugsda");

   if(tus5==1){
  %>

  <p style="color:green" ><i class="fa fa-check-circle-o" aria-hidden="true" style="font-size: 5.73em"></i>
 </p> <%} else if(tus5==-1){%> 
  <p style="color:red" ><i class="fa fa-check-circle-o" aria-hidden="true" style="font-size: 5.73em"></i> 
<br />
 
 <%}
}
%>
         </center>


                    <%  
              try{
                  call = connection.prepareCall("{call erp.CL_INNOVATION_PKG.MT_GET_DATE(?,?,?,?,?)}");
    
                    call.setInt(1,5);
                    call.setInt(2,project_id );
                     call.setInt(3,userId);
                    
                    
                    call.registerOutParameter(4,OracleTypes.CURSOR);
                    call.registerOutParameter(5,OracleTypes.CURSOR);
                    call.execute();
                    rdate = (ResultSet) call.getObject(4);
                    rdate5= (ResultSet) call.getObject(5);

  
              }
              catch(Exception exec){
                throw exec;}

                %>

     
             

             
             

            

               


                <%


                if (rdate.next()){
        %>

              
             
              
             
              
              <br>
              <hr>
         <div class="row">
              
              <div class="col-md-6">
                
              <h5>Start Date: <%=rdate.getString("START_DATE") %></h5>
            </div>
            <div class="col-md-6">
             <h5>End Date: <%=rdate.getString("END_DATE") %></h5>
            </div>
              <hr>
            <% } else {  %>
<div class="row">
            <div class="col-md-12">
               <br>
              <br>

              <br>
              <br>
              
              <br>
              <hr>
            </div>
              <div class="col-md-5">
              
            </div>
                   
                   &nbsp &nbsp  <i class="fa fa-lock" style="font-size:48px;color:White"></i> 
                      <hr>

                <%}%>

              

  

            </div>
            </div>
     
    </div>







<!-- subtask of task 5 starts -->


    <div id="task5" class="tab-pane fade">


      
      <div class="card-body" >



        <% int count5 = 0;
    while(rss5.next()) { 
    count5++;%>
        <div class="row">


              <div class="col-md-12">
              <h4 class="card-title">
        
        
        <%
        String s_name="";
         s_name= rss5.getString("SUB_NAME"); %>
        
                <a href="#"><%=s_name %></a>

              </h4>
            </div>
      

         
        </div>
        <br>

              <p class="card-text"><%=rss5.getString("SUB_DESC") %> </p>

               <div class="row">


              <div class="col-md-12">
             <p class="card-text" style="color:#de9336; display:inline;"> Relevent Article by Mentor:   <a href=<%=rss5.getString("file_url")%>  target=_blank style="color:blue;">Download </a> </p> <br><br>

            </div>
      

         
        </div>
         
        
        <% 
        
        
      
         String projectdate = rss5.getString("END_DATE");
        projectdate = projectdate.substring(8,10)+"-"+projectdate.substring(5,8)+projectdate.substring(0,4);
        


        %> 
        <%
              try{
              rsn=null;
                  call = connection.prepareCall("{call erp.CL_INNOVATION_PKG.GET_SUBTASK_MEMBERS(?,?,?,?)}");
    
                    call.setInt(1,5);
                    call.setInt(2,project_id );
                    call.setString(3,s_name);
                    
                    call.registerOutParameter(4,OracleTypes.CURSOR);
                    call.execute();
                    rsn = (ResultSet) call.getObject(4);
  
              }
              catch(Exception exec){
                throw exec;}
        
        %>
        
        
        <p class="card-text" style="color:#de9336; display:inline;"> Assigned to:   </p> <% while(rsn.next()) {%>  <%=rsn.getString("member_name")  %> &nbsp <% }%> <br><br>
        <p class="card-text" style="color:#de9336; display:inline;"> Deadline:   </p> <%=projectdate%> </p>
        <hr>
         
          <div class="row">
           <div class="col-md-6">

             <% int j5=500;
                  j5+=count5;
                %>

                  <!-- Trigger the modal with a button -->
                  <button type="button" class="btn btn-info " data-toggle="modal" data-target="#<%=j5%>">Submit Paper</button> </div>
            <div class="col-md-6" align="right">
           <button type="button" class="btn btn-info " data-toggle="modal" data-target="#<%=j5*50%>" align="right">View Submissions</button>
           </div> </div>
          
          <!--submit task5 -->
          
  <!-- Modal -->
  <div class="col-md-12 col-md-offset-10">
  <div class="modal fade modal_design" id="<%=j5%>" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content" style = "padding:30px 30px 30px 30px;">
        <div class="modal-header">
          <h4 class="modal-title">Attach Paper</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          
        </div>
        <div class="modal-body">
          
          



          <div class="row">
    
      <form  action = "attach.jsp" method="post" onsubmit="check" enctype="multipart/form-data" >
        <fieldset>

          <!-- Form Name -->
         <div class="form-group">
      
        <input type = "hidden" name = "taskid" value = "5"/>
     <input type = "hidden" name = "sub_name" value = "<%=s_name%>"/>
     
              <input type="file" name="fileUpload" />
          <!-- Text input-->
        </div>
          <!-- Text input-->
          <div class="form-group">
            <label class="col-sm-3 control-label" for="textinput">Comment</label>
            <div class="col-sm-9">
              
               <textarea class="form-control" rows="3"  cols="80" placeholder="Your comments"  name="rmk"></textarea><br>
            </div>
          </div>

          

          
          </div>



          
          <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
              <div class="pull-right">
               
                <button type="submit" class="btn btn-primary">Submit</button>
              </div>
            </div>
          </div>

        </fieldset>
      </form>
    </div><!-- /.col-lg-12 -->
</div><!-- /.row -->
<script type="text/javascript">

</script>





        </div>
        
      </div>
      
    </div>
          
          
          <!-- submit task5 ends -->
          
            <!-- View task5 starts -->
          
                 <!-- view progress task 5 -->
       
         <!-- Modal -->
  <div class="col-md-12 col-md-offset-10">
  <div class="modal fade modal_design" id="<%=j5*50%>" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content" style = "padding:30px 30px 30px 30px;">
        <div class="modal-header">
          <h4 class="modal-title">Attachments</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          
        </div>
        <div class="modal-body" >
          
          



          <div class="row">
    
      <form class="form-horizontal " style="margin-right:122px;margin-left:30px;" role="form">
        <fieldset>

          <!-- Form Name -->
    <% int atco5=0;
        try{

          atno=null;
          amno=null;

                  call = connection.prepareCall("{call erp.CL_INNOVATION_PKG.MT_GET_ATTACHMENT(?,?,?,?)}");
    
                    call.setInt(2,5);
                    call.setInt(1,project_id );
                    call.setString(3,s_name);
                    
                    call.registerOutParameter(4,OracleTypes.CURSOR);
                    call.execute();
                    atno = (ResultSet) call.getObject(4);
                    
  
              }
              catch(Exception exec){
                throw exec;}
                
                 try{
                  call = connection.prepareCall("{call erp.CL_INNOVATION_PKG.MT_GET_ATTACHMENT_MCOM(?,?,?,?)}");
    
                    call.setInt(2,5);
                    call.setInt(1,project_id );
                    call.setString(3,s_name);
                    
                    call.registerOutParameter(4,OracleTypes.CURSOR);
                    call.execute();
                    
                    amno = (ResultSet) call.getObject(4);
  
              }
              catch(Exception exec){
                throw exec;}
    
    
    while(atno.next()){ 
    atco5++;
    %>
    
      <div class="form-group">
            <label class="col-sm-5 control-label" for="textinput">Attachment-<%=atco5%></label>
            <div class="col-sm-7">
              Submitted by <%=atno.getString("name") %>: <a href=<%=atno.getString("file_url")%>  target=_blank style="color:blue;">Download </a> 
            </div>
          </div>



    
          <!-- Text input-->
          <div class="form-group">
            <label class="col-sm-5 control-label" for="textinput"><%=atno.getString("name") %> Says:</label>
            <div class="col-sm-7">
            <%=atno.getString("student_comment") %>

        
            </div>
          </div>
      
       
      <hr style= "border-top: 1px solid #9e9797">
      
    <% } %>
    
        <%if(atco5==0) {%>
    
      No submissions till Now 
      
    <%} atco5=0;%>
    
    
    <hr>
          <!-- Text input-->
      <% String pie5="";
      
      %>
      
       <%  if(amno.next()){ %>
      
      <% pie5= amno.getString("Mentor_comment") ;
      if(pie5==null){ 
      %>
      Mentor Review Pending.
      <% } else { %>
       <div class="modal-header">
          <h4 class="modal-title" float="left">Status</h4>
         
          <br>
        </div>

           <div class="form-group">
            <label class="col-sm-5 control-label" for="textinput">Mentor Says:</label>
            <div class="col-sm-7">
      
            <%=amno.getString("Mentor_comment") %>

        
            </div>
          </div>
      
       <div class="form-group">
            <label class="col-sm-5 control-label" for="textinput">Status:</label>
            <div class="col-sm-7">
      <% int sta=0;
      sta= amno.getInt("status");
      //out.println(sta);
      %>
      
           <% if( sta ==1) {%>
       Accepted <%} else {%>
       
       Re-Submit Please <%}%>

        
            </div>
          </div>
      

      <%} }%>


     </div>



          
          

        </fieldset>
      </form>
    </div><!-- /.col-lg-12 -->
</div><!-- /.row -->
<script type="text/javascript">

</script>





        </div>
        
      </div>
      
    </div>
       
       
       
       
       <!-- viewing progress task5 ends -->
          
            <!-- view task5 ends -->
          
          
          
          
         
        

               <hr>
         
          <%}%>

            </div>
           
    </div>
  
    <div id="not5" class="tab-pane fade">
    
     <div class="card-body" >
     <%while (nr5.next()) { %>
     
      <div class="row" style="padding-left:15px ">
      
      <div style = "display:inline-block; padding-top:0px">
      <h4 class="card-title"> Review on task 5.</h4>
      <strong>By CL Mentor <%=nr5.getString("NAME") %></strong> </div> 
      
    <p style="margin-top:10px">   
      Task have been rated(Out of 10) as following: <br>
      
      1. Commercial Impact : <%=nr5.getString("COM_IMPACT") %><br>
      
      2. Novelity: <%=nr5.getString("NOVELITY") %> <br>
      
      3. Application: <%=nr5.getString("APPLICATION") %> <br>
      
      4. Overall: <%=nr5.getString("user_rmks") %> <br>
      
    </p>
      
        
        
      </div>
      <hr>
     
     <% } %>
    
     
     </div>
    
    </div>




  <!-- Modal -->
  <div class="col-md-12 col-md-offset-10">
  <div class="modal fade modal_design" id="myModaltask5view" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content" style = "padding:30px 30px 30px 30px;">
        <div class="modal-header">
          <h4 class="modal-title">Attachments</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          
        </div>
        <div class="modal-body">
          
          



          <div class="row">
    
      <form class="form-horizontal" role="form">
        <fieldset>

          <!-- Form Name -->
          <legend>No attchments found till now.</legend>

          <!-- Text input-->
          <div class="form-group">
            <label class="col-sm-3 control-label" for="textinput">Student Remarks</label>
            <div class="col-sm-7">
              Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, 
            </div>
          </div>

          <!-- Text input-->
          <div class="form-group">
            <label class="col-sm-3 control-label" for="textinput">Comment</label>
            <div class="col-sm-7">
              <input type="text" placeholder="Your comments" class="form-control">
            </div>
          </div>

          

            <label class="col-sm-3 control-label" for="textinput">Remark</label>
            <div class="col-sm-4">
              <input type="text" placeholder="Remarks" class="form-control">
            </div>
          </div>



          
          <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
              <div class="pull-right">
                <button type="submit" class="btn btn-default">Re-Submit</button>
                <button type="submit" class="btn btn-primary">Accept</button>
              </div>
            </div>
          </div>

        </fieldset>
      </form>
    </div><!-- /.col-lg-12 -->
</div><!-- /.row -->
<script type="text/javascript">

</script>





        </div>
        
      </div>
      
    </div>
  
  

  </div>
  




           

            

   
   
    
  </div>


</div>

           


    <!-- task6 starts task 5 ended
######################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################
  -->

        <div class="col-md-4  portfolio-item">
          <div class="card ">





              <ul class="nav nav-tabs">
    <li class="active"><a data-toggle="tab" href="#home6">Task6</a></li>
    <li><a data-toggle="tab" href="#task6">Subtasks</a></li>
  <!--<li><a data-toggle="tab" href="#not6">Rating</a></li>-->
  

    
    
  </ul>
  <% int flag6=0; %>

  <div class="tab-content">
    <div id="home6" class="tab-pane fade in active">
     
      <div class="card-body">
        <center>
              <h1 class="card-title" style="font-size: 46px;">
               Preparation of Script and PPT
              </h1>

<%
                try{

                n66=null;
 
  call = connection.prepareCall("{call erp.CL_INNOVATION_PKG.MT_GET_MARKS(?,?,?,?,?)}");
    
    call.setInt(1,6);
    call.setInt(2,project_id );  
  call.setInt(3,userId ); 
    call.registerOutParameter(4,OracleTypes.CURSOR);
     call.registerOutParameter(5,OracleTypes.CURSOR);
  call.execute();
  nr6 = (ResultSet) call.getObject(4);
   n66 = (ResultSet) call.getObject(5);
  

  }
  catch(Exception exec){
  throw exec;}


%>
           <%                   int tus6=0;
                int tus6r=1;
                    //out.println(tus6);
     while (nr6.next() && tus6r==1){ 
    tus6r--;
      //out.println("hon");
     tus6=nr6.getInt("STATUS");
    

  //out.println(tus6+"yugsda");

   if(tus6==1){
  %>

  <p style="color:green" ><i class="fa fa-check-circle-o" aria-hidden="true" style="font-size: 5.73em"></i>
 </p> <%} else if(tus6==-1){%> 
  <p style="color:red" ><i class="fa fa-check-circle-o" aria-hidden="true" style="font-size: 5.73em"></i> 
<br />
 
 <%}
}
%>
         </center>


                    <%  
              try{
                  call = connection.prepareCall("{call erp.CL_INNOVATION_PKG.MT_GET_DATE(?,?,?,?,?)}");
    
                    call.setInt(1,6);
                    call.setInt(2,project_id );
                     call.setInt(3,userId);
                    
                    
                    call.registerOutParameter(4,OracleTypes.CURSOR);
                    call.registerOutParameter(5,OracleTypes.CURSOR);
                    call.execute();
                    rdate = (ResultSet) call.getObject(4);
                    rdate6= (ResultSet) call.getObject(5);

  
              }
              catch(Exception exec){
                throw exec;}

                %>

     
             

             
             

            

               


                <%


                if (rdate.next()){
        %>

              
             
              
             
              
              <br>
              <hr>
         <div class="row">
              
              <div class="col-md-6">
                
              <h5>Start Date: <%=rdate.getString("START_DATE") %></h5>
            </div>
            <div class="col-md-6">
             <h5>End Date: <%=rdate.getString("END_DATE") %></h5>
            </div>
              <hr>
            <% } else {  %>
<div class="row">
            <div class="col-md-12">
               <br>
              <br>

              <br>
              <br>
              
              <br>
              <hr>
            </div>
              <div class="col-md-5">
              
            </div>
                   
                   &nbsp &nbsp  <i class="fa fa-lock" style="font-size:48px;color:White"></i> 
                      <hr>

                <%}%>

              

  

            </div>
            </div>
     
    </div>







<!-- subtask of task 6 starts -->


    <div id="task6" class="tab-pane fade">


      
      <div class="card-body" >



        <% int count6 = 0;
    while(rss6.next()) { 
    count6++;%>
        <div class="row">


              <div class="col-md-12">
              <h4 class="card-title">
        
        
        <%
        String s_name="";
         s_name= rss6.getString("SUB_NAME"); %>
        
                <a href="#"><%=s_name %></a>

              </h4>
            </div>
      

         
        </div>
        <br>

              <p class="card-text"><%=rss6.getString("SUB_DESC") %> </p>

               <div class="row">


              <div class="col-md-12">
             <p class="card-text" style="color:#de9336; display:inline;"> Relevent Article by Mentor:   <a href=<%=rss6.getString("file_url")%>  target=_blank style="color:blue;">Download </a> </p> <br><br>

            </div>
      

         
        </div>
         
        
        <% 
        
        
      
         String projectdate = rss6.getString("END_DATE");
        projectdate = projectdate.substring(8,10)+"-"+projectdate.substring(5,8)+projectdate.substring(0,4);
        


        %> 
        <%
              try{
              rsn=null;
                  call = connection.prepareCall("{call erp.CL_INNOVATION_PKG.GET_SUBTASK_MEMBERS(?,?,?,?)}");
    
                    call.setInt(1,6);
                    call.setInt(2,project_id );
                    call.setString(3,s_name);
                    
                    call.registerOutParameter(4,OracleTypes.CURSOR);
                    call.execute();
                    rsn = (ResultSet) call.getObject(4);
  
              }
              catch(Exception exec){
                throw exec;}
        
        %>
        
        
        <p class="card-text" style="color:#de9336; display:inline;"> Assigned to:   </p> <% while(rsn.next()) {%>  <%=rsn.getString("member_name")  %> &nbsp <% }%> <br><br>
        <p class="card-text" style="color:#de9336; display:inline;"> Deadline:   </p> <%=projectdate%> </p>
        <hr>
         
          <div class="row">
           <div class="col-md-6">

             <% int j6=600;
                  j6+=count6;
                %>

                  <!-- Trigger the modal with a button -->
                  <button type="button" class="btn btn-info " data-toggle="modal" data-target="#<%=j6%>">Submit Paper</button> </div>
            <div class="col-md-6" align="right">
           <button type="button" class="btn btn-info " data-toggle="modal" data-target="#<%=j6*60%>" align="right">View Submissions</button>
           </div> </div>
          
          <!--submit task6 -->
          
  <!-- Modal -->
  <div class="col-md-12 col-md-offset-10">
  <div class="modal fade modal_design" id="<%=j6%>" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content" style = "padding:30px 30px 30px 30px;">
        <div class="modal-header">
          <h4 class="modal-title">Attach Paper</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          
        </div>
        <div class="modal-body">
          
          



          <div class="row">
    
      <form  action = "attach.jsp" method="post" onsubmit="check" enctype="multipart/form-data" >
        <fieldset>

          <!-- Form Name -->
         <div class="form-group">
      
        <input type = "hidden" name = "taskid" value = "6"/>
     <input type = "hidden" name = "sub_name" value = "<%=s_name%>"/>
     
              <input type="file" name="fileUpload" />
          <!-- Text input-->
        </div>
          <!-- Text input-->
          <div class="form-group">
            <label class="col-sm-3 control-label" for="textinput">Comment</label>
            <div class="col-sm-9">
              
               <textarea class="form-control" rows="3"  cols="80" placeholder="Your comments"  name="rmk"></textarea><br>
            </div>
          </div>

          

          
          </div>



          
          <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
              <div class="pull-right">
               
                <button type="submit" class="btn btn-primary">Submit</button>
              </div>
            </div>
          </div>

        </fieldset>
      </form>
    </div><!-- /.col-lg-12 -->
</div><!-- /.row -->
<script type="text/javascript">

</script>





        </div>
        
      </div>
      
    </div>
          
          
          <!-- submit task6 ends -->
          
            <!-- View task6 starts -->
          
                 <!-- view progress task 6 -->
       
         <!-- Modal -->
  <div class="col-md-12 col-md-offset-10">
  <div class="modal fade modal_design" id="<%=j6*60%>" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content" style = "padding:30px 30px 30px 30px;">
        <div class="modal-header">
          <h4 class="modal-title">Attachments</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          
        </div>
        <div class="modal-body" >
          
          



          <div class="row">
    
      <form class="form-horizontal " style="margin-right:122px;margin-left:30px;" role="form">
        <fieldset>

          <!-- Form Name -->
    <% int atco6=0;
        try{

          atno=null;
          amno=null;

                  call = connection.prepareCall("{call erp.CL_INNOVATION_PKG.MT_GET_ATTACHMENT(?,?,?,?)}");
    
                    call.setInt(2,6);
                    call.setInt(1,project_id );
                    call.setString(3,s_name);
                    
                    call.registerOutParameter(4,OracleTypes.CURSOR);
                    call.execute();
                    atno = (ResultSet) call.getObject(4);
                    
  
              }
              catch(Exception exec){
                throw exec;}
                
                 try{
                  call = connection.prepareCall("{call erp.CL_INNOVATION_PKG.MT_GET_ATTACHMENT_MCOM(?,?,?,?)}");
    
                    call.setInt(2,6);
                    call.setInt(1,project_id );
                    call.setString(3,s_name);
                    
                    call.registerOutParameter(4,OracleTypes.CURSOR);
                    call.execute();
                    
                    amno = (ResultSet) call.getObject(4);
  
              }
              catch(Exception exec){
                throw exec;}
    
    
    while(atno.next()){ 
    atco6++;
    %>
    
      <div class="form-group">
            <label class="col-sm-5 control-label" for="textinput">Attachment-<%=atco6%></label>
            <div class="col-sm-7">
              Submitted by <%=atno.getString("name") %>: <a href=<%=atno.getString("file_url")%>  target=_blank style="color:blue;">Download </a> 
            </div>
          </div>



    
          <!-- Text input-->
          <div class="form-group">
            <label class="col-sm-5 control-label" for="textinput"><%=atno.getString("name") %> Says:</label>
            <div class="col-sm-7">
            <%=atno.getString("student_comment") %>

        
            </div>
          </div>
      
       
      <hr style= "border-top: 1px solid #9e9797">
      
    <% } %>
    
        <%if(atco6==0) {%>
    
      No submissions till Now 
      
    <%} atco6=0;%>
    
    
    <hr>
          <!-- Text input-->
      <% String pie6="";
      
      %>
      
       <%  if(amno.next()){ %>
      
      <% pie6= amno.getString("Mentor_comment") ;
      if(pie6==null){ 
      %>
      Mentor Review Pending.
      <% } else { %>
       <div class="modal-header">
          <h4 class="modal-title" float="left">Status</h4>
         
          <br>
        </div>

           <div class="form-group">
            <label class="col-sm-5 control-label" for="textinput">Mentor Says:</label>
            <div class="col-sm-7">
      
            <%=amno.getString("Mentor_comment") %>

        
            </div>
          </div>
      
       <div class="form-group">
            <label class="col-sm-5 control-label" for="textinput">Status:</label>
            <div class="col-sm-7">
      <% int sta=0;
      sta= amno.getInt("status");
      //out.println(sta);
      %>
      
           <% if( sta ==1) {%>
       Accepted <%} else {%>
       
       Re-Submit Please <%}%>

        
            </div>
          </div>
      

      <%} }%>


     </div>



          
          

        </fieldset>
      </form>
    </div><!-- /.col-lg-12 -->
</div><!-- /.row -->
<script type="text/javascript">

</script>





        </div>
        
      </div>
      
    </div>
       
       
       
       
       <!-- viewing progress task6 ends -->
          
            <!-- view task6 ends -->
          
          
          
          
         
        

               <hr>
         
          <%}%>

            </div>
           
    </div>
  
    <div id="not6" class="tab-pane fade">
    
     <div class="card-body" >
     <%while (nr6.next()) { %>
     
      <div class="row" style="padding-left:15px ">
      
      <div style = "display:inline-block; padding-top:0px">
      <h4 class="card-title"> Review on task 6.</h4>
      <strong>By CL Mentor <%=nr6.getString("NAME") %></strong> </div> 
      
    <p style="margin-top:10px">   
      Task have been rated(Out of 10) as following: <br>
      
      1. Commercial Impact : <%=nr6.getString("COM_IMPACT") %><br>
      
      2. Novelity: <%=nr6.getString("NOVELITY") %> <br>
      
      3. Application: <%=nr6.getString("APPLICATION") %> <br>
      
      4. Overall: <%=nr6.getString("user_rmks") %> <br>
      
    </p>
      
        
        
      </div>
      <hr>
     
     <% } %>
    
     
     </div>
    
    </div>




  <!-- Modal -->
  <div class="col-md-12 col-md-offset-10">
  <div class="modal fade modal_design" id="myModaltask6view" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content" style = "padding:30px 30px 30px 30px;">
        <div class="modal-header">
          <h4 class="modal-title">Attachments</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          
        </div>
        <div class="modal-body">
          
          



          <div class="row">
    
      <form class="form-horizontal" role="form">
        <fieldset>

          <!-- Form Name -->
          <legend>No attchments found till now.</legend>

          <!-- Text input-->
          <div class="form-group">
            <label class="col-sm-3 control-label" for="textinput">Student Remarks</label>
            <div class="col-sm-7">
              Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, 
            </div>
          </div>

          <!-- Text input-->
          <div class="form-group">
            <label class="col-sm-3 control-label" for="textinput">Comment</label>
            <div class="col-sm-7">
              <input type="text" placeholder="Your comments" class="form-control">
            </div>
          </div>

          

            <label class="col-sm-3 control-label" for="textinput">Remark</label>
            <div class="col-sm-4">
              <input type="text" placeholder="Remarks" class="form-control">
            </div>
          </div>



          
          <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
              <div class="pull-right">
                <button type="submit" class="btn btn-default">Re-Submit</button>
                <button type="submit" class="btn btn-primary">Accept</button>
              </div>
            </div>
          </div>

        </fieldset>
      </form>
    </div><!-- /.col-lg-12 -->
</div><!-- /.row -->
<script type="text/javascript">

</script>





        </div>
        
      </div>
      
    </div>
  
  

  </div>
  




           

            

   
   
    
  </div>


</div>

           




  <!--
###################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################### -->

</div>
</div>
    <!-- /.container -->

    <!-- Footer -->
  

    <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>


<!--   ################################## -->

<footer class="footer">
    
    <!-- Parallax -->
    <div id="parallax-one" class="parallax" style="background-image: url(images/02.jpg); background-position: 50% 0;">
        <div class="footer-promo">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                      <center>
                        <h2 class="fs20"><a href="javascript:void(0);" style="color:#FFFFFF;">Melting<span class="orange">Pot</span>2020</a></h2>
                        <p>A Never-Before Dialogue Between Corporates And Institutions</p>
                        <h4>Come, be a part of it</h4>
                        <p><span class="twitter-btn" style="text-align: center; display: block;">
                            <button class="btn btn-color2"><i style="padding-top: 5px;" class="fa fa-twitter mr-r-10 txt-white"></i><a href="https://twitter.com/MeltingPot2020" target="_blank" class="txt-white">Follow @MeltingPot2020</a></button></span></p></center>
                        
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    </div>
    
    
    </footer>
<!-- ################################################################################################ -->
<a id="backtotop" href="#top"><i class="fa fa-chevron-up"></i></a>
<!-- JAVASCRIPTS -->
<script src="layout/scripts/jquery.min.js"></script>
<script src="layout/scripts/jquery.backtotop.js"></script>
<script src="layout/scripts/jquery.mobilemenu.js"></script>


<div class="wrapper row5">
  <div id="copyright" class="hoc clear"> 
    <!-- ################################################################################################ -->
    <p class="fl_left">Copyright &copy; 2017 - All Rights Reserved - <a href="#"> Worldwide Academia Industry Network (WAIN)</a></p>
    <p class="fl_right"> <a target="_blank" href="#" title="Free Website Templates">Milestone Tracker</a></p>
    <!-- ################################################################################################ -->
  </div>
</div>
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<a id="backtotop" href="#top"><i class="fa fa-chevron-up"></i></a>
<!-- JAVASCRIPTS -->
<script src="layout/scripts/jquery.min.js"></script>
<script src="layout/scripts/jquery.backtotop.js"></script>
<script src="layout/scripts/jquery.mobilemenu.js"></script>

  </body>

</html>
