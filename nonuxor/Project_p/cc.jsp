<%@ page
  import="java.sql.*,com.cl.sql.PoolManager,oracle.jdbc.driver.OracleTypes,oracle.sql.CLOB,java.io.*,java.text.*, java.net.*,com.cl.auth.EncrDec,com.cl.auth.IlligalAccess,java.util.*,org.apache.log4j.*"
  buffer="none"%>
<%
 
  int taskId=0;
  int project_id=0;
  try {
taskId=Integer.parseInt(request.getParameter("taskid"));} catch(Exception exec ){taskId=100;}
  session.setAttribute("taskId",taskId);
  
   
  Integer group_id = (Integer) session.getAttribute("group_Id");
  project_id = (Integer) session.getAttribute("projectSession");
   session.setAttribute("projectSession",project_id);
 //  out.println(project_id);
   //out.println(group_id);

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
   ResultSet rs2 = null;
  

    connection = poolManager.getConnection("erp");



    
    
  
  try{
  call = connection.prepareCall("{call erp.CL_INNOVATION_PKG.GET_LIST_MEMBERS(?,?)}");
    
    call.setInt(1,group_id);  
    call.registerOutParameter(2,OracleTypes.CURSOR);
  call.execute();
  rs2 = (ResultSet) call.getObject(2);
  
  }
  catch(Exception exec){
  throw exec;}
  
 

    
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
    /* Set black background color, white text and some padding */
    footer1 {
      background-color: #555;
      color: white;
      padding: 15px;
    }


   .blacky {
    color: white;
    min-height: 20px;
    padding: 19px;
    margin-bottom: 20px;
    background-color: #1d535f;;
    border: 1px solid #e3e3e3;
    border-radius: 4px;
    -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.05);
    box-shadow: inset 0 1px 1px rgba(0,0,0,.05);
    font-size: large;
}
.well {
    min-height: 20px;
    padding: 19px;
    margin-bottom: 20px;
    background-color: #f5f5f5;
    border: 1px solid #e3e3e3;
    border-radius: 4px;
    -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.05);
    box-shadow: inset 0 1px 1px rgba(0,0,0,.05);
    font-size: medium;
    color: black;
}
.nav-pills>li.active>a, .nav-pills>li.active>a:focus, .nav-pills>li.active>a:hover {
    color: #fff;
    background-color: #101010;
}
.panel-body {
    padding: 25px;
}
.abc{
  display:none;
}
.container {
    padding: 40px 0;
        padding-right: 0px;
        padding-left: 0px;
}
.nav > li > a {
    position: relative;
    display: block;
    padding: 15px 219px;
}
  </style>

  
</head>



<body>


  <!-- Top Background Image Wrapper -->
<div class="bgded overlay" style="background-image:url('images/02.jpg') "> 
  <!-- ################################################################################################ -->
  <div class="wrapper row1">
    <header id="header" class="hoc clear"> 
      <!-- ################################################################################################ -->
      <div id="logo" class="fl_left">
        <h1><a href="index.html">Milestone Tracker</a></h1>
      </div>
      <nav id="mainav" class="fl_right">
        <ul class="clear">
          <li class="active"><a href="index.html">Home</a></li>
          <li><a class="active" href="#">FAQ</a>
            
          </li>
          <li><a class="drop" href="#">Mentor</a>
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
  <div id="pageintro" class="hoc clear"> 
    <!-- ################################################################################################ -->
    
    <!-- ################################################################################################ -->
    <div class="clear"></div>
  </div>
  <!-- ################################################################################################ -->
</div>
<!-- End Top Background Image Wrapper -->
    <ul class="breadcrumb">
<li><a href="../mentor.jsp">Home</a> <span class="divider">>></span></li>

<li><a href="project_page_new.jsp">Project Progress</a> <span class="divider">>></span></li>
<li><a href="#">Create New Subtask</a></li>
</ul>



  <div class="container">
  <form action="create_subtask.jsp" method="post" onsubmit="check" enctype="multipart/form-data" >
    <center> <h2>Create New Subtask for Task:<%=taskId %> </h2> </center>
    <hr>

    <br>
    <div class="row">
      <div class="col-md-6">
        <div class="form-group">
          <label for="first">Subtask Name:</label>
          <input type="text" name="sub_name" class="form-control" placeholder="" >
        </div>
      </div>
      <!--  col-md-6   -->

      <div class="col-md-6">
        <div class="form-group">
          <label for="last">Subtask Description:</label>
          <textarea class="form-control" name="sub_desc" placeholder="" id="last"> </textarea>
        </div>
      </div>
      <!--  col-md-6   -->
    </div>


    <div class="row">
      <div class="col-md-6">
        <div class="form-group">
          <label for="company">Start Date:</label>
          <input type="text" name="sd" class="form-control" placeholder="DD-MM-YYYY" id="company">
        </div>


      </div>
      <!--  col-md-6   -->


      <div class="col-md-6">

        <div class="form-group">
          <label for="phone">Expected End Date:</label>
          <input type="text" name="ed" class="form-control" id="phone" placeholder="DD-MM-YYYY">
        </div>
      </div>
      <!--  col-md-6   -->
    </div>
    <!--  row   -->

<div class="form-group">
          <label for="phone">Attach Relevent Article:</label>
          <input type="file" name="fileUpload" required/>
        </div>
      

    <!--  row   -->


   

    <label >Select Members for the required Subtask</label>
    <div class="checkbox">

      <% while(rs2.next()){ %>

      <label>
        <input type="checkbox" value="<%=rs2.getString("MEMBER_NAME")%>" name="mem" > <%=rs2.getString("MEMBER_NAME")%>
      </label><br/><%}%>
    </div>

<br>
<center>    <button type="submit" class="btn btn-primary">Create</button> </center>
  </form>
</div>
 
<script src='http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js'></script>

    <!-- Footer -->
  

    <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>


<!--   ################################## -->

<footer class="footer">
    
    <!-- Parallax -->
    <div id="parallax-one" class="parallax" style="background-image: url(images/02.jpg); background-position: 44% -172px;">
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
