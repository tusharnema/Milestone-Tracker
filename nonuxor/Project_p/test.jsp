<%@ page
  import="java.sql.*,com.cl.sql.PoolManager,oracle.jdbc.driver.OracleTypes,oracle.sql.CLOB,java.io.*,java.text.*, java.net.*,com.cl.auth.EncrDec,com.cl.auth.IlligalAccess,java.util.*,org.apache.log4j.*"
  buffer="none"%>
<%

  int project_id = 0;
  try{
	  
   project_id = Integer.parseInt(request.getParameter("projectId")); } catch (Exception e){project_id=0;}
   
   
 if(project_id==0){
  
 project_id = (Integer) session.getAttribute("project_idsion"); }
  
   session.setAttribute("projectSession",project_id);
  String name = (String) session.getAttribute("name");
  
 
  
  out.println(project_id);
  
  
  
  int userId = 0;
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
    background-color: #fff;
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
    height:400px;
    overflow:scroll;
}
.card a{
  color: #fff;
}
.nav-tabs a{
  color:#01010c;
}
.card p{
  font-size: medium;
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



  .nav-pills > li.active > a, .nav-pills > li.active > a:focus, .nav-pills > li.active > a:hover {
    color: #fff;
    background-color: #252729;
}

.nav > li > a {
    position: relative;
    display: block;
    padding: 10px 44px;
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

  <body>

   



    <div class="bgded overlay" style="background-image:url('images/02.jpg');"> 
  <!-- ################################################################################################ -->
 <div class="wrapper row1">
  
    <header id="header" class="hoc clear"> 
  <div id="logo" class="fl_left" style="float:left;">
         <div class="logo">
                                    <a href="../index.jsp">
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
              <li><a href="#">Account Settings</a></li>
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
<li><a href="pp.jsp">Project Progress</a></li>
</ul>


    <!-- Page Content -->
    <div class="container">

      <!-- Page Heading -->
    <% while(rs.next()){%>
      <div class="row">

        <div class="col-md-6">
    <% String projectName = rs.getString("PROJECT_NAME");
      projectName = projectName.substring(0,1).toUpperCase() + projectName.substring(1).toLowerCase();%>
      <center><h2 class="my-4"> <%=projectName%>
       
      </h2></center>
    </div>

    <div class="col-md-6">
      <center><h2 class="my-4" > <a href="../pd.jsp"> Project Details </a>  </h2></center>     
     

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

              <h4 class="card-title">
                <a href="#">Attend Explanatory Lectures</a>
              </h4>
              <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam aspernatur eum quasi sapiente nesciunt? Voluptatibus sit, repellat sequi itaque deserunt, dolores in, nesciunt, illum tempora ex quae? Nihil, dolorem!</p>
              <br>
              
              <!-- <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#exampleModal" float="right">Create New SubTask</button>-->
                <br>
               <br>
              <div class="row">
               
              <hr>
             
            <div class="col-md-12">
              <h5>Expected End Date: 21/10/18 </h5>
            </div>
              <hr>
            </div>
            </div>
     
    </div>







    
  </div>


</div>

            
            
          </div>


  <!--- task1 ended


  task2 starts -->
       
        <div class="col-md-4  portfolio-item">
          <div class="card ">





              <ul class="nav nav-tabs">
    <li class="active"><a data-toggle="tab" href="#home2">Task2</a></li>
    <li><a data-toggle="tab" href="#task2">Subtasks</a></li>

    
    
  </ul>

  <div class="tab-content">
    <div id="home2" class="tab-pane fade in active">
     
      <div class="card-body">

              <h4 class="card-title">
                <a href="#">Topic Identification</a>
              </h4>
              <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam aspernatur eum quasi sapiente nesciunt? Voluptatibus sit, repellat sequi itaque deserunt, dolores in, nesciunt, illum tempora ex quae? Nihil, dolorem!</p>
              <br>
              <div class="row">
                <div class="col-md-8">

        <form action = "cc.jsp">
        <input type = "hidden" name = "taskid" value = "2">
               <button type="submit" class="btn btn-info "  float="left">Create New SubTask</button></form>
             </div>
             <div class="col-md-4">
               <form action = "cc.jsp">
        <input type = "hidden" name = "taskid" value = "2">
               <button type="button" class="btn btn-info " float="right" data-toggle="modal" data-target="#myModaltask2">
                Review</button></form>
             </div> 
             </div>
              
              
              <hr>
              <div class="row">
              
              <div class="col-md-6">
              <h5>Start Date: 21/08/18 </h5>
            </div>
            <div class="col-md-6">
              <h5>End Date: 21/10/18 </h5>
            </div>
              <hr>
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
              <input type="text" name="ci" placeholder="Market potential of the innovation" class="form-control">
            </div>
          </div>

          <!-- Text input-->
          <div class="form-group">
            <label class="col-sm-4 control-label" for="textinput">Novelity</label>
            <div class="col-sm-6">
              <input type="text" name="nov" placeholder="How unique is the project?" class="form-control">
            </div>
          </div>

          <!-- Text input-->
          <div class="form-group">
            <label class="col-sm-4 control-label" for="textinput">Application</label>
            <div class="col-sm-6">
              <input type="text" name="app" placeholder="The degree of use of the innovation" class="form-control">
            </div>

          </div>
          <div class="form-group">
            <label class="col-sm-4 control-label" for="textinput">Remark</label>
            <div class="col-sm-6">
              <input type="text" name="remark" placeholder="Remarks" class="form-control">
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


      
      <div class="card-body">



        <% int count2 = 0;
    while(rss2.next()) { 
    count2++;%>
        <div class="row">


              <div class="col-md-7">
              <h4 class="card-title">
                <a href="#"><%=rss2.getString("SUB_NAME") %></a>

              </h4>
            </div>

            <div class="col-md-5">

                  <!-- Trigger the modal with a button -->
                  <button type="button" class="btn btn-info " data-toggle="modal" data-target="#myModaltask2view">View progress</button>
           </div>
        </div>
        <br>

              <p class="card-text"><%=rss2.getString("SUB_DESC") %> </p>

               <hr>
			   
			    <%}%>

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
 
  task3 starts -->
       
        <div class="col-md-4  portfolio-item">
          <div class="card ">





              <ul class="nav nav-tabs">
    <li class="active"><a data-toggle="tab" href="#home3">Task3</a></li>
    <li><a data-toggle="tab" href="#task3">Subtasks</a></li>

    
    
  </ul>

  <div class="tab-content">
    <div id="home3" class="tab-pane fade in active">
     
      <div class="card-body">

              <h4 class="card-title">
                <a href="#">Literature Survey</a>
              </h4>
              <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam aspernatur eum quasi sapiente nesciunt? Voluptatibus sit, repellat sequi itaque deserunt, dolores in, nesciunt, illum tempora ex quae? Nihil, dolorem!</p>
              <br>
			  
              <div class="row">
                <div class="col-md-8">

        <%if(count2==0){%>
               <form action = "cc.jsp">
        <input type = "hidden" name = "taskid" value = "3">
			  <button type="submit" class="btn btn-info " disabled = "" float="right">Create New SubTask</button></form><%}
			  else{%>
               <form action = "cc.jsp">
        <input type = "hidden" name = "taskid" value = "3">
			  <button type="submit" class="btn btn-info "  float="right">Create New SubTask</button></form><%}%>
             </div>
             <div class="col-md-4">
               <form action = "cc.jsp">
        <input type = "hidden" name = "taskid" value = "3">
               <button type="button" class="btn btn-info " float="right" data-toggle="modal" data-target="#myModaltask3">
                Review</button></form>
             </div> 
             </div>
              
              
              <hr>
              <div class="row">
              
              <div class="col-md-6">
              <h5>Start Date: 21/08/18 </h5>
            </div>
            <div class="col-md-6">
              <h5>End Date: 21/10/18 </h5>
            </div>
              <hr>
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
              <input type="text" name="ci" placeholder="Market potential of the innovation" class="form-control">
            </div>
          </div>

          <!-- Text input-->
          <div class="form-group">
            <label class="col-sm-4 control-label" for="textinput">Novelity</label>
            <div class="col-sm-6">
              <input type="text" name="nov" placeholder="How unique is the project?" class="form-control">
            </div>
          </div>

          <!-- Text input-->
          <div class="form-group">
            <label class="col-sm-4 control-label" for="textinput">Application</label>
            <div class="col-sm-6">
              <input type="text" name="app" placeholder="The degree of use of the innovation" class="form-control">
            </div>

          </div>
          <div class="form-group">
            <label class="col-sm-4 control-label" for="textinput">Remark</label>
            <div class="col-sm-6">
              <input type="text" name="remark" placeholder="Remarks" class="form-control">
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


    <div id="task3" class="tab-pane fade">


      
      <div class="card-body">



        <% int count3 = 0;
    while(rss3.next()) { 
    count3++;%>
        <div class="row">


              <div class="col-md-7">
              <h4 class="card-title">
                <a href="#"><%=rss3.getString("SUB_NAME") %></a>

              </h4>
            </div>

            <div class="col-md-5">

                  <!-- Trigger the modal with a button -->
                  <button type="button" class="btn btn-info " data-toggle="modal" data-target="#myModaltask3view">View progress</button>
           </div>
        </div>
        <br>

              <p class="card-text"><%=rss3.getString("SUB_DESC") %> </p>

               <hr>
			   
			    <%}%>

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

       task row 2 starts


       row 2 task 4 starts
        -->
       <div class="col-md-4  portfolio-item">
          <div class="card ">





              <ul class="nav nav-tabs">
    <li class="active"><a data-toggle="tab" href="#home4">Task4</a></li>
    <li><a data-toggle="tab" href="#task4">Subtasks</a></li>

    
    
  </ul>

  <div class="tab-content">
    <div id="home4" class="tab-pane fade in active">
     
      <div class="card-body">

              <h4 class="card-title">
                <a href="#">Literature Survey</a>
              </h4>
              <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam aspernatur eum quasi sapiente nesciunt? Voluptatibus sit, repellat sequi itaque deserunt, dolores in, nesciunt, illum tempora ex quae? Nihil, dolorem!</p>
              <br>
			  
              <div class="row">
                <div class="col-md-8">

        <%if(count3==0){%>
               <form action = "cc.jsp">
        <input type = "hidden" name = "taskid" value = "4">
			  <button type="submit" class="btn btn-info " disabled = "" float="right">Create New SubTask</button></form><%}
			  else{%>
               <form action = "cc.jsp">
        <input type = "hidden" name = "taskid" value = "4">
			  <button type="submit" class="btn btn-info "  float="right">Create New SubTask</button></form><%}%>
             </div>
             <div class="col-md-4">
               <form action = "cc.jsp">
        <input type = "hidden" name = "taskid" value = "4">
               <button type="button" class="btn btn-info " float="right" data-toggle="modal" data-target="#myModaltask4">
                Review</button></form>
             </div> 
             </div>
              
              
              <hr>
              <div class="row">
              
              <div class="col-md-6">
              <h5>Start Date: 21/08/18 </h5>
            </div>
            <div class="col-md-6">
              <h5>End Date: 21/10/18 </h5>
            </div>
              <hr>
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
              <input type="text" name="ci" placeholder="Market potential of the innovation" class="form-control">
            </div>
          </div>

          <!-- Text input-->
          <div class="form-group">
            <label class="col-sm-4 control-label" for="textinput">Novelity</label>
            <div class="col-sm-6">
              <input type="text" name="nov" placeholder="How unique is the project?" class="form-control">
            </div>
          </div>

          <!-- Text input-->
          <div class="form-group">
            <label class="col-sm-4 control-label" for="textinput">Application</label>
            <div class="col-sm-6">
              <input type="text" name="app" placeholder="The degree of use of the innovation" class="form-control">
            </div>

          </div>
          <div class="form-group">
            <label class="col-sm-4 control-label" for="textinput">Remark</label>
            <div class="col-sm-6">
              <input type="text" name="remark" placeholder="Remarks" class="form-control">
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


      
      <div class="card-body">



        <% int count4 = 0;
    while(rss4.next()) { 
    count4++;%>
        <div class="row">


              <div class="col-md-7">
              <h4 class="card-title">
                <a href="#"><%=rss4.getString("SUB_NAME") %></a>

              </h4>
            </div>

            <div class="col-md-5">

                  <!-- Trigger the modal with a button -->
                  <button type="button" class="btn btn-info " data-toggle="modal" data-target="#myModaltask4view">View progress</button>
           </div>
        </div>
        <br>

              <p class="card-text"><%=rss4.getString("SUB_DESC") %> </p>

               <hr>
			   
			    <%}%>

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
  
  task 5 starts
-->

        <div class="col-md-4  portfolio-item">
          <div class="card ">





              <ul class="nav nav-tabs">
    <li class="active"><a data-toggle="tab" href="#home5">Task5</a></li>
    <li><a data-toggle="tab" href="#task5">Subtasks</a></li>

    
    
  </ul>

  <div class="tab-content">
    <div id="home5" class="tab-pane fade in active">
     
      <div class="card-body">

              <h4 class="card-title">
                <a href="#">Literature Survey</a>
              </h4>
              <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam aspernatur eum quasi sapiente nesciunt? Voluptatibus sit, repellat sequi itaque deserunt, dolores in, nesciunt, illum tempora ex quae? Nihil, dolorem!</p>
              <br>
			  
              <div class="row">
                <div class="col-md-8">

        <%if(count4==0){%>
               <form action = "cc.jsp">
        <input type = "hidden" name = "taskid" value = "5">
			  <button type="submit" class="btn btn-info " disabled = "" float="right">Create New SubTask</button></form><%}
			  else{%>
               <form action = "cc.jsp">
        <input type = "hidden" name = "taskid" value = "5">
			  <button type="submit" class="btn btn-info "  float="right">Create New SubTask</button></form><%}%>
             </div>
             <div class="col-md-4">
               <form action = "cc.jsp">
        <input type = "hidden" name = "taskid" value = "5">
               <button type="button" class="btn btn-info " float="right" data-toggle="modal" data-target="#myModaltask5">
                Review</button></form>
             </div> 
             </div>
              
              
              <hr>
              <div class="row">
              
              <div class="col-md-6">
              <h5>Start Date: 21/08/18 </h5>
            </div>
            <div class="col-md-6">
              <h5>End Date: 21/10/18 </h5>
            </div>
              <hr>
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
              <input type="text" name="ci" placeholder="Market potential of the innovation" class="form-control">
            </div>
          </div>

          <!-- Text input-->
          <div class="form-group">
            <label class="col-sm-4 control-label" for="textinput">Novelity</label>
            <div class="col-sm-6">
              <input type="text" name="nov" placeholder="How unique is the project?" class="form-control">
            </div>
          </div>

          <!-- Text input-->
          <div class="form-group">
            <label class="col-sm-4 control-label" for="textinput">Application</label>
            <div class="col-sm-6">
              <input type="text" name="app" placeholder="The degree of use of the innovation" class="form-control">
            </div>

          </div>
          <div class="form-group">
            <label class="col-sm-4 control-label" for="textinput">Remark</label>
            <div class="col-sm-6">
              <input type="text" name="remark" placeholder="Remarks" class="form-control">
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


      
      <div class="card-body">



        <% int count5 = 0;
    while(rss5.next()) { 
    count5++;%>
        <div class="row">


              <div class="col-md-7">
              <h4 class="card-title">
                <a href="#"><%=rss5.getString("SUB_NAME") %></a>

              </h4>
            </div>

            <div class="col-md-5">

                  <!-- Trigger the modal with a button -->
                  <button type="button" class="btn btn-info " data-toggle="modal" data-target="#myModaltask5view">View progress</button>
           </div>
        </div>
        <br>

              <p class="card-text"><%=rss5.getString("SUB_DESC") %> </p>

               <hr>
			   
			    <%}%>

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
  -->
       <div class="col-md-4  portfolio-item">
          <div class="card ">





              <ul class="nav nav-tabs">
    <li class="active"><a data-toggle="tab" href="#home6">Task6</a></li>
    <li><a data-toggle="tab" href="#task6">Subtasks</a></li>

    
    
  </ul>

  <div class="tab-content">
    <div id="home6" class="tab-pane fade in active">
     
      <div class="card-body">

              <h4 class="card-title">
                <a href="#">Literature Survey</a>
              </h4>
              <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam aspernatur eum quasi sapiente nesciunt? Voluptatibus sit, repellat sequi itaque deserunt, dolores in, nesciunt, illum tempora ex quae? Nihil, dolorem!</p>
              <br>
			  
              <div class="row">
                <div class="col-md-8">

        <%if(count5==0){%>
               <form action = "cc.jsp">
        <input type = "hidden" name = "taskid" value = "6">
			  <button type="submit" class="btn btn-info " disabled = "" float="right">Create New SubTask</button></form><%}
			  else{%>
               <form action = "cc.jsp">
        <input type = "hidden" name = "taskid" value = "6">
			  <button type="submit" class="btn btn-info "  float="right">Create New SubTask</button></form><%}%>
             </div>
             <div class="col-md-4">
               <form action = "cc.jsp">
        <input type = "hidden" name = "taskid" value = "6">
               <button type="button" class="btn btn-info " float="right" data-toggle="modal" data-target="#myModaltask6">
                Review</button></form>
             </div> 
             </div>
              
              
              <hr>
              <div class="row">
              
              <div class="col-md-6">
              <h5>Start Date: 21/08/18 </h5>
            </div>
            <div class="col-md-6">
              <h5>End Date: 21/10/18 </h5>
            </div>
              <hr>
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
              <input type="text" name="ci" placeholder="Market potential of the innovation" class="form-control">
            </div>
          </div>

          <!-- Text input-->
          <div class="form-group">
            <label class="col-sm-4 control-label" for="textinput">Novelity</label>
            <div class="col-sm-6">
              <input type="text" name="nov" placeholder="How unique is the project?" class="form-control">
            </div>
          </div>

          <!-- Text input-->
          <div class="form-group">
            <label class="col-sm-4 control-label" for="textinput">Application</label>
            <div class="col-sm-6">
              <input type="text" name="app" placeholder="The degree of use of the innovation" class="form-control">
            </div>

          </div>
          <div class="form-group">
            <label class="col-sm-4 control-label" for="textinput">Remark</label>
            <div class="col-sm-6">
              <input type="text" name="remark" placeholder="Remarks" class="form-control">
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


      
      <div class="card-body">



        <% int count6 = 0;
    while(rss6.next()) { 
    count6++;%>
        <div class="row">


              <div class="col-md-7">
              <h4 class="card-title">
                <a href="#"><%=rss6.getString("SUB_NAME") %></a>

              </h4>
            </div>

            <div class="col-md-5">

                  <!-- Trigger the modal with a button -->
                  <button type="button" class="btn btn-info " data-toggle="modal" data-target="#myModaltask4view">View progress</button>
           </div>
        </div>
        <br>

              <p class="card-text"><%=rss6.getString("SUB_DESC") %> </p>

               <hr>
			   
			    <%}%>

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



      
      <!-- /.row -->

      <!-- Pagination -->
 

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
