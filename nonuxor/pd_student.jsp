<%@ page
  import="java.sql.*,com.cl.sql.PoolManager,oracle.jdbc.driver.OracleTypes,oracle.sql.CLOB,java.io.*,java.text.*, java.net.*,com.cl.auth.EncrDec,com.cl.auth.IlligalAccess,java.util.*,org.apache.log4j.*"
  buffer="none"%>

  <%

  int projectId = 0;
	int groupId;
  
int projectSes = 0;

  
 
 try{
 projectSes = Integer.parseInt( request.getParameter("projectId"));}catch(Exception exec){projectSes=0;}
 

  
  if (projectSes==0){
  projectSes = (Integer) session.getAttribute("projectSes");}
 
   session.setAttribute("projectSes",projectSes);
  
 // out.println(projectSes);
  
  int userId = 0;
  String status = "";
  

    try{ userId = Integer.parseInt((String)session.getAttribute("userId"));}catch(Exception e){userId=0;}
  if(userId<=0)
  {
    response.sendRedirect("login.jsp");
    return;
  }


 

  Connection connection = null;
  PoolManager poolManager = PoolManager.getInstance();
  Category logCategory = Category.getInstance("clsite.mywain.project_list.jsp");
  connection = poolManager.getConnection("erp");
  CallableStatement call = null;
  ResultSet rs = null;
  ResultSet rs1 = null;

  try{
    

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
  
  
  try{
	call = connection.prepareCall("{call erp.CL_INNOVATION_PKG.GET_GROUP(?,?)}");
    
    call.setInt(1,projectSes);	
  	call.registerOutParameter(2,OracleTypes.NUMBER);
	call.execute();
	groupId = call.getInt(2);
	
	}
	catch(Exception exec){
	throw exec;}

session.setAttribute("group_Id",groupId);

try{


 
    


    call = connection.prepareCall("{call erp.CL_INNOVATION_PKG.GET_LIST_MEMBERS(?,?)}");
    
    call.setInt(1,groupId);
    call.registerOutParameter(2, OracleTypes.CURSOR);
    call.execute();
    

    
    rs1 = (ResultSet) call.getObject(2);

    

    
    
    
    
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
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script type="text/javascript">
  function deleteProject(id) 
  {
    var txt;
    var r = confirm("Are you sure ?");
    if (r == true) {
       document.location="pd.jsp?rm="+id;
    } else {
      return false;
    }
    return true;
    }
</script>

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
<div class="bgded overlay" style="background-image:url('images/02.jpg');"> 
  <!-- ################################################################################################ -->
  <div class="wrapper row1">
    <header id="header" class="hoc clear"> 
      <!-- ################################################################################################ -->
      <div id="logo" class="fl_left">
        <h1><a href="#">Milestone Tracker</a></h1>
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
    <ul class="breadcrumb">
<li><a href="student.jsp">Home</a> <span class="divider">>></span></li>

<li><a href="pd_student.jsp">Project Details</a> <span class="divider">>></span></li>

</ul>

  
    
  <div class="row">
    
    <div class="col-md-12">
    
      <div class="row">

        <div class="col-sm-12">

          <div class="panel panel-default text-center">
           <div class="container">

               <ul class="nav nav-pills">
    <li class="active"><a data-toggle="pill" href="#home">Project Details</a></li>
    <li><a data-toggle="pill" href="#menu1">View Members


    </a></li>
    
  </ul> </div>
<div class="tab-content">
    <div id="home" class="tab-pane fade in active">
      
      
<% while(rs.next()){ %>
  
<div class="container ">    
  <div class="row">
    
    <div class="col-md-12">
    
      <div class="row">
        <div class="col-sm-12">
          <div class="panel panel-default text-center">
           
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
            <%=rs.getString("PROJECT_NAME")%> 
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

        <%    
    String spl_name="";
    

         int spl_id=rs.getInt("SPECIALITY");

         try{
    

    call = connection.prepareCall("{call erp.CL_INNOVATION_PKG.MT_SPL_NAME(?,?)}");
    
    call.setInt(1,spl_id);
    call.registerOutParameter(2, OracleTypes.VARCHAR);
    call.execute();
  
    spl_name =  call.getString(2);

      
    
    
    //out.println("userId "+userId );
    
    
} catch (Exception exec) {
    //logCategory.error(exec);
    throw exec;
  } 

       %>

      <div class="row">
        <div class="col-sm-3">
          <div class="blacky">
           <p>Speciality</p>
          
          </div>
        </div>
        <div class="col-sm-9">
          <div class="well">
            <p><%=spl_name%></p>
          </div>
        </div>
      </div>


      <%    
    String area_name="";
    

         int area_id=rs.getInt("AREA");

         try{
    

    call = connection.prepareCall("{call erp.CL_INNOVATION_PKG.MT_AREA_NAME(?,?)}");
    
    call.setInt(1,area_id);
    call.registerOutParameter(2, OracleTypes.VARCHAR);
    call.execute();
  
    area_name =  call.getString(2);

      
    
    
    //out.println("userId "+userId );
    
    
} catch (Exception exec) {
    //logCategory.error(exec);
    throw exec;
  } 

       %>
      <div class="row">
        <div class="col-sm-3">
          <div class="blacky">
           <p>Area</p>
           
          </div>
        </div>
        <div class="col-sm-9">
          <div class="well">
            <p> <%=area_name%> </p>
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


      
    </div>
    <div id="menu1" class="tab-pane fade">   <!-- menu 1 starts -->
      






<!-- view members start -->


<!-- ROW STARTS-->
<div class="row">



  <div class="col-md-6">


<div class="form-group">
  <div class="blacky">

  <p  >NAME</p>  
  </div>

</div>

<!-- Text input-->
</div>

<!-- Text input-->

<div class="col-md-6">
<!-- Select Basic -->
<div class="form-group">
  <div class="blacky">
    <p>MEMBER TYPE</p>
  </div>
</div>


</div>




</div>

<!-- ROW ENDS-->

<!-- ROW STARTS-->
<% int mem=0; 
while(rs1.next()){ mem++;%>
<div class="row" >

  <div class="col-md-6">

<center>
<div class="form-group">

  <label class=" control-label" for="product_id" padding-left="21px"><%=rs1.getString("member_name")%></label>  
  

</div>
</center>

<!-- Text input-->
</div>

<!-- Text input-->

<div class="col-md-6">
  <center>
<!-- Select Basic -->
<div class="form-group">
  <center><label class=" control-label" for="product_categorie"><%=rs1.getString("user_type")%></label></center>
  
</div>

</center>
</div>



</div>
<%} %>

<!-- ROW ENDS-->


    </div>  <!-- menu 1 ends  -->

  </div>







</div>
</div>





    </body>



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
                        <p style="color:white">A Never-Before Dialogue Between Corporates And Institutions</p>
                        <h4 style="color:white">Come, be a part of it</h4>
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


</html>
