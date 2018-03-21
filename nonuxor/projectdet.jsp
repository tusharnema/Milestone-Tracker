<%@ page
  import="java.sql.*,com.cl.sql.PoolManager,oracle.jdbc.driver.OracleTypes,oracle.sql.CLOB,java.io.*,java.text.*, java.net.*,com.cl.auth.EncrDec,com.cl.auth.IlligalAccess,java.util.*,org.apache.log4j.*"
  buffer="none"%>
<%
  int projectId = 0;
  int groupId= 0;
    int projectSes = Integer.parseInt(request.getParameter("projectId"));

  String projectName = ""; //get data from form and store it in respective variables
  String orgName = "";
  String groupName = "";


 String desc= "";
  


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


try{
    connection = poolManager.getConnection("erp");

    call = connection.prepareCall("{call erp.CL_INNOVATION_PKG.MT_PROJECT_SEARCH_ALL(?,?)}");
    
    call.setInt(1,projectSes);
    call.registerOutParameter(2, OracleTypes.CURSOR);
    call.execute();
    

    
    rs = (ResultSet) call.getObject(2);

      
    
    
    //out.println("userId "+userId );
    
    
} catch (Exception exec) {
    //logCategory.error(exec);
    throw exec;
  } 
    
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>Project Details</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
    font-size: large;
    color: black;
}
.panel-body {
    padding: 25px;
}
  </style>
</head>
<body>


  <!-- Top Background Image Wrapper -->
<div class="bgded overlay" style="background-image:url('images/02.jpg');"> 
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
  <div id="pageintro" class="hoc clear"> 
    <!-- ################################################################################################ -->
    
    <!-- ################################################################################################ -->
    <div class="clear"></div>
  </div>
  <!-- ################################################################################################ -->
</div>
<!-- End Top Background Image Wrapper -->

<% while(rs.next()){ %>
  
<div class="container ">    
  <div class="row">
    
    <div class="col-md-12">
    
      <div class="row">
        <div class="col-sm-12">
          <div class="panel panel-default text-center">
            <div class="panel-body">
              <p contenteditable="true"><h2>Project Details </h2></p>

              
                   
            </div>
          </div>
        </div>
      </div>

      
      
      <div class="row">
        
        <div class="col-sm-3">


          <div class="blacky">


           <p>Name of the Project</p>
           
          </div>
       
      </div>
        <div class="col-sm-9">
          <div class="well">
            <p><%=rs.getString("PROJECT_NAME")%> </p>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-sm-3">
          <div class="blacky">
           <p>Project Description</p>
           
          </div>
        </div>
        <div class="col-sm-9">
          <div class="well">
            <p><%=rs.getString("DESCRIPTION")%></p>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-sm-3">
          <div class="blacky">
           <p>Topic Name</p>
          
          </div>
        </div>
        <div class="col-sm-9">
          <div class="well">
            <p><%=rs.getString("TOPIC_NAME")%></p>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-sm-3">
          <div class="blacky">
           <p>Area</p>
           
          </div>
        </div>
        <div class="col-sm-9">
          <div class="well">
            <p><%=rs.getString("AREA")%> </p>
          </div>
        </div>
      </div>   

       <div class="row">
        <div class="col-sm-3">
          <div class="blacky">
           <p>Novelity</p>
           
          </div>
        </div>
        <div class="col-sm-9">
          <div class="well">
            <p><%=rs.getString("NOVELITY")%></p>
          </div>
        </div>
      </div> 

       <div class="row">
        <div class="col-sm-3">
          <div class="blacky">
           <p>Application</p>
           
          </div>
        </div>
        <div class="col-sm-9">
          <div class="well">
            <p><%=rs.getString("APPLICATION")%></p>
          </div>
        </div>
      </div>

       <div class="row">
        <div class="col-sm-3">
          <div class="blacky">
           <p>Start Date</p>
           
          </div>
        </div>
        <div class="col-sm-3">
          <div class="well">
            <p><%=rs.getString("START_DATE")%></p>
          </div>
        </div>
        <div class="col-sm-3">
          <div class="blacky">
           <p>End Date</p>
           
          </div>
        </div>
        <div class="col-sm-3">
          <div class="well">
            <p><%=rs.getString("END_DATE")%></p>
          </div>
        </div>
      </div>


    </div>
    
  </div>
</div>

<%}%>

<!-- ################################################################################################ -->

<footer class="footer1">
    
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
    </body>


    
    
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


</html>
