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
  
 
  
  out.println(project_id);
  
  
  

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
ResultSet rsn3 = null;
ResultSet rsn4 = null;
ResultSet rsn5 = null;
ResultSet rsn6 = null;
ResultSet rda = null;
ResultSet rda2 = null;
ResultSet rdate = null;
ResultSet rdate2 = null;
ResultSet rdate3 = null;
ResultSet rdate33 = null;
ResultSet rdate4 = null;
ResultSet rdate44 = null;
ResultSet rdate5 = null;
ResultSet rdate55 = null;
ResultSet rdate6 = null;
ResultSet rdate66 = null;
ResultSet atno = null;
ResultSet atcount2 = null;
ResultSet atcount3 = null;
ResultSet atcount4 = null;
ResultSet atcount5 = null;
ResultSet atcount6 = null;
ResultSet n2 = null;
ResultSet n22 = null;
ResultSet n3 = null;
ResultSet n33 = null;
ResultSet n4 = null;
ResultSet n44 = null;
ResultSet n5 = null;
ResultSet n55 = null;
ResultSet n6 = null;
ResultSet n66 = null;


  

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
 
  call = connection.prepareCall("{call erp.CL_INNOVATION_PKG.MT_GET_MARKS(?,?,?,?,?)}");
    
    call.setInt(1,2);
    call.setInt(2,project_id );  
  call.setInt(3,userId ); 
    call.registerOutParameter(4,OracleTypes.CURSOR);
     call.registerOutParameter(5,OracleTypes.CURSOR);
  call.execute();
  call.execute();
  n2 = (ResultSet) call.getObject(4);
  n22= (ResultSet) call.getObject(5);
  

   

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
  call.execute();
  n3 = (ResultSet) call.getObject(4);
  n33= (ResultSet) call.getObject(5);
  
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
  call.execute();
  n4 = (ResultSet) call.getObject(4);
  n44= (ResultSet) call.getObject(5);
  
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
  call.execute();
  n5 = (ResultSet) call.getObject(4);
  n55= (ResultSet) call.getObject(5);
  
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
  call.execute();
  n6 = (ResultSet) call.getObject(4);
  n66= (ResultSet) call.getObject(5);
  
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


element.style {
    padding: 10px 0px 7px 0px;
}

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
  font-size: x-large;

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

.fabutton {
  background: none;
  padding: 0px;
  border: none;
}

.form-control {
    display: block;
    width: 160%;
    height: 34px;
    padding: 6px 12px;
    font-size: 14px;
    line-height: 1.42857143;
    color: #555;
    background-color: #fff;
    background-image: none;
    border: 1px solid #ccc;
    border-radius: 4px;
    -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
    box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
    -webkit-transition: border-color ease-in-out .15s,-webkit-box-shadow ease-in-out .15s;
    -o-transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
    transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
}


.form-contro {
    display: block;
    width: 100%;
    height: 34px;
    padding: 6px 12px;
    font-size: 14px;
    line-height: 1.42857143;
    color: #555;
    background-color: #fff;
    background-image: none;
    border: 1px solid #ccc;
    border-radius: 4px;
    -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
    box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
    -webkit-transition: border-color ease-in-out .15s,-webkit-box-shadow ease-in-out .15s;
    -o-transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
    transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
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

@media (min-width: 768px) {
  .modal-dialog {
    width: 800;
    margin: 30px auto;
  }
  .modal-content {
    -webkit-box-shadow: 0 5px 15px rgba(0, 0, 0, .5);
            box-shadow: 0 5px 15px rgba(0, 0, 0, .5);
  }
  .modal-sm {
    width: 300px;
  }
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

<li><a href="../mentor.jsp">Home</a><span class="divider">>></span></li>
<li><a href="#">Project Progress</a></li>
</ul>


    <!-- Page Content -->
    <div class="container">

      <!-- Page Heading -->
    <% while(rs.next()){%>
      <div class="row">

        <div class="col-md-12">
    <% String projectName = rs.getString("PROJECT_NAME");
      projectName = projectName.substring(0,1).toUpperCase() + projectName.substring(1).toLowerCase();%>
      <center><h1 class="my-4" style="color:white"> <%=projectName%>
       
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
                <button type="submit" class="fabutton" data-toggle="modal" data-target="#myMod0">
                    <i class="fa fa-lock" style="font-size:38px;color:White"></i> </button> 

                <%}%>

                <hr>

  

            </div>
            </div>


          <!-- Modal -->
  <div class="col-md-12 col-md-offset-10">
  <div class="modal fade modal_design" id="myMod0" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content" style = "padding:30px 30px 30px 30px;">
        <div class="modal-header">
          <center> <h3 class="modal-title">Start the Task</h3> </center>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          
        </div>
        <div class="modal-body">
          
          



          <div class="row">
    
      <form action="open_task.jsp" class="form-horizontal" role="form">
        <input type = "hidden" name = "taskid" value = "1">
        <fieldset>

          <!-- Form Name -->
          


          <!-- Text input-->
          <div class="form-group">
            <label class="col-sm-4 control-label" for="textinput"> Start Date </label>
            <div class="col-sm-6">
              <input type="text" name="sd" placeholder="DD-MM-YYYY" class="form-control" required/>
            </div>
          </div>

          <!-- Text input-->
          <div class="form-group">
            <label class="col-sm-4 control-label" for="textinput">End Date</label>
            <div class="col-sm-6">
              <input type="text" name="ed" placeholder="DD-MM-YYYY" class="form-control"required/>
            </div>
          </div>




          
          <div class="form-group">
            <div class="col-sm-6">
            </div>
            <div class="col-sm-6">
              <div float="right">
                
                <button type="submit" class="btn btn-primary">Unlock the task</button>
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

                            <%   int tus2;
                int tus2r=1;
                    
     while (n22.next() && tus2r==1 ) { 
    tus2r--;
     tus2=n22.getInt("status");
    

  

   if(tus2==1){
  %>
  <p style="color:green" ><i class="fa fa-check-circle-o" aria-hidden="true" style="font-size: 5.73em"></i>
 </p><%} }%>
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

     
             

              <br>
              <br>

              <%

              if(rdate2.next()){ %>

              <div class="row">


                <div class="col-md-8">



        <form action = "cc.jsp">
        <input type = "hidden" name = "taskid" value = "2"/>
               <button type="submit" class="btn btn-info "  float="left">Create New SubTask</button></form>
             </div>
             <div class="col-md-4">

         <%     try{
                  call = connection.prepareCall("{call erp.CL_INNOVATION_PKG.MT_GET_ATTACHMENT_COUNT(?,?,?)}");
    
                    call.setInt(2,2);
                    call.setInt(1,project_id );
                    
                    
                    call.registerOutParameter(3,OracleTypes.CURSOR);
                    call.execute();
                    atcount2 = (ResultSet) call.getObject(3);
  
              }
              catch(Exception exec){
                throw exec;}

    %>
               <form action = "cc.jsp">
        <input type = "hidden" name = "taskid" value = "2"/>

           <% if (atcount2.next()) { %>
               <button type="button" class="btn btn-info " float="right" data-toggle="modal" data-target="#myModaltask2">
                Review</button>
                <%} else { %>
                <button type="button" class="btn btn-info " disabled="" float="right" data-toggle="modal" data-target="#myModaltask2">
                Review</button> <%}%>

              </form> 
             </div> 
             </div>
              
              <%}%>
              
              <br>
             
             

            

               


                <%


                if (rdate.next()){
        %>
         <hr>

             <div class="row">
        
              
              <div class="col-md-6">
              <h5>Start Date: <%=rdate.getString("START_DATE") %></h5>
            </div>
            <div class="col-md-6">
             <h5>End Date: <%=rdate.getString("END_DATE") %></h5>
            </div>

            <% } else {  %>

             <br>
              <br>
               <hr>
             <div class="row">


              <div class="col-md-6">
              
            </div>
                <button type="submit" class="fabutton" data-toggle="modal" data-target="#myMod">
                    <i class="fa fa-lock" style="font-size:38px;color:White"></i> </button> 

                <%}%>

                <hr>

  

            </div>
            </div>
     
    </div>


          <!-- Modal -->
  <div class="col-md-12 col-md-offset-10">
  <div class="modal fade modal_design" id="myMod" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content" style = "padding:30px 30px 30px 30px;">
        <div class="modal-header">
          <center> <h3 class="modal-title">Start the Task</h3> </center>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          
        </div>
        <div class="modal-body">
          
          



          <div class="row">
    
      <form action="open_task.jsp" class="form-horizontal" role="form">
        <input type = "hidden" name = "taskid" value = "2">
        <fieldset>

          <!-- Form Name -->
          


          <!-- Text input-->
          <div class="form-group">
            <label class="col-sm-4 control-label" for="textinput"> Start Date </label>
            <div class="col-sm-6">
              <input type="text" name="sd" placeholder="DD-MM-YYYY" class="form-control" required/>
            </div>
          </div>

          <!-- Text input-->
          <div class="form-group">
            <label class="col-sm-4 control-label" for="textinput">End Date</label>
            <div class="col-sm-6">
              <input type="text" name="ed" placeholder="DD-MM-YYYY" class="form-control"required/>
            </div>
          </div>




          
          <div class="form-group">
            <div class="col-sm-6">
            </div>
            <div class="col-sm-6">
              <div float="right">
                
                <button type="submit" class="btn btn-primary">Unlock the task</button>
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





      <!-- Modal -->
  <div class="col-md-12 col-md-offset-10">
  <div class="modal fade modal_design" id="myModaltask2" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content" style = "padding:30px 30px 30px 30px;">
        <div class="modal-header">
          <center> <h3 class="modal-title">Rate the Task</h3> </center>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          
        </div>
        <div class="modal-body">
          
          



          <div class="row">
    
      <form action="allotmarks.jsp" class="form-horizontal" role="form">
        <input type = "hidden" name = "taskid" value = "2">
        <fieldset>

          <!-- Form Name -->
          


          <!-- Text input-->
          <div class="form-group">
            <label class="col-sm-4 control-label" for="textinput">Commercial Impact </label>
            <div class="col-sm-6">
              <input type="text" name="ci" placeholder="Market potential of the innovation" class="form-control" required/>
            </div>
          </div>

          <!-- Text input-->
          <div class="form-group">
            <label class="col-sm-4 control-label" for="textinput">Novelity</label>
            <div class="col-sm-6">
              <input type="text" name="nov" placeholder="How unique is the project?" class="form-control"required/>
            </div>
          </div>

          <!-- Text input-->
          <div class="form-group">
            <label class="col-sm-4 control-label" for="textinput">Application</label>
            <div class="col-sm-6">
              <input type="text" name="app" placeholder="The degree of use of the innovation" class="form-control"required/>
            </div>

          </div>
          <div class="form-group">
            <label class="col-sm-4 control-label" for="textinput">Remark</label>
            <div class="col-sm-6">
              <input type="text" name="remark" placeholder="Remarks" class="form-control"required/>
            </div>
          </div>

          <div class="form-group">
            <label class="col-sm-4 control-label" for="textinput">Status</label>
            <div class="col-sm-3" >
              <input type="radio" name="rad" value="-1"  > Open  </input></div>
              <div class="col-sm-3" >
               <input type="radio" name="rad" value="1"  > Close  </input>
            </div>
          </div>




          
          <div class="form-group">
            <div class="col-sm-6">
            </div>
            <div class="col-sm-6">
              <div float="right">
                
                <button type="submit" class="btn btn-primary">Allot</button>
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







<!-- subtask of task 2 starts -->


    <div id="task2" class="tab-pane fade">


      
      <div class="card-body" >



        <% int count2 = 0;
        int atco2=0;
		
    while(rss2.next()) { 
    count2++;%>
        <div class="row">


              <div class="col-md-10">
              <h4 class="card-title">
				
								<%
				String s_name="";
				 s_name= rss2.getString("SUB_NAME");
					%>
				
               <%=rss2.getString("SUB_NAME") %>

              </h4>
            </div>


            <div class="col-md-2">

                
  <form action = "delete_subtask.jsp" onsubmit="return confirm('Do you really want to Delete this Subtask?')" >
                  <input type = "hidden" name = "subname" value = "<%=s_name%>"/> 
                   <input type = "hidden" name = "taskid" value = "2">



<button type="submit" class="fabutton">
                    <i class="fa fa-remove" style="font-size:38px;color:White"></i> </button> </form> 

           </div>






 <div class="row" style="padding-left:30px;">


                <% int j2=200;
                  j2+=count2;
                %>


                    <!-- Trigger the modal with a button -->
                  <button type="button" class="btn btn-info " data-toggle="modal" data-target="#<%=j2%>">View progress</button>


                   </div> 


		   <!-- view progress task 2 -->
		   
		     <!-- Modal -->
  <div class="col-md-12 col-md-offset-10">
  <div class="modal fade modal_design" id="<%=j2%>" role="dialog">
    <div class="modal-dialog" style="width:1250px;">
    
      <!-- Modal content-->
      <div class="modal-content" style = "padding:30px 30px 30px 30px;">
        <div class="modal-header">
          <h4 class="modal-title">Attachments</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          
        </div>
        <div class="modal-body" >
          
              
        
          <%
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
        
        
        <p class="card-text" style="color:#de9336; display:inline;"> Assigned to:   </p> <% while(rsn.next()) {%>  <%=rsn.getString("member_name")  %>  <% }%>



          <div class="row">
    
      <form action="sub_approve.jsp" method="post" class="form-horizontal" role="form" style="width:200%">
	  
	   <input type = "hidden" name = "taskid" value = "2"/>
	    <input type = "hidden" name = "sub_name" value = "<%=s_name%>"/>
		
       <fieldset> 

          <!-- Form Name -->
		<% 
			  try{
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
		
		

		while(atno.next()){ 
		atco2++; 
   

    %> 
		
		
		  <div class="form-group">
            <label class="col-sm-5 control-label" for="textinput">Submitted By:</label>
            <div class="col-sm-7">
             <%=atno.getString("name") %>
            </div>
          </div>

          <div class="form-group">
            <label class="col-sm-5 control-label" for="textinput">File </label>
            <div class="col-sm-7">
              <a href=<%=atno.getString("file_url")%>  target=_blank style="color:blue;">Download </a> 
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
			
		<%} else {%>
		
		

          <!-- Text input-->
          <div class="form-group">
            <label class="col-sm-5 control-label" for="textinput">Comment</label>
            <div class="col-sm-7">
              <input type="text" name="mcom" placeholder="Your comments" class="form-contro"/>
            </div>
          </div>
		  
		   <div class="form-group">
            <label class="col-sm-5 control-label" for="textinput">Status</label>
           <div class="col-sm-4">
              <input type="radio" name="stat" value="0" > Re-submit </input></div>
			  <div class="col-sm-3">
			  <input type="radio" name="stat" value="1" >Accept </input>
            </div>
          </div>

		  <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
              <div class="pull-right">
               
                <button type="submit" class="btn btn-primary">Submit</button>
              </div>
            </div>
          </div>
		<% } atco2=0;%>

           
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
		   
		   
		   
        </div>
        <br>

              <p class="card-text"><%=rss2.getString("SUB_DESC") %> </p>

              
                   <div class="row">


              <div class="col-md-12">
<p class="card-text" style="color:#de9336; display:inline;"> Relevent Article by Mentor:   <a href=<%=rss2.getString("file_url")%>  target=_blank style="color:blue;">Download </a> </p>
        
        <br>
        <br>
        
                

              
            </div>
          </div>



			  
			  	<%
              rsn = null;
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
				
				<% 
				
				
			
				 String projectdate = rss2.getString("END_DATE");
				projectdate = projectdate.substring(8,10)+"-"+projectdate.substring(5,8)+projectdate.substring(0,4);
				


				%> 
				  <p class="card-text" style="color:#de9336; display:inline;"> Deadline:   </p> <%=projectdate%> </p>
			  

               <hr>
			   
			    <%}%>
				
				<%if(count2==0){ %>
					<br><br><br><br><br>
				<center><p class="card-text"><h1> No Subtask Created. </h1></p> </center> <%}%>

            </div>
           
    </div>
	
	  <div id="not2" class="tab-pane fade">
	  
		 <div class="card-body" >
		 <% 
			int review2=0;
		 while (n2.next()) { 
		 review2++;%>
		 
			<div class="row" style="padding-left:15px ">
			
			<div style = "display:inline-block; padding-top:0px">
			<h4 class="card-title"> Review on task 2.</h4>
			<strong>By CL Mentor <%=n2.getString("NAME") %></strong> </div> 
			
		<p style="margin-top:10px">		
			Task have been rated(Out of 10) as following: <br>
			
			1. Commercial Impact : <%=n2.getString("COM_IMPACT") %><br>
			
			2. Novelity: <%=n2.getString("NOVELITY") %> <br>
			
			3. Application: <%=n2.getString("APPLICATION") %> <br>
			
			4. Overall: <%=n2.getString("user_rmks") %> <br>
			
		</p>
			
			  <div class="col-md-5">
			  </div>
  <div class="col-md-7">
                  <!-- Trigger the modal with a button -->
                  <button type="button" class="btn btn-info " data-toggle="modal" data-target="#Approve2">Approve this Subtask</button>
           </div>	
				
			</div>
			<hr>
		 
		 <% } %>
		
		<%if(review2==0){ %>
					<br><br><br><br><br>
				<center><p class="card-text"><h1> Yet to be Reviewed. </h1></p> </center> <%}%>
		 
		 </div>
	  
	  </div>





  </div>
  




           

            

   
   
    
  </div>


</div>

            
            
<!--
####################################################################################################################################################################################################################################################################################################################################

task2 ended
 
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

                            <%   int tus3=-1;
                int tus3r=1;
                    
     while (n33.next() && tus3r==1 ) { 
    tus3r--;
     tus3=n33.getInt("status");
    
   //  out.println(tus3);
  

   if(tus3==1){
  %>
  <p style="color:green" ><i class="fa fa-check-circle-o" aria-hidden="true" style="font-size: 5.73em"></i>
 </p><%} }%>
         </center>


                    <%  
              try{
                  call = connection.prepareCall("{call erp.CL_INNOVATION_PKG.MT_GET_DATE(?,?,?,?,?)}");
    
                    call.setInt(1,3);
                    call.setInt(2,project_id );
                     call.setInt(3,userId);
                    
                    
                    call.registerOutParameter(4,OracleTypes.CURSOR);
                    call.registerOutParameter(5,OracleTypes.CURSOR);
                    call.execute();
                    rdate33 = (ResultSet) call.getObject(4);
                    rdate3= (ResultSet) call.getObject(5);

  
              }
              catch(Exception exec){
                throw exec;}

                %>

     
             

              <br>
              <br>

              <%

              if(rdate3.next()){ %>

              <div class="row">


                <div class="col-md-8">



        <form action = "cc.jsp">
        <input type = "hidden" name = "taskid" value = "3"/>
               <button type="submit" class="btn btn-info "  float="left">Create New SubTask</button></form>
             </div>
             <div class="col-md-4">

         <%     try{
                  call = connection.prepareCall("{call erp.CL_INNOVATION_PKG.MT_GET_ATTACHMENT_COUNT(?,?,?)}");
    
                    call.setInt(2,3);
                    call.setInt(1,project_id );
                    
                    
                    call.registerOutParameter(3,OracleTypes.CURSOR);
                    call.execute();
                    atcount3 = (ResultSet) call.getObject(3);
  
              }
              catch(Exception exec){
                throw exec;}

    %>
               <form action = "cc.jsp">
        <input type = "hidden" name = "taskid" value = "3"/>

           <% if (atcount3.next()) { %>
               <button type="button" class="btn btn-info " float="right" data-toggle="modal" data-target="#myModaltask3">
                Review</button>
                <%} else { %>
                <button type="button" class="btn btn-info " disabled="" float="right" data-toggle="modal" data-target="#myModaltask3">
                Review</button> <%}%>

              </form> 
             </div> 
             </div>
              
              <%}%>
              
              <br>
             
             

            

               


                <%


                if (rdate33.next()){
        %>

          <hr>
         <div class="row">
              
              <div class="col-md-6">
              <h5>Start Date: <%=rdate33.getString("START_DATE") %></h5>
            </div>
            <div class="col-md-6">
             <h5>End Date: <%=rdate33.getString("END_DATE") %></h5>
            </div>

            <% } else {  %>
              <br>
              <br>
               <hr>
               <div class="row">
              <div class="col-md-6">
              
            </div>
                <button type="submit" class="fabutton" data-toggle="modal" data-target="#myMod3">
                    <i class="fa fa-lock" style="font-size:38px;color:White"></i> </button> 

                <%}%>

                <hr>

  

            </div>
            </div>
     
    </div>


          <!-- Modal -->
  <div class="col-md-12 col-md-offset-10">
  <div class="modal fade modal_design" id="myMod3" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content" style = "padding:30px 30px 30px 30px;">
        <div class="modal-header">
          <center> <h3 class="modal-title">Start the Task</h3> </center>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          
        </div>
        <div class="modal-body">
          
          



          <div class="row">
    
      <form action="open_task.jsp" class="form-horizontal" role="form">
        <input type = "hidden" name = "taskid" value = "3">
        <fieldset>

          <!-- Form Name -->
          


          <!-- Text input-->
          <div class="form-group">
            <label class="col-sm-4 control-label" for="textinput"> Start Date </label>
            <div class="col-sm-6">
              <input type="text" name="sd" placeholder="DD-MM-YYYY" class="form-control" required/>
            </div>
          </div>

          <!-- Text input-->
          <div class="form-group">
            <label class="col-sm-4 control-label" for="textinput">End Date</label>
            <div class="col-sm-6">
              <input type="text" name="ed" placeholder="DD-MM-YYYY" class="form-control"required/>
            </div>
          </div>




          
          <div class="form-group">
            <div class="col-sm-6">
            </div>
            <div class="col-sm-6">
              <div float="right">
                
                <button type="submit" class="btn btn-primary">Unlock the task</button>
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





      <!-- Modal -->
  <div class="col-md-12 col-md-offset-10">
  <div class="modal fade modal_design" id="myModaltask3" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content" style = "padding:30px 30px 30px 30px;">
        <div class="modal-header">
          <center> <h3 class="modal-title">Rate the Task</h3> </center>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          
        </div>
        <div class="modal-body">
          
          



          <div class="row">
    
      <form action="allotmarks.jsp" class="form-horizontal" role="form">
        <input type = "hidden" name = "taskid" value = "3">
        <fieldset>

          <!-- Form Name -->
          


          <!-- Text input-->
          <div class="form-group">
            <label class="col-sm-4 control-label" for="textinput">Commercial Impact </label>
            <div class="col-sm-6">
              <input type="text" name="ci" placeholder="Market potential of the innovation" class="form-control" required/>
            </div>
          </div>

          <!-- Text input-->
          <div class="form-group">
            <label class="col-sm-4 control-label" for="textinput">Novelity</label>
            <div class="col-sm-6">
              <input type="text" name="nov" placeholder="How unique is the project?" class="form-control"required/>
            </div>
          </div>

          <!-- Text input-->
          <div class="form-group">
            <label class="col-sm-4 control-label" for="textinput">Application</label>
            <div class="col-sm-6">
              <input type="text" name="app" placeholder="The degree of use of the innovation" class="form-control"required/>
            </div>

          </div>
          <div class="form-group">
            <label class="col-sm-4 control-label" for="textinput">Remark</label>
            <div class="col-sm-6">
              <input type="text" name="remark" placeholder="Remarks" class="form-control"required/>
            </div>
          </div>

          <div class="form-group">
            <label class="col-sm-4 control-label" for="textinput">Status</label>
            <div class="col-sm-3" >
              <input type="radio" name="rad" value="-1"  > Open  </input></div>
              <div class="col-sm-3" >
               <input type="radio" name="rad" value="1"  > Close  </input>
            </div>
          </div>




          
          <div class="form-group">
            <div class="col-sm-6">
            </div>
            <div class="col-sm-6">
              <div float="right">
                
                <button type="submit" class="btn btn-primary">Allot</button>
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







<!-- subtask of task 3 starts -->


    <div id="task3" class="tab-pane fade">


      
      <div class="card-body" >



        <% int count3 = 0;
        int atco3=0;
    
    while(rss3.next()) { 
    count3++;%>
        <div class="row">


              <div class="col-md-10">
              <h4 class="card-title">
        
                <%
        String s_name="";
         s_name= rss3.getString("SUB_NAME");
          %>
        
               <%=rss3.getString("SUB_NAME") %>

              </h4>
            </div>


            <div class="col-md-2">

                
  <form action = "delete_subtask.jsp" onsubmit="return confirm('Do you really want to Delete this Subtask?')" >
                  <input type = "hidden" name = "subname" value = "<%=s_name%>"/> 
                   <input type = "hidden" name = "taskid" value = "3">



<button type="submit" class="fabutton">
                    <i class="fa fa-remove" style="font-size:38px;color:White"></i> </button> </form> 

           </div>






 <div class="row" style="padding-left:30px;">


                <% int j3=300;
                  j3+=count3;
                %>

                    <!-- Trigger the modal with a button -->
                  <button type="button" class="btn btn-info " data-toggle="modal" data-target="#<%=j3%>">View progress</button>


                   </div> 


       <!-- view progress task 3 -->
       
         <!-- Modal -->
  <div class="col-md-12 col-md-offset-10">
  <div class="modal fade modal_design" id="<%=j3%>" role="dialog">
    <div class="modal-dialog" style="width:1250px;">
    
      <!-- Modal content-->
      <div class="modal-content" style = "padding:30px 30px 30px 30px;">
        <div class="modal-header">
          <h4 class="modal-title">Attachments</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          
        </div>
        <div class="modal-body" >
          
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
        
        
        <p class="card-text"><font color="red">Assigned to: </font> <% while(rsn.next()) { %>  <%=rsn.getString("member_name")%> &nbsp <%}%></p>



          <div class="row">
    
      <form action="sub_approve.jsp" method="post" class="form-horizontal" role="form" style="width:200%">
    
     <input type = "hidden" name = "taskid" value = "3"/>
      <input type = "hidden" name = "sub_name" value = "<%=s_name%>"/>
    
       <fieldset> 

          <!-- Form Name -->
    <% 
        try{
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
    
    

    while(atno.next()){ 
    atco3++; 
   

    %> 
    
    
      <div class="form-group">
            <label class="col-sm-5 control-label" for="textinput">Submitted By:</label>
            <div class="col-sm-7">
             <%=atno.getString("name") %>
            </div>
          </div>

          <div class="form-group">
            <label class="col-sm-5 control-label" for="textinput">File </label>
            <div class="col-sm-7">
              <a href=<%=atno.getString("file_url")%>  target=_blank style="color:blue;">Download </a> 
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
      
    <%} else {%>
    
    

          <!-- Text input-->
          <div class="form-group">
            <label class="col-sm-5 control-label" for="textinput">Comment</label>
            <div class="col-sm-7">
              <input type="text" name="mcom" placeholder="Your comments" class="form-contro"/>
            </div>
          </div>
      
       <div class="form-group">
            <label class="col-sm-5 control-label" for="textinput">Status</label>
           <div class="col-sm-4">
              <input type="radio" name="stat" value="0" > Re-submit </input></div>
        <div class="col-sm-3">
        <input type="radio" name="stat" value="1" >Accept </input>
            </div>
          </div>

      <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
              <div class="pull-right">
               
                <button type="submit" class="btn btn-primary">Submit</button>
              </div>
            </div>
          </div>
    <% } atco3=0;%>

           
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
       
       
       
        </div>
        <br>

              <p class="card-text"><%=rss3.getString("SUB_DESC") %> </p>

              
                   <div class="row">


              <div class="col-md-12">
<p class="card-text" style="color:#de9336; display:inline;"> Relevent Article by Mentor:   <a href=<%=rss3.getString("file_url")%>  target=_blank style="color:blue;">Download </a> </p>
        
        <br>
        <br>
        
                

              
            </div>
          </div>



        
          <%
              try{

                  rsn3=null;
                  call = connection.prepareCall("{call erp.CL_INNOVATION_PKG.GET_SUBTASK_MEMBERS(?,?,?,?)}");
    
                    call.setInt(1,3);
                    call.setInt(2,project_id );
                    call.setString(3,s_name);
                    
                    call.registerOutParameter(4,OracleTypes.CURSOR);
                    call.execute();
                    rsn3 = (ResultSet) call.getObject(4);
  
              }
              catch(Exception exec){
                throw exec;}
        
        %>
        
        
        <p class="card-text" style="color:#de9336; display:inline;"> Assigned to:   </p> <% while(rsn3.next()) {%>  <%=rsn3.getString("member_name")  %> &nbsp <% }%> <br><br>
        
        <% 
        
        
      
         String projectdate = rss3.getString("END_DATE");
        projectdate = projectdate.substring(8,10)+"-"+projectdate.substring(5,8)+projectdate.substring(0,4);
        


        %> 
          <p class="card-text" style="color:#de9336; display:inline;"> Deadline:   </p> <%=projectdate%> </p>
        

               <hr>
         
          <%}%>
        
        <%if(count3==0){ %>
          <br><br><br><br><br>
        <center><p class="card-text"><h1> No Subtask Created. </h1></p> </center> <%}%>

            </div>
           
    </div>
  
    <div id="not3" class="tab-pane fade">
    
     <div class="card-body" >
     <% 
      int review3=0;
     while (n3.next()) { 
     review3++;%>
     
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
      
        <div class="col-md-5">
        </div>
  <div class="col-md-7">
                  <!-- Trigger the modal with a button -->
                  <button type="button" class="btn btn-info " data-toggle="modal" data-target="#Approve3">Approve this Subtask</button>
           </div> 
        
      </div>
      <hr>
     
     <% } %>
    
    <%if(review3==0){ %>
          <br><br><br><br><br>
        <center><p class="card-text"><h1> Yet to be Reviewed. </h1></p> </center> <%}%>
     
     </div>
    
    </div>





  </div>
  




           

            

   
   
    
  </div>


</div>

            
            
<!--
####################################################################################################################################################################################################################################################################################################################################
            




task3 ended

       task row 2 starts


       row 2 task 4 starts

 #####################################################################################################################################################################################################################################################################################################################################      
        
 

 
  task4 starts 
       

####################################################################################################################################################################################################################################################################################################################################
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

                            <%   int tus4=-1;
                int tus4r=1;
                    
     while (n44.next() && tus4r==1 ) { 
    tus4r--;
     tus4=n44.getInt("status");
    
   //  out.println(tus4);
  

   if(tus4==1){
  %>
  <p style="color:green" ><i class="fa fa-check-circle-o" aria-hidden="true" style="font-size: 5.73em"></i>
 </p><%} }%>
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
                    rdate44 = (ResultSet) call.getObject(4);
                    rdate4= (ResultSet) call.getObject(5);

  
              }
              catch(Exception exec){
                throw exec;}

                %>

     
             

              <br>
              <br>

              <%

              if(rdate4.next()){ %>

              <div class="row">


                <div class="col-md-8">



        <form action = "cc.jsp">
        <input type = "hidden" name = "taskid" value = "4"/>
               <button type="submit" class="btn btn-info "  float="left">Create New SubTask</button></form>
             </div>
             <div class="col-md-4">

         <%     try{
                  call = connection.prepareCall("{call erp.CL_INNOVATION_PKG.MT_GET_ATTACHMENT_COUNT(?,?,?)}");
    
                    call.setInt(2,4);
                    call.setInt(1,project_id );
                    
                    
                    call.registerOutParameter(3,OracleTypes.CURSOR);
                    call.execute();
                    atcount4 = (ResultSet) call.getObject(3);
  
              }
              catch(Exception exec){
                throw exec;}

    %>
               <form action = "cc.jsp">
        <input type = "hidden" name = "taskid" value = "4"/>

           <% if (atcount4.next()) { %>
               <button type="button" class="btn btn-info " float="right" data-toggle="modal" data-target="#myModaltask4">
                Review</button>
                <%} else { %>
                <button type="button" class="btn btn-info " disabled="" float="right" data-toggle="modal" data-target="#myModaltask4">
                Review</button> <%}%>

              </form> 
             </div> 
             </div>
              
              <%}%>
              
              <br>
             
             

            

               


                <%


                if (rdate44.next()){
        %>

          <hr>
         <div class="row">
              
              <div class="col-md-6">
              <h5>Start Date: <%=rdate44.getString("START_DATE") %></h5>
            </div>
            <div class="col-md-6">
             <h5>End Date: <%=rdate44.getString("END_DATE") %></h5>
            </div>

            <% } else {  %>
              <br>
              <br>
               <hr>
               <div class="row">
              <div class="col-md-6">
              
            </div>
                <button type="submit" class="fabutton" data-toggle="modal" data-target="#myMod4">
                    <i class="fa fa-lock" style="font-size:38px;color:White"></i> </button> 

                <%}%>

                <hr>

  

            </div>
            </div>
     
    </div>


          <!-- Modal -->
  <div class="col-md-12 col-md-offset-10">
  <div class="modal fade modal_design" id="myMod4" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content" style = "padding:30px 30px 30px 30px;">
        <div class="modal-header">
          <center> <h3 class="modal-title">Start the Task</h3> </center>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          
        </div>
        <div class="modal-body">
          
          



          <div class="row">
    
      <form action="open_task.jsp" class="form-horizontal" role="form">
        <input type = "hidden" name = "taskid" value = "4">
        <fieldset>

          <!-- Form Name -->
          


          <!-- Text input-->
          <div class="form-group">
            <label class="col-sm-4 control-label" for="textinput"> Start Date </label>
            <div class="col-sm-6">
              <input type="text" name="sd" placeholder="DD-MM-YYYY" class="form-control" required/>
            </div>
          </div>

          <!-- Text input-->
          <div class="form-group">
            <label class="col-sm-4 control-label" for="textinput">End Date</label>
            <div class="col-sm-6">
              <input type="text" name="ed" placeholder="DD-MM-YYYY" class="form-control"required/>
            </div>
          </div>




          
          <div class="form-group">
            <div class="col-sm-6">
            </div>
            <div class="col-sm-6">
              <div float="right">
                
                <button type="submit" class="btn btn-primary">Unlock the task</button>
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





      <!-- Modal -->
  <div class="col-md-12 col-md-offset-10">
  <div class="modal fade modal_design" id="myModaltask4" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content" style = "padding:30px 30px 30px 30px;">
        <div class="modal-header">
          <center> <h3 class="modal-title">Rate the Task</h3> </center>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          
        </div>
        <div class="modal-body">
          
          



          <div class="row">
    
      <form action="allotmarks.jsp" class="form-horizontal" role="form">
        <input type = "hidden" name = "taskid" value = "4">
        <fieldset>

          <!-- Form Name -->
          


          <!-- Text input-->
          <div class="form-group">
            <label class="col-sm-4 control-label" for="textinput">Commercial Impact </label>
            <div class="col-sm-6">
              <input type="text" name="ci" placeholder="Market potential of the innovation" class="form-control" required/>
            </div>
          </div>

          <!-- Text input-->
          <div class="form-group">
            <label class="col-sm-4 control-label" for="textinput">Novelity</label>
            <div class="col-sm-6">
              <input type="text" name="nov" placeholder="How unique is the project?" class="form-control"required/>
            </div>
          </div>

          <!-- Text input-->
          <div class="form-group">
            <label class="col-sm-4 control-label" for="textinput">Application</label>
            <div class="col-sm-6">
              <input type="text" name="app" placeholder="The degree of use of the innovation" class="form-control"required/>
            </div>

          </div>
          <div class="form-group">
            <label class="col-sm-4 control-label" for="textinput">Remark</label>
            <div class="col-sm-6">
              <input type="text" name="remark" placeholder="Remarks" class="form-control"required/>
            </div>
          </div>

          <div class="form-group">
            <label class="col-sm-4 control-label" for="textinput">Status</label>
            <div class="col-sm-3" >
              <input type="radio" name="rad" value="-1"  > Open  </input></div>
              <div class="col-sm-3" >
               <input type="radio" name="rad" value="1"  > Close  </input>
            </div>
          </div>




          
          <div class="form-group">
            <div class="col-sm-6">
            </div>
            <div class="col-sm-6">
              <div float="right">
                
                <button type="submit" class="btn btn-primary">Allot</button>
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







<!-- subtask of task 4 starts -->


    <div id="task4" class="tab-pane fade">


      
      <div class="card-body" >



        <% int count4 = 0;
        int atco4=0;
    
    while(rss4.next()) { 
    count4++;%>
        <div class="row">


              <div class="col-md-10">
              <h4 class="card-title">
        
                <%
        String s_name="";
         s_name= rss4.getString("SUB_NAME");
          %>
        
               <%=rss4.getString("SUB_NAME") %>

              </h4>
            </div>


            <div class="col-md-2">

                
  <form action = "delete_subtask.jsp" onsubmit="return confirm('Do you really want to Delete this Subtask?')" >
                  <input type = "hidden" name = "subname" value = "<%=s_name%>"/> 
                   <input type = "hidden" name = "taskid" value = "4">



<button type="submit" class="fabutton">
                    <i class="fa fa-remove" style="font-size:38px;color:White"></i> </button> </form> 

           </div>






 <div class="row" style="padding-left:30px;">


                <% int j4=400;
                  j4+=count4;
                %>

                    <!-- Trigger the modal with a button -->
                  <button type="button" class="btn btn-info " data-toggle="modal" data-target="#<%=j4%>">View progress</button>


                   </div> 


       <!-- view progress task 4 -->
       
         <!-- Modal -->
  <div class="col-md-12 col-md-offset-10">
  <div class="modal fade modal_design" id="<%=j4%>" role="dialog">
    <div class="modal-dialog" style="width:1250px;">
    
      <!-- Modal content-->
      <div class="modal-content" style = "padding:30px 30px 30px 30px;">
        <div class="modal-header">
          <h4 class="modal-title">Attachments</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          
        </div>
        <div class="modal-body" >
          
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
        
        
        <p class="card-text"><font color="red">Assigned to: </font> <% while(rsn.next()) { %>  <%=rsn.getString("member_name")%> &nbsp <%}%></p> 



          <div class="row">
    
      <form action="sub_approve.jsp" method="post" class="form-horizontal" role="form" style="width:200%">
    
     <input type = "hidden" name = "taskid" value = "4"/>
      <input type = "hidden" name = "sub_name" value = "<%=s_name%>"/>
    
       <fieldset> 

          <!-- Form Name -->
    <% 
        try{
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
    
    

    while(atno.next()){ 
    atco3++; 
   

    %> 
    
    
      <div class="form-group">
            <label class="col-sm-5 control-label" for="textinput">Submitted By:</label>
            <div class="col-sm-7">
             <%=atno.getString("name") %>
            </div>
          </div>

          <div class="form-group">
            <label class="col-sm-5 control-label" for="textinput">File </label>
            <div class="col-sm-7">
              <a href=<%=atno.getString("file_url")%>  target=_blank style="color:blue;">Download </a> 
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
      
    <%} else {%>
    
    

          <!-- Text input-->
          <div class="form-group">
            <label class="col-sm-5 control-label" for="textinput">Comment</label>
            <div class="col-sm-7">
              <input type="text" name="mcom" placeholder="Your comments" class="form-contro"/>
            </div>
          </div>
      
       <div class="form-group">
            <label class="col-sm-5 control-label" for="textinput">Status</label>
           <div class="col-sm-4">
              <input type="radio" name="stat" value="0" > Re-submit </input></div>
        <div class="col-sm-3">
        <input type="radio" name="stat" value="1" >Accept </input>
            </div>
          </div>

      <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
              <div class="pull-right">
               
                <button type="submit" class="btn btn-primary">Submit</button>
              </div>
            </div>
          </div>
    <% } atco4=0;%>

           
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
       
       
       
        </div>
        <br>

              <p class="card-text"><%=rss4.getString("SUB_DESC") %> </p>

              
                   <div class="row">


              <div class="col-md-12">
<p class="card-text" style="color:#de9336; display:inline;"> Relevent Article by Mentor:   <a href=<%=rss4.getString("file_url")%>  target=_blank style="color:blue;">Download </a> </p>
        
        <br>
        <br>
        
                

              
            </div>
          </div>



        
          <%
              try{

                  rsn4=null;
                  call = connection.prepareCall("{call erp.CL_INNOVATION_PKG.GET_SUBTASK_MEMBERS(?,?,?,?)}");
    
                    call.setInt(1,4);
                    call.setInt(2,project_id );
                    call.setString(3,s_name);
                    
                    call.registerOutParameter(4,OracleTypes.CURSOR);
                    call.execute();
                    rsn4 = (ResultSet) call.getObject(4);
  
              }
              catch(Exception exec){
                throw exec;}
        
        %>
        
        
        <p class="card-text" style="color:#de9336; display:inline;"> Assigned to:   </p> <% while(rsn4.next()) {%>  <%=rsn4.getString("member_name")  %> &nbsp <% }%> <br><br>
        
        <% 
        
        
      
         String projectdate = rss4.getString("END_DATE");
        projectdate = projectdate.substring(8,10)+"-"+projectdate.substring(5,8)+projectdate.substring(0,4);
        


        %> 
          <p class="card-text" style="color:#de9336; display:inline;"> Deadline:   </p> <%=projectdate%> </p>
        

               <hr>
         
          <%}%>
        
        <%if(count4==0){ %>
          <br><br><br><br><br>
        <center><p class="card-text"><h1> No Subtask Created. </h1></p> </center> <%}%>

            </div>
           
    </div>
  
    <div id="not4" class="tab-pane fade">
    
     <div class="card-body" >
     <% 
      int review4=0;
     while (n4.next()) { 
     review4++;%>
     
      <div class="row" style="padding-left:15px ">
      
      <div style = "display:inline-block; padding-top:0px">
      <h4 class="card-title"> Review on task 4.</h4>
      <strong>By CL Mentor <%=n4.getString("NAME") %></strong> </div> 
      
    <p style="margin-top:10px">   
      Task have been rated(Out of 10) as following: <br>
      
      1. Commercial Impact : <%=n4.getString("COM_IMPACT") %><br>
      
      2. Novelity: <%=n4.getString("NOVELITY") %> <br>
      
      3. Application: <%=n4.getString("APPLICATION") %> <br>
      
      4. Overall: <%=n4.getString("user_rmks") %> <br>
      
    </p>
      
        <div class="col-md-5">
        </div>
  <div class="col-md-7">
                  <!-- Trigger the modal with a button -->
                  <button type="button" class="btn btn-info " data-toggle="modal" data-target="#Approve4">Approve this Subtask</button>
           </div> 
        
      </div>
      <hr>
     
     <% } %>
    
    <%if(review4==0){ %>
          <br><br><br><br><br>
        <center><p class="card-text"><h1> Yet to be Reviewed. </h1></p> </center> <%}%>
     
     </div>
    
    </div>





  </div>
  




           

            

   
   
    
  </div>


</div>

            
            
<!--
####################################################################################################################################################################################################################################################################################################################################
            




task4 ended



  row 2 task4 ended
 ################################################################################################################################################################################################################################################################################################################################## 
  task 5 starts



       

####################################################################################################################################################################################################################################################################################################################################
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

                            <%   int tus5=-1;
                int tus5r=1;
                    
     while (n55.next() && tus5r==1 ) { 
    tus5r--;
     tus5=n55.getInt("status");
    
   //  out.println(tus5);
  

   if(tus5==1){
  %>
  <p style="color:green" ><i class="fa fa-check-circle-o" aria-hidden="true" style="font-size: 5.73em"></i>
 </p><%} }%>
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
                    rdate55 = (ResultSet) call.getObject(4);
                    rdate5= (ResultSet) call.getObject(5);

  
              }
              catch(Exception exec){
                throw exec;}

                %>

     
             

              <br>
              <br>

              <%

              if(rdate5.next()){ %>

              <div class="row">


                <div class="col-md-8">



        <form action = "cc.jsp">
        <input type = "hidden" name = "taskid" value = "5"/>
               <button type="submit" class="btn btn-info "  float="left">Create New SubTask</button></form>
             </div>
             <div class="col-md-4">

         <%     try{
                  call = connection.prepareCall("{call erp.CL_INNOVATION_PKG.MT_GET_ATTACHMENT_COUNT(?,?,?)}");
    
                    call.setInt(2,5);
                    call.setInt(1,project_id );
                    
                    
                    call.registerOutParameter(3,OracleTypes.CURSOR);
                    call.execute();
                    atcount5 = (ResultSet) call.getObject(3);
  
              }
              catch(Exception exec){
                throw exec;}

    %>
               <form action = "cc.jsp">
        <input type = "hidden" name = "taskid" value = "5"/>

           <% if (atcount5.next()) { %>
               <button type="button" class="btn btn-info " float="right" data-toggle="modal" data-target="#myModaltask5">
                Review</button>
                <%} else { %>
                <button type="button" class="btn btn-info " disabled="" float="right" data-toggle="modal" data-target="#myModaltask5">
                Review</button> <%}%>

              </form> 
             </div> 
             </div>
              
              <%}%>
              
              <br>
             
             

            

               


                <%


                if (rdate55.next()){
        %>

          <hr>
         <div class="row">
              
              <div class="col-md-6">
              <h5>Start Date: <%=rdate55.getString("START_DATE") %></h5>
            </div>
            <div class="col-md-6">
             <h5>End Date: <%=rdate55.getString("END_DATE") %></h5>
            </div>

            <% } else {  %>
              <br>
              <br>
               <hr>
               <div class="row">
              <div class="col-md-6">
              
            </div>
                <button type="submit" class="fabutton" data-toggle="modal" data-target="#myMod5">
                    <i class="fa fa-lock" style="font-size:38px;color:White"></i> </button> 

                <%}%>

                <hr>

  

            </div>
            </div>
     
    </div>


          <!-- Modal -->
  <div class="col-md-12 col-md-offset-10">
  <div class="modal fade modal_design" id="myMod5" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content" style = "padding:30px 30px 30px 30px;">
        <div class="modal-header">
          <center> <h3 class="modal-title">Start the Task</h3> </center>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          
        </div>
        <div class="modal-body">
          
          



          <div class="row">
    
      <form action="open_task.jsp" class="form-horizontal" role="form">
        <input type = "hidden" name = "taskid" value = "5">
        <fieldset>

          <!-- Form Name -->
          


          <!-- Text input-->
          <div class="form-group">
            <label class="col-sm-4 control-label" for="textinput"> Start Date </label>
            <div class="col-sm-6">
              <input type="text" name="sd" placeholder="DD-MM-YYYY" class="form-control" required/>
            </div>
          </div>

          <!-- Text input-->
          <div class="form-group">
            <label class="col-sm-4 control-label" for="textinput">End Date</label>
            <div class="col-sm-6">
              <input type="text" name="ed" placeholder="DD-MM-YYYY" class="form-control"required/>
            </div>
          </div>




          
          <div class="form-group">
            <div class="col-sm-6">
            </div>
            <div class="col-sm-6">
              <div float="right">
                
                <button type="submit" class="btn btn-primary">Unlock the task</button>
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





      <!-- Modal -->
  <div class="col-md-12 col-md-offset-10">
  <div class="modal fade modal_design" id="myModaltask5" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content" style = "padding:30px 30px 30px 30px;">
        <div class="modal-header">
          <center> <h3 class="modal-title">Rate the Task</h3> </center>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          
        </div>
        <div class="modal-body">
          
          



          <div class="row">
    
      <form action="allotmarks.jsp" class="form-horizontal" role="form">
        <input type = "hidden" name = "taskid" value = "5">
        <fieldset>

          <!-- Form Name -->
          


          <!-- Text input-->
          <div class="form-group">
            <label class="col-sm-4 control-label" for="textinput">Commercial Impact </label>
            <div class="col-sm-6">
              <input type="text" name="ci" placeholder="Market potential of the innovation" class="form-control" required/>
            </div>
          </div>

          <!-- Text input-->
          <div class="form-group">
            <label class="col-sm-4 control-label" for="textinput">Novelity</label>
            <div class="col-sm-6">
              <input type="text" name="nov" placeholder="How unique is the project?" class="form-control"required/>
            </div>
          </div>

          <!-- Text input-->
          <div class="form-group">
            <label class="col-sm-4 control-label" for="textinput">Application</label>
            <div class="col-sm-6">
              <input type="text" name="app" placeholder="The degree of use of the innovation" class="form-control"required/>
            </div>

          </div>
          <div class="form-group">
            <label class="col-sm-4 control-label" for="textinput">Remark</label>
            <div class="col-sm-6">
              <input type="text" name="remark" placeholder="Remarks" class="form-control"required/>
            </div>
          </div>

          <div class="form-group">
            <label class="col-sm-4 control-label" for="textinput">Status</label>
            <div class="col-sm-3" >
              <input type="radio" name="rad" value="-1"  > Open  </input></div>
              <div class="col-sm-3" >
               <input type="radio" name="rad" value="1"  > Close  </input>
            </div>
          </div>




          
          <div class="form-group">
            <div class="col-sm-6">
            </div>
            <div class="col-sm-6">
              <div float="right">
                
                <button type="submit" class="btn btn-primary">Allot</button>
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







<!-- subtask of task 5 starts -->


    <div id="task5" class="tab-pane fade">


      
      <div class="card-body" >



        <% int count5 = 0;
        int atco5=0;
    
    while(rss5.next()) { 
    count5++;%>
        <div class="row">


              <div class="col-md-10">
              <h4 class="card-title">
        
                <%
        String s_name="";
         s_name= rss5.getString("SUB_NAME");
          %>
        
               <%=rss5.getString("SUB_NAME") %>

              </h4>
            </div>


            <div class="col-md-2">

                
  <form action = "delete_subtask.jsp" onsubmit="return confirm('Do you really want to Delete this Subtask?')" >
                  <input type = "hidden" name = "subname" value = "<%=s_name%>"/> 
                   <input type = "hidden" name = "taskid" value = "5">



<button type="submit" class="fabutton">
                    <i class="fa fa-remove" style="font-size:38px;color:White"></i> </button> </form> 

           </div>






 <div class="row" style="padding-left:30px;">


                <% int j5=500;
                  j5+=count5;
                %>

                    <!-- Trigger the modal with a button -->
                  <button type="button" class="btn btn-info " data-toggle="modal" data-target="#<%=j5%>">View progress</button>


                   </div> 


       <!-- view progress task 5 -->
       
         <!-- Modal -->
  <div class="col-md-12 col-md-offset-10">
  <div class="modal fade modal_design" id="<%=j5%>" role="dialog">
    <div class="modal-dialog" style="width:1250px;">
    
      <!-- Modal content-->
      <div class="modal-content" style = "padding:30px 30px 30px 30px;">
        <div class="modal-header">
          <h4 class="modal-title">Attachments</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          
        </div>
        <div class="modal-body" >
          
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
        
        
        <p class="card-text"><font color="red">Assigned to: </font> <% while(rsn.next()) { %>  <%=rsn.getString("member_name")%> &nbsp <%}%></p>



          <div class="row">
    
      <form action="sub_approve.jsp" method="post" class="form-horizontal" role="form" style="width:200%">
    
     <input type = "hidden" name = "taskid" value = "5"/>
      <input type = "hidden" name = "sub_name" value = "<%=s_name%>"/>
    
       <fieldset> 

          <!-- Form Name -->
    <% 
        try{
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
    
    

    while(atno.next()){ 
    atco5++; 
   

    %> 
    
    
      <div class="form-group">
            <label class="col-sm-5 control-label" for="textinput">Submitted By:</label>
            <div class="col-sm-7">
             <%=atno.getString("name") %>
            </div>
          </div>

          <div class="form-group">
            <label class="col-sm-5 control-label" for="textinput">File </label>
            <div class="col-sm-7">
              <a href=<%=atno.getString("file_url")%>  target=_blank style="color:blue;">Download </a> 
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
      
    <%} else {%>
    
    

          <!-- Text input-->
          <div class="form-group">
            <label class="col-sm-5 control-label" for="textinput">Comment</label>
            <div class="col-sm-7">
              <input type="text" name="mcom" placeholder="Your comments" class="form-contro"/>
            </div>
          </div>
      
       <div class="form-group">
            <label class="col-sm-5 control-label" for="textinput">Status</label>
           <div class="col-sm-4">
              <input type="radio" name="stat" value="0" > Re-submit </input></div>
        <div class="col-sm-3">
        <input type="radio" name="stat" value="1" >Accept </input>
            </div>
          </div>

      <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
              <div class="pull-right">
               
                <button type="submit" class="btn btn-primary">Submit</button>
              </div>
            </div>
          </div>
    <% } atco5=0;%>

           
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
       
       
       
        </div>
        <br>

              <p class="card-text"><%=rss5.getString("SUB_DESC") %> </p>

              
                   <div class="row">


              <div class="col-md-12">
<p class="card-text" style="color:#de9336; display:inline;"> Relevent Article by Mentor:   <a href=<%=rss5.getString("file_url")%>  target=_blank style="color:blue;">Download </a> </p>
        
        <br>
        <br>
        
                

              
            </div>
          </div>



        
          <%
              try{

                  rsn5=null;
                  call = connection.prepareCall("{call erp.CL_INNOVATION_PKG.GET_SUBTASK_MEMBERS(?,?,?,?)}");
    
                    call.setInt(1,5);
                    call.setInt(2,project_id );
                    call.setString(3,s_name);
                    
                    call.registerOutParameter(4,OracleTypes.CURSOR);
                    call.execute();
                    rsn5 = (ResultSet) call.getObject(4);
  
              }
              catch(Exception exec){
                throw exec;}
        
        %>
        
        
        <p class="card-text" style="color:#de9336; display:inline;"> Assigned to:   </p> <% while(rsn5.next()) {%>  <%=rsn5.getString("member_name")  %> &nbsp <% }%> <br><br>
        
        <% 
        
        
      
         String projectdate = rss5.getString("END_DATE");
        projectdate = projectdate.substring(8,10)+"-"+projectdate.substring(5,8)+projectdate.substring(0,4);
        


        %> 
          <p class="card-text" style="color:#de9336; display:inline;"> Deadline:   </p> <%=projectdate%> </p>
        

               <hr>
         
          <%}%>
        
        <%if(count5==0){ %>
          <br><br><br><br><br>
        <center><p class="card-text"><h1> No Subtask Created. </h1></p> </center> <%}%>

            </div>
           
    </div>
  
    <div id="not5" class="tab-pane fade">
    
     <div class="card-body" >
     <% 
      int review5=0;
     while (n5.next()) { 
     review5++;%>
     
      <div class="row" style="padding-left:15px ">
      
      <div style = "display:inline-block; padding-top:0px">
      <h4 class="card-title"> Review on task 5.</h4>
      <strong>By CL Mentor <%=n5.getString("NAME") %></strong> </div> 
      
    <p style="margin-top:10px">   
      Task have been rated(Out of 10) as following: <br>
      
      1. Commercial Impact : <%=n5.getString("COM_IMPACT") %><br>
      
      2. Novelity: <%=n5.getString("NOVELITY") %> <br>
      
      3. Application: <%=n5.getString("APPLICATION") %> <br>
      
      4. Overall: <%=n5.getString("user_rmks") %> <br>
      
    </p>
      
        <div class="col-md-5">
        </div>
  <div class="col-md-7">
                  <!-- Trigger the modal with a button -->
                  <button type="button" class="btn btn-info " data-toggle="modal" data-target="#Approve5">Approve this Subtask</button>
           </div> 
        
      </div>
      <hr>
     
     <% } %>
    
    <%if(review5==0){ %>
          <br><br><br><br><br>
        <center><p class="card-text"><h1> Yet to be Reviewed. </h1></p> </center> <%}%>
     
     </div>
    
    </div>





  </div>
  




           

            

   
   
    
  </div>


</div>

            
            
<!--
####################################################################################################################################################################################################################################################################################################################################
            




task5 ended




   task6 starts task 5 ended
    ############################################################################################################################################################################################################################################################################################################################
  
 
  task6 starts 
       

####################################################################################################################################################################################################################################################################################################################################
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

                            <%   int tus6=-1;
                int tus6r=1;
                    
     while (n66.next() && tus6r==1 ) { 
    tus6r--;
     tus6=n66.getInt("status");
    
   //  out.println(tus6);
  

   if(tus6==1){
  %>
  <p style="color:green" ><i class="fa fa-check-circle-o" aria-hidden="true" style="font-size: 5.73em"></i>
 </p><%} }%>
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
                    rdate66 = (ResultSet) call.getObject(4);
                    rdate6= (ResultSet) call.getObject(5);

  
              }
              catch(Exception exec){
                throw exec;}

                %>

     
             

              <br>
              <br>

              <%

              if(rdate6.next()){ %>

              <div class="row">


                <div class="col-md-8">



        <form action = "cc.jsp">
        <input type = "hidden" name = "taskid" value = "6"/>
               <button type="submit" class="btn btn-info "  float="left">Create New SubTask</button></form>
             </div>
             <div class="col-md-4">

         <%     try{
                  call = connection.prepareCall("{call erp.CL_INNOVATION_PKG.MT_GET_ATTACHMENT_COUNT(?,?,?)}");
    
                    call.setInt(2,6);
                    call.setInt(1,project_id );
                    
                    
                    call.registerOutParameter(3,OracleTypes.CURSOR);
                    call.execute();
                    atcount6 = (ResultSet) call.getObject(3);
  
              }
              catch(Exception exec){
                throw exec;}

    %>
               <form action = "cc.jsp">
        <input type = "hidden" name = "taskid" value = "6"/>

           <% if (atcount6.next()) { %>
               <button type="button" class="btn btn-info " float="right" data-toggle="modal" data-target="#myModaltask6">
                Review</button>
                <%} else { %>
                <button type="button" class="btn btn-info " disabled="" float="right" data-toggle="modal" data-target="#myModaltask6">
                Review</button> <%}%>

              </form> 
             </div> 
             </div>
              
              <%}%>
              
              <br>
             
             

            

               


                <%


                if (rdate66.next()){
        %>

          <hr>
         <div class="row">
              
              <div class="col-md-6">
              <h5>Start Date: <%=rdate66.getString("START_DATE") %></h5>
            </div>
            <div class="col-md-6">
             <h5>End Date: <%=rdate66.getString("END_DATE") %></h5>
            </div>

            <% } else {  %>
              <br>
              <br>
               <hr>
               <div class="row">
              <div class="col-md-6">
              
            </div>
                <button type="submit" class="fabutton" data-toggle="modal" data-target="#myMod6">
                    <i class="fa fa-lock" style="font-size:38px;color:White"></i> </button> 

                <%}%>

                <hr>

  

            </div>
            </div>
     
    </div>


          <!-- Modal -->
  <div class="col-md-12 col-md-offset-10">
  <div class="modal fade modal_design" id="myMod6" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content" style = "padding:30px 30px 30px 30px;">
        <div class="modal-header">
          <center> <h3 class="modal-title">Start the Task</h3> </center>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          
        </div>
        <div class="modal-body">
          
          



          <div class="row">
    
      <form action="open_task.jsp" class="form-horizontal" role="form">
        <input type = "hidden" name = "taskid" value = "6">
        <fieldset>

          <!-- Form Name -->
          


          <!-- Text input-->
          <div class="form-group">
            <label class="col-sm-4 control-label" for="textinput"> Start Date </label>
            <div class="col-sm-6">
              <input type="text" name="sd" placeholder="DD-MM-YYYY" class="form-control" required/>
            </div>
          </div>

          <!-- Text input-->
          <div class="form-group">
            <label class="col-sm-4 control-label" for="textinput">End Date</label>
            <div class="col-sm-6">
              <input type="text" name="ed" placeholder="DD-MM-YYYY" class="form-control"required/>
            </div>
          </div>




          
          <div class="form-group">
            <div class="col-sm-6">
            </div>
            <div class="col-sm-6">
              <div float="right">
                
                <button type="submit" class="btn btn-primary">Unlock the task</button>
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





      <!-- Modal -->
  <div class="col-md-12 col-md-offset-10">
  <div class="modal fade modal_design" id="myModaltask6" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content" style = "padding:30px 30px 30px 30px;">
        <div class="modal-header">
          <center> <h3 class="modal-title">Rate the Task</h3> </center>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          
        </div>
        <div class="modal-body">
          
          



          <div class="row">
    
      <form action="allotmarks.jsp" class="form-horizontal" role="form">
        <input type = "hidden" name = "taskid" value = "6">
        <fieldset>

          <!-- Form Name -->
          


          <!-- Text input-->
          <div class="form-group">
            <label class="col-sm-4 control-label" for="textinput">Commercial Impact </label>
            <div class="col-sm-6">
              <input type="text" name="ci" placeholder="Market potential of the innovation" class="form-control" required/>
            </div>
          </div>

          <!-- Text input-->
          <div class="form-group">
            <label class="col-sm-4 control-label" for="textinput">Novelity</label>
            <div class="col-sm-6">
              <input type="text" name="nov" placeholder="How unique is the project?" class="form-control"required/>
            </div>
          </div>

          <!-- Text input-->
          <div class="form-group">
            <label class="col-sm-4 control-label" for="textinput">Application</label>
            <div class="col-sm-6">
              <input type="text" name="app" placeholder="The degree of use of the innovation" class="form-control"required/>
            </div>

          </div>
          <div class="form-group">
            <label class="col-sm-4 control-label" for="textinput">Remark</label>
            <div class="col-sm-6">
              <input type="text" name="remark" placeholder="Remarks" class="form-control"required/>
            </div>
          </div>

          <div class="form-group">
            <label class="col-sm-4 control-label" for="textinput">Status</label>
            <div class="col-sm-3" >
              <input type="radio" name="rad" value="-1"  > Open  </input></div>
              <div class="col-sm-3" >
               <input type="radio" name="rad" value="1"  > Close  </input>
            </div>
          </div>




          
          <div class="form-group">
            <div class="col-sm-6">
            </div>
            <div class="col-sm-6">
              <div float="right">
                
                <button type="submit" class="btn btn-primary">Allot</button>
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







<!-- subtask of task 6 starts -->


    <div id="task6" class="tab-pane fade">


      
      <div class="card-body" >



        <% int count6 = 0;
        int atco6=0;
    
    while(rss6.next()) { 
    count6++;%>
        <div class="row">


              <div class="col-md-10">
              <h4 class="card-title">
        
                <%
        String s_name="";
         s_name= rss6.getString("SUB_NAME");
          %>
        
               <%=rss6.getString("SUB_NAME") %>

              </h4>
            </div>


            <div class="col-md-2">

                
  <form action = "delete_subtask.jsp" onsubmit="return confirm('Do you really want to Delete this Subtask?')" >
                  <input type = "hidden" name = "subname" value = "<%=s_name%>"/> 
                   <input type = "hidden" name = "taskid" value = "6">



<button type="submit" class="fabutton">
                    <i class="fa fa-remove" style="font-size:38px;color:White"></i> </button> </form> 

           </div>






 <div class="row" style="padding-left:30px;">


                <% int j6=600;
                  j6+=count6;
                %>

                    <!-- Trigger the modal with a button -->
                  <button type="button" class="btn btn-info " data-toggle="modal" data-target="#<%=j6%>">View progress</button>


                   </div> 


       <!-- view progress task 6 -->
       
         <!-- Modal -->
  <div class="col-md-12 col-md-offset-10">
  <div class="modal fade modal_design" id="<%=j6%>" role="dialog">
    <div class="modal-dialog" style="width:1250px;">
    
      <!-- Modal content-->
      <div class="modal-content" style = "padding:30px 30px 30px 30px;">
        <div class="modal-header">
          <h4 class="modal-title">Attachments</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          
        </div>
        <div class="modal-body" >
          
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
        
        
        <p class="card-text"><font color="red">Assigned to: </font> <% while(rsn.next()) { %>  <%=rsn.getString("member_name")%> &nbsp <%}%></p>



          <div class="row">
    
      <form action="sub_approve.jsp" method="post" class="form-horizontal" role="form" style="width:200%">
    
     <input type = "hidden" name = "taskid" value = "6"/>
      <input type = "hidden" name = "sub_name" value = "<%=s_name%>"/>
    
       <fieldset> 

          <!-- Form Name -->
    <% 
        try{
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
    
    

    while(atno.next()){ 
    atco6++; 
   

    %> 
    
    
      <div class="form-group">
            <label class="col-sm-5 control-label" for="textinput">Submitted By:</label>
            <div class="col-sm-7">
             <%=atno.getString("name") %>
            </div>
          </div>

          <div class="form-group">
            <label class="col-sm-5 control-label" for="textinput">File </label>
            <div class="col-sm-7">
              <a href=<%=atno.getString("file_url")%>  target=_blank style="color:blue;">Download </a> 
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
      
    <%} else {%>
    
    

          <!-- Text input-->
          <div class="form-group">
            <label class="col-sm-5 control-label" for="textinput">Comment</label>
            <div class="col-sm-7">
              <input type="text" name="mcom" placeholder="Your comments" class="form-contro"/>
            </div>
          </div>
      
       <div class="form-group">
            <label class="col-sm-5 control-label" for="textinput">Status</label>
           <div class="col-sm-4">
              <input type="radio" name="stat" value="0" > Re-submit </input></div>
        <div class="col-sm-3">
        <input type="radio" name="stat" value="1" >Accept </input>
            </div>
          </div>

      <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
              <div class="pull-right">
               
                <button type="submit" class="btn btn-primary">Submit</button>
              </div>
            </div>
          </div>
    <% } atco6=0;%>

           
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
       
       
       
        </div>
        <br>

              <p class="card-text"><%=rss6.getString("SUB_DESC") %> </p>

              
                   <div class="row">


              <div class="col-md-12">
<p class="card-text" style="color:#de9336; display:inline;"> Relevent Article by Mentor:   <a href=<%=rss6.getString("file_url")%>  target=_blank style="color:blue;">Download </a> </p>
        
        <br>
        <br>
        
                

              
            </div>
          </div>



        
          <%
              try{

                  rsn6=null;
                  call = connection.prepareCall("{call erp.CL_INNOVATION_PKG.GET_SUBTASK_MEMBERS(?,?,?,?)}");
    
                    call.setInt(1,6);
                    call.setInt(2,project_id );
                    call.setString(3,s_name);
                    
                    call.registerOutParameter(4,OracleTypes.CURSOR);
                    call.execute();
                    rsn6 = (ResultSet) call.getObject(4);
  
              }
              catch(Exception exec){
                throw exec;}
        
        %>
        
        
        <p class="card-text" style="color:#de9336; display:inline;"> Assigned to:   </p> <% while(rsn6.next()) {%>  <%=rsn6.getString("member_name")  %> &nbsp <% }%> <br><br>
        
        <% 
        
        
      
         String projectdate = rss6.getString("END_DATE");
        projectdate = projectdate.substring(8,10)+"-"+projectdate.substring(5,8)+projectdate.substring(0,4);
        


        %> 
          <p class="card-text" style="color:#de9336; display:inline;"> Deadline:   </p> <%=projectdate%> </p>
        

               <hr>
         
          <%}%>
        
        <%if(count6==0){ %>
          <br><br><br><br><br>
        <center><p class="card-text"><h1> No Subtask Created. </h1></p> </center> <%}%>

            </div>
           
    </div>
  
    <div id="not6" class="tab-pane fade">
    
     <div class="card-body" >
     <% 
      int review6=0;
     while (n6.next()) { 
     review6++;%>
     
      <div class="row" style="padding-left:15px ">
      
      <div style = "display:inline-block; padding-top:0px">
      <h4 class="card-title"> Review on task 6.</h4>
      <strong>By CL Mentor <%=n6.getString("NAME") %></strong> </div> 
      
    <p style="margin-top:10px">   
      Task have been rated(Out of 10) as following: <br>
      
      1. Commercial Impact : <%=n6.getString("COM_IMPACT") %><br>
      
      2. Novelity: <%=n6.getString("NOVELITY") %> <br>
      
      3. Application: <%=n6.getString("APPLICATION") %> <br>
      
      4. Overall: <%=n6.getString("user_rmks") %> <br>
      
    </p>
      
        <div class="col-md-5">
        </div>
  <div class="col-md-7">
                  <!-- Trigger the modal with a button -->
                  <button type="button" class="btn btn-info " data-toggle="modal" data-target="#Approve6">Approve this Subtask</button>
           </div> 
        
      </div>
      <hr>
     
     <% } %>
    
    <%if(review6==0){ %>
          <br><br><br><br><br>
        <center><p class="card-text"><h1> Yet to be Reviewed. </h1></p> </center> <%}%>
     
     </div>
    
    </div>





  </div>
  




           

            

   
   
    
  </div>


</div>

            
            
<!--
####################################################################################################################################################################################################################################################################################################################################
            




task6 ended




#####################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################
-->


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
