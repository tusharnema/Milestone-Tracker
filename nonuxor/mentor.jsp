<%@ page
  import="java.sql.*,com.cl.sql.PoolManager,oracle.jdbc.driver.OracleTypes,oracle.sql.CLOB,java.io.*,java.text.*, java.net.*,com.cl.auth.EncrDec,com.cl.auth.IlligalAccess,java.util.*,org.apache.log4j.*"
  buffer="none"%>
<%
  int projectId = 0;
  int groupId= 0;

  String projectName = ""; //get data from form and store it in respective variables
  String orgName = "";
  String groupName = "";

 String desc= "";
  

String name = (String) session.getAttribute("name");
  int userId = 0;
    try{ userId = Integer.parseInt((String)session.getAttribute("userId"));}catch(Exception e){userId=0;}  //getting userid of person who is logged in i.e the user on which the session is named.
  if(userId<=0)
  {
    response.sendRedirect("login.jsp"); //if no user is logged in, first redirect to the login page
    return;
  }
  
  
 String username = (String) session.getAttribute("username");
  Connection connection = null;
  PoolManager poolManager = PoolManager.getInstance();
  Category logCategory = Category.getInstance("clsite.mywain.project_list.jsp");
  
  CallableStatement call = null;
  ResultSet rs = null;


try{
    connection = poolManager.getConnection("erp");

    call = connection.prepareCall("{call erp.CL_INNOVATION_PKG.LIST_PROJECT(?,?)}");
    
    call.setInt(1,userId);
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
<!--
Template Name: Tushar Nema

Author: Tushar Nema

-->
<html>
<head>
<title>Mentor</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link href="layout/styles/layout.css" rel="stylesheet" type="text/css" media="all">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<body id="top">



  <style>


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

.more-services-container a{
color: white;
}
#pageintro {
    padding: 81px 0 0px;
}
.white{
color: white;
}	
.fabutton {
  background: none;
  padding: 0px;
  border: none;
}

  </style>
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- Top Background Image Wrapper -->
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
          <li class="active"><a href="#">Home</a></li>
          <li><a class="active" href="#">FAQ</a>
            
          </li>
          <li><a class="drop" href="#">Welcome, <%=name%></a>
            <ul>
              <li><a href="#">Profile</a></li>
              
                
              </li>
             <li><a href="../lgt.jsp">Logout</a></li>
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
<li><a href="mentor.jsp">Home</a> <span class="divider">>></span></li>
<!--
<li><a href="#">Login</a> <span class="divider">>></span></li>
<li><a href="#">Home</a></li>-->
</ul>


<!-- ################################################################################################ -->


<div class="wrapper row3">
  <main class="hoc container clear"> 
    <!-- main body -->
    <!-- ################################################################################################ -->
    <div class="group center">
      
      
      <ul class="nav nav-pills ">

  
    <li class = "active"><i  class="icon fa fa-archive "></i> <a data-toggle="pill" href="#Pro"><h4> Projects </h4></a></li> 


     <li class = "disabled"><i class="icon fa fa-fire disabled"></i><a data-toggle="pill" href="#"><h4>Research Index </h4></a></li>

    <li class = "disabled"><i class="icon fa fa-recycle"></i><a data-toggle="pill" href="#"><h4>Journal Finder</h4></a></li>

    <li class = "disabled"><i class="icon fa fa-bookmark" aria-hidden="true"></i><a data-toggle="pill" href="#"><h4>Saved Drafts</h4></a></li>

    <li class = "disabled"><i class="icon fa fa-inbox" aria-hidden="true"></i><a data-toggle="pill" href="#"><h4>Message</h4></a></li>

  </div>
    
    
     
    
    
  </ul>


 
  </div>
</div>


<!-- dashboard tab content -->





<div class="tab-content">


    <div id="Pro" class="tab-pane fade in active">
      


      <!-- project tab content -->


<!-- projects -->





  <div class="row">
<div class="col-md-8">
  <ul class="nav nav-tabs">

    

    
    <li class="active"><a data-toggle="tab" href="#Act">Active Projects</a></li>
    <li><a data-toggle="tab" href="#Fin">Marked projects</a></li>
  </ul>
</div>
<div class="col-md-4">
  
   <form action="sign-up-form/create_project.jsp" method="get">
  <button type="submit" class="btn btn-primary btn-block">Create New Project</button>
  
  
</form> 
  

  </div>

</div>
  <div class="tab-content">
    

  <!-- All projects -->



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
                     <center><h2 style="padding">View <br> <br></h2></center> 
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
						
                         <h4> <%=rs.getString("PROJECT_NAME").toUpperCase()%> </h4> 
                          <p>
                           <%=rs.getString("DESCRIPTION")%>

                          </p>
                          <br>
                         

                      </div>
                    </div>
                  </div>
				  
				  
				<div class="col-sm-6 more-services-box wow fadeInLeft">

                    <div class="row">
                      <div class="col-sm-3">
                        
                      </div>
			
                      <div class="col-sm-9">
						
 <div class="white">
  <div class="col-sm-4">
  <a href = "pd.jsp?projectId=<%=rs.getInt("PROJECT_ID")%>"><h4> Project details</h4></a></div> </div>
   <div class="white">
    <div class="col-sm-4">
 <a href = "project_p/project_page_new.jsp?projectId=<%=rs.getInt("PROJECT_ID")%>"><h4> Project progress</h4></a></br> </div> </div>
  
 <div class="col-md-4">
<form action = "delete_project.jsp" onsubmit="return confirm('Do you really want to Delete this Project?')" >
<input type = "hidden" name = "proname" value = "<%=rs.getString("PROJECT_NAME")%>"/> 

<button type="submit" class="fabutton">
                    <i class="fa fa-remove" style="font-size:38px;color:White"></i> </button>  </form>
</div>

 
                          
                         

                      </div>
                    </div>
                  </div>
				  
				  </div>
  
			  </br>
			  </br>
              <%}%>
              



             </div> 

       </div>
     </div>



    </div>





    <!-- Finished projects -->



    <div id="Fin" class="tab-pane fade ">
      

    

      <div id="Fin" class="tabcontent " >
        <div class="more-services-container section-container" background-color="#ccffcc" >
          <div class="container">
        <center> <h1>   No projects Marked yet  <h1> </center>
         <!--    <div class="row">
                  <div class="col-sm-6 more-services section-description wow fadeIn">
                     <center> <h2 style="padding">Marked Projects</h2></center>
                      <div class="divider-1 wow fadeInUp"><span></span></div>
                  </div>
                  <div class="col-sm-6 more-services section-description wow fadeIn">
                     <center><h2 style="padding">Rating <br> <br></h2></center> 
                      <div class="divider-1 wow fadeInUp"><span></span></div>
                  </div>
              </div>
              
              <div class="row">
                  <div class="col-sm-6 more-services-box wow fadeInLeft">

                    <div class="row">
                      <div class="col-sm-3">
                        <div class="more-services-box-icon">
                          <i class="fa fa-paperclip"></i>
                        </div>
                      </div>
                      <div class="col-sm-9">
                        <h3>Thermal Imaging </h3>
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

                      </div>
                    </div>
                  </div>
              </div>
              
              


    <div class="row">
                  <div class="col-sm-6 more-services-box wow fadeInLeft">
                    <div class="row">
                      <div class="col-sm-3">
                        <div class="more-services-box-icon">
                          <i class="fa fa-paperclip"></i>
                        </div>
                      </div>
                      <div class="col-sm-9">
                        <h3>Spirutuality</h3>
                          <p>
                            Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et.
                            Ut wisi enim ad minim veniam, quis nostrud.
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
    <div class="progress-bar" role="progressbar" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100" style="width:80%">
      <span class="sr-only">70% Complete</span>
    </div>
  </div>

                      </div>
                    </div>
                  </div>
              </div>



    <div class="row">
                  <div class="col-sm-6 more-services-box wow fadeInLeft">
                    <div class="row">
                      <div class="col-sm-3">
                        <div class="more-services-box-icon">
                          <i class="fa fa-paperclip"></i>
                        </div>
                      </div>
                      <div class="col-sm-9">
                        <h3>Wain</h3>
                          <p>
                            Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et.
                            Ut wisi enim ad minim veniam, quis nostrud.
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
    <div class="progress-bar" role="progressbar" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100" style="width:50%">
      <span class="sr-only">70% Complete</span>
    </div>
  </div>

                      </div>
                    </div>
                  </div>
              </div> -->
             </div> 

       </div>
     </div>



    

    </div>

    
    


    
  </div>

    <!-- ################################################################################################ -->


 



   

<!-- ################################################################################################ -->



<!-- ################################################################################################ -->
  
  

  






      
    </div>

    <div id="RI" class="tab-pane fade">
      <h3>Menu 1</h3>
      <p>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
    </div>
    <div id="JF" class="tab-pane fade">
      <h3>Menu 2</h3>
      <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam.</p>
    </div>
    <div id="SD" class="tab-pane fade">
      <h3>Menu 3</h3>
      <p>Eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.</p>
    </div>

    <div id="Messages" class="tab-pane fade">
      

   


    <style type="text/css">
        
.mail_list .nav-tabs .glyphicon:not(.no-margin) { margin-right:10px; }
.mail_list .tab-pane .list-group-item:first-child {border-top-right-radius: 0px;border-top-left-radius: 0px;}
.mail_list .tab-pane .list-group-item:last-child {border-bottom-right-radius: 0px;border-bottom-left-radius: 0px;}
.mail_list .tab-pane .list-group .checkbox { margin: 0px; }
.mail_list .tab-pane .list-group input[type="checkbox"]{ position: inherit; }
.mail_list .tab-pane .list-group .glyphicon { margin-right:5px; }
.mail_list .tab-pane .list-group .glyphicon:hover { color:#FFBC00; }
.mail_list a.list-group-item.read { color: #222;background-color: #F3F3F3; }
.mail_list input[type="checkbox"]{ margin-top: 2px; position: inherit;}
.mail_list hr { margin-top: 5px;margin-bottom: 10px; }
.mail_list .nav-pills>li>a {padding: 5px 10px;}
.mail_list .message { display: block; }
.mail_list .text { font-size: 11px; }
    </style>
    <script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
</head>

<div class="container mail_list">
    <div class="row">

        <div class="col-sm-3 col-md-2">
            <a href="#" class="btn btn-danger btn-sm btn-block" role="button"><i class="glyphicon glyphicon-pencil"></i> COMPOSE</a>
        </div>

        <div class="col-sm-9 col-md-10">

            <div class="btn-group hidden-xs hidden-sm visible-md-inline-block visible-lg-inline-block">
                <button type="button" class="btn btn-default">
                    <div class="checkbox" style="margin: 0;">
                        <label>
                            <input type="checkbox">
                        </label>
                    </div>
                </button>

                <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                    <span class="caret"></span><span class="sr-only">Toggle Dropdown</span>
                </button>

                <ul class="dropdown-menu" role="menu">
                    <li><a href="#">Read</a></li>
                    <li><a href="#">Unread</a></li>
                    <li><a href="#">Trash</a></li>
                </ul>
            </div>
            <button type="button" class="btn btn-default" data-toggle="tooltip" title="Refresh">
                <span class="glyphicon glyphicon-refresh"></span>   </button>

            <div class="btn-group">
                <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                    More <span class="caret"></span>
                </button>
                <ul class="dropdown-menu" role="menu">
                    <li><a href="#">Mark all as read</a></li>
                </ul>
            </div>
            <div class="pull-right">
                <span class="text-muted"><b>1</b>–<b>50</b> of <b>277</b></span>
                <div class="btn-group btn-group-sm">
                    <button type="button" class="btn btn-default">
                        <span class="glyphicon glyphicon-chevron-left"></span>
                    </button>
                    <button type="button" class="btn btn-default">
                        <span class="glyphicon glyphicon-chevron-right"></span>
                    </button>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-sm-3 col-md-2">
            <ul id="mailboxes-desktop" class="hidden-xs hidden-sm nav nav-pills nav-stacked">
                <li class="active"><a href="#"><span class="badge pull-right">42</span> Inbox </a>
                </li>
                <li><a href="#">Starred</a></li>
                <li><a href="#">Important</a></li>
                <li><a href="#">Sent Mail</a></li>
                <li><a href="#"><span class="badge pull-right">3</span>Drafts</a></li>
            </ul>
            <div id="mailboxes-mobile" class="hidden-md hidden-lg">
                <button type="button" class="btn btn-block btn-default dropdown-toggle" data-toggle="dropdown">
                    Mail boxes <span class="caret"></span><span class="sr-only">Toggle Dropdown</span>
                </button>
                <ul class="dropdown-menu btn-block" role="menu">
                    <li class="active"><a href="#"><span class="badge pull-right">42</span> Inbox </a>
                    </li>
                    <li><a href="#">Starred</a></li>
                    <li><a href="#">Important</a></li>
                    <li><a href="#">Sent Mail</a></li>
                    <li><a href="#"><span class="badge pull-right">3</span>Drafts</a></li>
                </ul>
            </div>
        </div>

        <div class="col-sm-9 col-md-10">
            <div id="home">
                <div class="list-group">

                    <div class="message">
                        <a href="#" class="list-group-item">
                            <div class="checkbox hidden-xs hidden-sm visible-md-inline-block visible-lg-inline-block">
                                <label>
                                    <input type="checkbox">
                                </label>
                            </div>
                            <span class="name">George Harisson <small class="hidden-xs hidden-sm">&lt;devbizznex@zoho.com&gt;</small></span> <span class="title">This is big title</span> <span class="text-muted text">- Hi hello how r u ?</span> <span class="badge">12:10 AM</span> <span class="pull-right"><span class="glyphicon glyphicon-lock hidden-xs hidden-sm"> </span><span class="glyphicon glyphicon-paperclip hidden-xs hidden-sm"></span>
                            </span>
                        </a>
                    </div>

                    <div class="message">
                        <a href="#" class="list-group-item">
                            <div class="checkbox hidden-xs hidden-sm visible-md-inline-block visible-lg-inline-block">
                                <label>
                                    <input type="checkbox">
                                </label>
                            </div>
                            <span class="name">George Harisson <small class="hidden-xs hidden-sm">&lt;devbizznex@zoho.com&gt;</small></span> <span class="title">This is big title</span> <span class="text-muted text">- Hi hello how r u ?</span> <span class="badge">12:10 AM</span> <span class="pull-right"><span class="glyphicon glyphicon-lock hidden-xs hidden-sm"> </span><span class="glyphicon glyphicon-paperclip hidden-xs hidden-sm"></span></span>
                        </a>
                    </div>

                    <div class="message">
                        <a href="#" class="list-group-item">
                            <div class="checkbox hidden-xs hidden-sm visible-md-inline-block visible-lg-inline-block">
                                <label>
                                    <input type="checkbox">
                                </label>
                            </div>
                            <span class="name">George Harisson <small class="hidden-xs hidden-sm">&lt;devbizznex@zoho.com&gt;</small></span> <span class="title">This is big title</span> <span class="text-muted text">- Hi hello how r u ?</span> <span class="badge">12:10 AM</span> <span class="pull-right"><span class="glyphicon glyphicon-lock hidden-xs hidden-sm"> </span><span class="glyphicon glyphicon-paperclip hidden-xs hidden-sm"></span></span>
                        </a>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">

</script>






    </div>


</div>




<!-- ################################################################################################ -->




     


<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->





<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->


 <!-- / main body -->
    <div class="clear"></div>
  </main>



<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->

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