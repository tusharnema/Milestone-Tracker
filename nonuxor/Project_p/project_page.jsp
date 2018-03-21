<%@ page
  import="java.sql.*,com.cl.sql.PoolManager,oracle.jdbc.driver.OracleTypes,oracle.sql.CLOB,java.io.*,java.text.*, java.net.*,com.cl.auth.EncrDec,com.cl.auth.IlligalAccess,java.util.*,org.apache.log4j.*"
  buffer="none"%>
<%

  int projectId = 0;
  int project_id = Integer.parseInt(request.getParameter("projectId"));
  session.setAttribute("projectSession",project_id);
  
  Integer projectSes = (Integer) session.getAttribute("projectSession");
  String name = (String) session.getAttribute("name");
  
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

  
  

try{
    connection = poolManager.getConnection("erp");
	
	try{
	call = connection.prepareCall("{call erp.CL_INNOVATION_PKG.GET_GROUP(?,?)}");
    
    call.setInt(1,projectSes);	
  	call.registerOutParameter(2,OracleTypes.NUMBER);
	call.execute();
	groupId = call.getInt(2);
	
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
<li><a href="wainconnect.com">Wain</a> <span class="divider">>></span></li>
<li><a href="#">Login</a> <span class="divider">>></span></li>
<li><a href="../mentor.jsp">Home</a><span class="divider">>></span></li>
<li><a href="project_page.jsp">Project</a></li>
</ul>


    <!-- Page Content -->
    <div class="container">

      <!-- Page Heading -->
	  <% while(rs.next()){%>
      <div class="row">
        <div class="col-md-4">
		<% String projectName = rs.getString("PROJECT_NAME");
			projectName = projectName.substring(0,1).toUpperCase() + projectName.substring(1).toLowerCase();%>
      <center><h2 class="my-4"> <%=projectName%>
       
      </h2></center>
    </div>
	 <div class="col-md-4">

       
      
      <center><h2 class="my-4" "> <a href="../projectdet.jsp"> Project Details </a></center>
        
      </h2>
    </div>
    <div class="col-md-4">

       
      
      <center><h2 class="my-4" > <a href="listMem.jsp"> Group Details </a></center>
        
      </h2>
    </div>
    </div>
	  <%}%>
    <br>
    <br>
      <div class="row">


  <!--task1 starts

      -->



        <div class="col-md-4  portfolio-item">
          <div class="card ">





              <ul class="nav nav-tabs">
    <li class="active"><a data-toggle="tab" href="#home">Task1</a></li>
    <li><a data-toggle="tab" href="#menu1">Subtasks</a></li>
    
    
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



<!-- marking modal starts -->

<form action="create_subtask.jsp" class="form-horizontal" style="color:black" role="form">

<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title" id="exampleModalLabel">Create New Subtask</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      
      <div class="modal-body">
        
          <div class="form-group">
            <label for="recipient-name" class="col-form-label">Subtask Name:</label>
            <input  type="text" class="form-control" name="sub_name" id="recipient-name">
          </div>
          <div class="form-group">
            <label for="message-text" class="col-form-label">Subtask Description:</label>
            <textarea name="sub_desc" class="form-control" id="message-text"></textarea>
          </div>
           <div class="form-group">
            <label for="recipient-name" class="col-form-label">Allot to:</label>
            <p>
  <input class="w3-check" type="checkbox" checked="checked">
  <label>Milk</label></p>
  <p>
  <input class="w3-check" type="checkbox">
  <label> Sugar</label></p>
  <p>
  <input class="w3-check" type="checkbox" >
  <label>Lemon </label></p>
              
          </div>
        
      </div>
   
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="Submit" class="btn btn-primary">Create</button>
      </div>
    </div>
  </div>
</div>

</form>
<!--marking modal ends -->

  <!-- Modal -->
  <div class="col-md-12 col-md-offset-10">
  <div class="modal fade modal_design" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content" style = "padding:30px 30px 30px 30px;">
        <div class="modal-header">
          <h4 class="modal-title" style="color:black">Marks Allocation</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          
        </div>
        <div class="modal-body">
          
          



          <div class="row">
    
      <form class="form-horizontal" style="color:black" role="form">
        <fieldset>

          <!-- Form Name -->
          <legend>Marking Fields</legend>

          <!-- Text input-->
          <div class="form-group">
            <label class="col-sm-3 control-label" for="textinput">Field 1</label>
            <div class="col-sm-7">
              <input type="text" placeholder="Marks out of 10" class="form-control">
            </div>
          </div>

          <!-- Text input-->
          <div class="form-group">
            <label class="col-sm-3 control-label" for="textinput">Field 2</label>
            <div class="col-sm-7">
              <input type="text" placeholder="Marks out of 10" class="form-control">
            </div>
          </div>

          <!-- Text input-->
          <div class="form-group">
            <label class="col-sm-3 control-label" for="textinput">Novelity</label>
            <div class="col-sm-7">
              <input type="text" placeholder="What is the Novelity?" class="form-control">
            </div>
          </div>

          <!-- Text input-->
          <div class="form-group">
            <label class="col-sm-3 control-label" for="textinput">Usefulness</label>
            <div class="col-sm-8">
              <input type="text" placeholder="How much Usefull?" class="form-control">
            </div>

            <label class="col-sm-3 control-label" for="textinput">Remark</label>
            <div class="col-sm-4">
              <input type="text" placeholder="Remarks" class="form-control">
            </div>
          </div>



          
          <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
              <div class="pull-right">
                <button type="submit" class="btn btn-default">Cancel</button>
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
  



    <!--model ends  -->



    <div id="menu1" class="tab-pane fade">
 <div class="card-body">
<div class="row">
            <div class="col-md-6">

 <h4 class="card-title">
                <a href="#">Subtask-1</a>
              </h4>

            </div>


<div class="col-md-6">

  
  <!-- Trigger the modal with a button -->
  <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Review</button>


  </div>
 </div>
             
              <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam </p>
            </div>
         

          <div class="card-body">
 <div class="row">
            <div class="col-md-6">

 <h4 class="card-title">
                <a href="#">Subtask-2</a>
              </h4>

            </div>


<div class="col-md-6">

  
  <!-- Trigger the modal with a button -->
  <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Review</button>


  </div>
</div>
             
              <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam </p>
            </div>
            
            <div class="card-body">
 <div class="row">
            <div class="col-md-6">

 <h4 class="card-title">
                <a href="#">Subtask-3</a>
              </h4>

            </div>

            
<div class="col-md-6">

  
  <!-- Trigger the modal with a button -->
  <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Review</button>


  </div>

      </div>       
              <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam </p>
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
               <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#exampleModal" float="right">Create New SubTask</button>
              <br>
              <br>
              
              <hr>
              <div class="row">
                <br>
                <br>
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






    <div id="task2" class="tab-pane fade">



      <div class="card-body">
            <div class="row">


              <div class="col-md-6">
              <h4 class="card-title">
                <a href="#">Subtask-1</a>

              </h4>
            </div>










<div class="col-md-6">






  
  <!-- Trigger the modal with a button -->
  <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModaltask2">Review</button>


  </div>

  <!-- Modal -->
  <div class="col-md-12 col-md-offset-10">
  <div class="modal fade modal_design" id="myModaltask2" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content" style = "padding:30px 30px 30px 30px;">
        <div class="modal-header">
          <h4 class="modal-title">Marks Allocation</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          
        </div>
        <div class="modal-body">
          
          



          <div class="row">
    
      <form class="form-horizontal" role="form">
        <fieldset>

          <!-- Form Name -->
          <legend>Marking Fields</legend>

          <!-- Text input-->
          <div class="form-group">
            <label class="col-sm-3 control-label" for="textinput">Field 1</label>
            <div class="col-sm-7">
              <input type="text" placeholder="Marks out of 10" class="form-control">
            </div>
          </div>

          <!-- Text input-->
          <div class="form-group">
            <label class="col-sm-3 control-label" for="textinput">Field 2</label>
            <div class="col-sm-7">
              <input type="text" placeholder="Marks out of 10" class="form-control">
            </div>
          </div>

          <!-- Text input-->
          <div class="form-group">
            <label class="col-sm-3 control-label" for="textinput">Novelity</label>
            <div class="col-sm-7">
              <input type="text" placeholder="What is the Novelity?" class="form-control">
            </div>
          </div>

          <!-- Text input-->
          <div class="form-group">
            <label class="col-sm-3 control-label" for="textinput">Usefulness</label>
            <div class="col-sm-8">
              <input type="text" placeholder="How much Usefull?" class="form-control">
            </div>

            <label class="col-sm-3 control-label" for="textinput">Remark</label>
            <div class="col-sm-4">
              <input type="text" placeholder="Remarks" class="form-control">
            </div>
          </div>



          
          <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
              <div class="pull-right">
                <button type="submit" class="btn btn-default">Cancel</button>
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
  

 


            </div>
              <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam </p>
            </div>


          <div class="card-body">
<div class="row">
            <div class="col-md-6">

 <h4 class="card-title">
                <a href="#">Subtask-2</a>
              </h4>

            </div>


<div class="col-md-6">

  
  <!-- Trigger the modal with a button -->
  <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModaltask2">Review</button>


  </div>
</div>
             
              <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam </p>
            </div>
            
            <div class="card-body">
<div class="row">
            <div class="col-md-6">

 <h4 class="card-title">
                <a href="#">Subtask-3</a>
              </h4>

            </div>

            
<div class="col-md-6">

  
  <!-- Trigger the modal with a button -->
  <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModaltask2">Review</button>


  </div>
</div>
             
              <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam </p>
            </div>
    </div>
   
    
  </div>


</div>

            
            
          </div>



<!--task2 ended

  task 3 starts of row 1 -->



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
               <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#exampleModal" float="right">Create New SubTask</button>
              <br>
              <br>
              
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
    <div id="task3" class="tab-pane fade">
      <div class="card-body">
            <div class="row">
              <div class="col-md-6">
              <h4 class="card-title">
                <a href="#">Subtask-1</a>

              </h4>
            </div>
<div class="col-md-6">






  
  <!-- Trigger the modal with a button -->
  <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModaltask3">Review</button>


  </div>

  <!-- Modal -->
  <div class="col-md-12 col-md-offset-10">
  <div class="modal fade modal_design" id="myModaltask3" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content" style = "padding:30px 30px 30px 30px;">
        <div class="modal-header">
          <h4 class="modal-title">Marks Allocation</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          
        </div>
        <div class="modal-body">
          
          



          <div class="row">
    
      <form class="form-horizontal" role="form">
        <fieldset>

          <!-- Form Name -->
          <legend>Marking Fields</legend>

          <!-- Text input-->
          <div class="form-group">
            <label class="col-sm-3 control-label" for="textinput">Field 1</label>
            <div class="col-sm-7">
              <input type="text" placeholder="Marks out of 10" class="form-control">
            </div>
          </div>

          <!-- Text input-->
          <div class="form-group">
            <label class="col-sm-3 control-label" for="textinput">Field 2</label>
            <div class="col-sm-7">
              <input type="text" placeholder="Marks out of 10" class="form-control">
            </div>
          </div>

          <!-- Text input-->
          <div class="form-group">
            <label class="col-sm-3 control-label" for="textinput">Novelity</label>
            <div class="col-sm-7">
              <input type="text" placeholder="What is the Novelity?" class="form-control">
            </div>
          </div>

          <!-- Text input-->
          <div class="form-group">
            <label class="col-sm-3 control-label" for="textinput">Usefulness</label>
            <div class="col-sm-8">
              <input type="text" placeholder="How much Usefull?" class="form-control">
            </div>

            <label class="col-sm-3 control-label" for="textinput">Remark</label>
            <div class="col-sm-4">
              <input type="text" placeholder="Remarks" class="form-control">
            </div>
          </div>



          
          <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
              <div class="pull-right">
                <button type="submit" class="btn btn-default">Cancel</button>
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
  

 


            </div>
              <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam </p>
            </div>
    <div class="card-body">
<div class="row">
            <div class="col-md-6">

 <h4 class="card-title">
                <a href="#">Subtask-2</a>
              </h4>

            </div>


<div class="col-md-6">

  
  <!-- Trigger the modal with a button -->
  <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModaltask2">Review</button>


  </div>
</div>
             
              <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam </p>
            </div>
            
            <div class="card-body">
<div class="row">
            <div class="col-md-6">

 <h4 class="card-title">
                <a href="#">Subtask-3</a>
              </h4>

            </div>

            
<div class="col-md-6">

  
  <!-- Trigger the modal with a button -->
  <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModaltask2">Review</button>


  </div>
</div>
             
              <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam </p>
            </div>
    </div>
   
    
  </div>


</div>

            
            
          </div>







 <!--task row 1 ended

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
                <a href="#">Preparation of First Draft</a>
              </h4>
              <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam aspernatur eum quasi sapiente nesciunt? Voluptatibus sit, repellat sequi itaque deserunt, dolores in, nesciunt, illum tempora ex quae? Nihil, dolorem!</p>
              <br>
              <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#exampleModal" float="right">Create New SubTask</button>
              <br>

              <br>
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
    <div id="task4" class="tab-pane fade">
      <div class="card-body">
            <div class="row">
              <div class="col-md-6">
              <h4 class="card-title">
                <a href="#">Subtask-1</a>

              </h4>
            </div>
<div class="col-md-6">






  
  <!-- Trigger the modal with a button -->
  <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModaltask4">Review</button>


  </div>

  <!-- Modal -->
  <div class="col-md-12 col-md-offset-10">
  <div class="modal fade modal_design" id="myModaltask4" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content" style = "padding:30px 30px 30px 30px;">
        <div class="modal-header">
          <h4 class="modal-title">Marks Allocation</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          
        </div>
        <div class="modal-body">
          
          



          <div class="row">
    
      <form class="form-horizontal" role="form">
        <fieldset>

          <!-- Form Name -->
          <legend>Marking Fields</legend>

          <!-- Text input-->
          <div class="form-group">
            <label class="col-sm-3 control-label" for="textinput">Field 1</label>
            <div class="col-sm-7">
              <input type="text" placeholder="Marks out of 10" class="form-control">
            </div>
          </div>

          <!-- Text input-->
          <div class="form-group">
            <label class="col-sm-3 control-label" for="textinput">Field 2</label>
            <div class="col-sm-7">
              <input type="text" placeholder="Marks out of 10" class="form-control">
            </div>
          </div>

          <!-- Text input-->
          <div class="form-group">
            <label class="col-sm-3 control-label" for="textinput">Novelity</label>
            <div class="col-sm-7">
              <input type="text" placeholder="What is the Novelity?" class="form-control">
            </div>
          </div>

          <!-- Text input-->
          <div class="form-group">
            <label class="col-sm-3 control-label" for="textinput">Usefulness</label>
            <div class="col-sm-8">
              <input type="text" placeholder="How much Usefull?" class="form-control">
            </div>

            <label class="col-sm-3 control-label" for="textinput">Remark</label>
            <div class="col-sm-4">
              <input type="text" placeholder="Remarks" class="form-control">
            </div>
          </div>



          
          <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
              <div class="pull-right">
                <button type="submit" class="btn btn-default">Cancel</button>
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
  

 


            </div>
              <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam </p>
            </div>
          <div class="card-body">
<div class="row">
            <div class="col-md-6">

 <h4 class="card-title">
                <a href="#">Subtask-2</a>
              </h4>

            </div>


<div class="col-md-6">

  
  <!-- Trigger the modal with a button -->
  <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModaltask2">Review</button>


  </div>
</div>

             
              <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam </p>
            </div>
            
            <div class="card-body">
<div class="row">
            <div class="col-md-6">

 <h4 class="card-title">
                <a href="#">Subtask-3</a>
              </h4>

            </div>

            
<div class="col-md-6">

  
  <!-- Trigger the modal with a button -->
  <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModaltask2">Review</button>


  </div>
</div>
             
              <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam </p>
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
                <a href="#">Identification and Registration of Conference/Journal</a>
              </h4>
              <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam aspernatur eum quasi sapiente nesciunt? Voluptatibus sit, repellat sequi itaque deserunt, dolores in, nesciunt, illum tempora ex quae? Nihil, dolorem!</p>
              <br>
              <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#exampleModal" float="right">Create New SubTask</button>
              <br>

              <br>
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
    <div id="task5" class="tab-pane fade">
      <div class="card-body">
            <div class="row">
              <div class="col-md-6">
              <h4 class="card-title">
                <a href="#">Subtask-1</a>

              </h4>
            </div>
<div class="col-md-6">






  
  <!-- Trigger the modal with a button -->
  <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModaltask5">Review</button>


  </div>

  <!-- Modal -->
  <div class="col-md-12 col-md-offset-10">
  <div class="modal fade modal_design" id="myModaltask5" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content" style = "padding:30px 30px 30px 30px;">
        <div class="modal-header">
          <h4 class="modal-title">Marks Allocation</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          
        </div>
        <div class="modal-body">
          
          



          <div class="row">
    
      <form class="form-horizontal" role="form">
        <fieldset>

          <!-- Form Name -->
          <legend>Marking Fields</legend>

          <!-- Text input-->
          <div class="form-group">
            <label class="col-sm-3 control-label" for="textinput">Field 1</label>
            <div class="col-sm-7">
              <input type="text" placeholder="Marks out of 10" class="form-control">
            </div>
          </div>

          <!-- Text input-->
          <div class="form-group">
            <label class="col-sm-3 control-label" for="textinput">Field 2</label>
            <div class="col-sm-7">
              <input type="text" placeholder="Marks out of 10" class="form-control">
            </div>
          </div>

          <!-- Text input-->
          <div class="form-group">
            <label class="col-sm-3 control-label" for="textinput">Novelity</label>
            <div class="col-sm-7">
              <input type="text" placeholder="What is the Novelity?" class="form-control">
            </div>
          </div>

          <!-- Text input-->
          <div class="form-group">
            <label class="col-sm-3 control-label" for="textinput">Usefulness</label>
            <div class="col-sm-8">
              <input type="text" placeholder="How much Usefull?" class="form-control">
            </div>

            <label class="col-sm-3 control-label" for="textinput">Remark</label>
            <div class="col-sm-4">
              <input type="text" placeholder="Remarks" class="form-control">
            </div>
          </div>



          
          <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
              <div class="pull-right">
                <button type="submit" class="btn btn-default">Cancel</button>
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
  

 


            </div>
              <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam </p>
            </div>
         <div class="card-body">
<div class="row">
            <div class="col-md-6">

 <h4 class="card-title">
                <a href="#">Subtask-2</a>
              </h4>

            </div>


<div class="col-md-6">

  
  <!-- Trigger the modal with a button -->
  <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModaltask2">Review</button>


  </div>
</div>
             
              <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam </p>
            </div>
            
            <div class="card-body">
<div class="row">
            <div class="col-md-6">

 <h4 class="card-title">
                <a href="#">Subtask-3</a>
              </h4>

            </div>

            
<div class="col-md-6">

  
  <!-- Trigger the modal with a button -->
  <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModaltask2">Review</button>


  </div>
</div>
             
              <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam </p>
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
                <a href="#">Preparation of Script and PPT</a>
              </h4>
              <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam aspernatur eum quasi sapiente nesciunt? Voluptatibus sit, repellat sequi itaque deserunt, dolores in, nesciunt, illum tempora ex quae? Nihil, dolorem!</p>
              <br>
              <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#exampleModal" float="right">Create New SubTask</button>
              <br>

              <br>
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
    <div id="task6" class="tab-pane fade">
      <div class="card-body">
            <div class="row">
              <div class="col-md-6">
              <h4 class="card-title">
                <a href="#">Subtask-1</a>

              </h4>
            </div>
<div class="col-md-6">






  
  <!-- Trigger the modal with a button -->
  <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModaltask6">Review</button>


  </div>

  <!-- Modal -->
  <div class="col-md-12 col-md-offset-10">
  <div class="modal fade modal_design" id="myModaltask6" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content" style = "padding:30px 30px 30px 30px;">
        <div class="modal-header">
          <h4 class="modal-title">Marks Allocation</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          
        </div>
        <div class="modal-body">
          
          



          <div class="row">
    
      <form class="form-horizontal" role="form">
        <fieldset>

          <!-- Form Name -->
          <legend>Marking Fields</legend>

          <!-- Text input-->
          <div class="form-group">
            <label class="col-sm-3 control-label" for="textinput">Field 1</label>
            <div class="col-sm-7">
              <input type="text" placeholder="Marks out of 10" class="form-control">
            </div>
          </div>

          <!-- Text input-->
          <div class="form-group">
            <label class="col-sm-3 control-label" for="textinput">Field 2</label>
            <div class="col-sm-7">
              <input type="text" placeholder="Marks out of 10" class="form-control">
            </div>
          </div>

          <!-- Text input-->
          <div class="form-group">
            <label class="col-sm-3 control-label" for="textinput">Novelity</label>
            <div class="col-sm-7">
              <input type="text" placeholder="What is the Novelity?" class="form-control">
            </div>
          </div>

          <!-- Text input-->
          <div class="form-group">
            <label class="col-sm-3 control-label" for="textinput">Usefulness</label>
            <div class="col-sm-8">
              <input type="text" placeholder="How much Usefull?" class="form-control">
            </div>

            <label class="col-sm-3 control-label" for="textinput">Remark</label>
            <div class="col-sm-4">
              <input type="text" placeholder="Remarks" class="form-control">
            </div>
          </div>



          
          <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
              <div class="pull-right">
                <button type="submit" class="btn btn-default">Cancel</button>
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
  

 


            </div>
              <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam </p>
            </div>
        <div class="card-body">
<div class="row">
            <div class="col-md-6">

 <h4 class="card-title">
                <a href="#">Subtask-2</a>
              </h4>

            </div>


<div class="col-md-6">

  
  <!-- Trigger the modal with a button -->
  <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModaltask2">Review</button>


  </div>
</div>
             
              <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam </p>
            </div>
            
            <div class="card-body">
<div class="row">
            <div class="col-md-6">

 <h4 class="card-title">
                <a href="#">Subtask-3</a>
              </h4>

            </div>

            
<div class="col-md-6">

  
  <!-- Trigger the modal with a button -->
  <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModaltask2">Review</button>


  </div>
</div>
             
              <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam </p>
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
