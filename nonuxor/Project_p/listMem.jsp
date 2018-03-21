
<%@ page
  import="java.sql.*,com.cl.sql.PoolManager,oracle.jdbc.driver.OracleTypes,oracle.sql.CLOB,java.io.*,java.text.*, java.net.*,com.cl.auth.EncrDec,com.cl.auth.IlligalAccess,java.util.*,org.apache.log4j.*"
  buffer="none"%>

  <%

  int projectId = 0;
  Integer group_id = (Integer) session.getAttribute("group_Id");
  
  String remove_mem ="";
  remove_mem= request.getParameter("removeMem");
  
  Integer projectSes = (Integer) session.getAttribute("projectSession");
  
  int userId = 0;
  String status = "";
  

    try{ userId = Integer.parseInt((String)session.getAttribute("userId"));}catch(Exception e){userId=0;}
  if(userId<=0)
  {
    response.sendRedirect("login.jsp");
    return;
  }


 

String personk="";
String ptypek="";

  Connection connection = null;
  PoolManager poolManager = PoolManager.getInstance();
  Category logCategory = Category.getInstance("clsite.mywain.project_list.jsp");
  
  CallableStatement call = null;
  ResultSet rs = null;


try{
    connection = poolManager.getConnection("erp");


	
   try{
        call = connection.prepareCall("CALL ERP.CL_INNOVATION_PKG.MT_DELETE_MEMBER(?,?)");
        call.setString(1,remove_mem);
        call.registerOutParameter(2,OracleTypes.VARCHAR);
        call.execute();
        status=call.getString(2);
        
        }catch(Exception e)
        {
            throw e;
        }
		


    call = connection.prepareCall("{call erp.CL_INNOVATION_PKG.GET_LIST_MEMBERS(?,?)}");
    
    call.setInt(1,group_id);
    call.registerOutParameter(2, OracleTypes.CURSOR);
    call.execute();
    

    
    rs = (ResultSet) call.getObject(2);

    

    
    
    
    
} catch (Exception exec) {
    //logCategory.error(exec);
    throw exec;
  } 

%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <!-- This file has been downloaded from Bootsnipp.com. Enjoy! -->
    <title>ADD PRODUCTS - Bootsnipp.com</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="http://netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">
    <style type="text/css">
	<script>
        document.write(5 + 6)
		</script>
    </style>
    <script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
	
	<script LANGUAGE="JavaScript" src="http://www.careerlauncher.com/jscript/cl_functions.js"></script>
	 <link href="/css/bootstrap.css" rel="stylesheet">    
	 <script type="text/javascript" src="http://www.careerlauncher.com/js/jquery.min.js"></script>
	 <script type="text/javascript" src="http://www.careerlauncher.com/js/bootstrap.min.js"></script>
	 <script>
    function removeMember(NAME) 
    {
        var txt;
        var r = confirm("Are you sure ?");
        if (r == true) {
             document.location="listMem.jsp?removeMem="+NAME;
        } else {
            return false;
        }
        return true;
    }
</script>
</head>
<body>
<style>
.inline{
  display: inline-block;
}
</style>

<form action="add_products.jsp" class="form-horizontal">
<fieldset>
<div class="container">
<!-- Form Name -->
<legend>Add Members</legend>


<!-- ROW STARTS-->
<div class="row">
  <div class="col-md-4">


<div class="form-group">
  <label class="col-md-6 control-label" for="product_id">MEMBER 1</label>  
  <div class="col-md-6">
  <input id="product_id" name="mem"  class="form-control input-md" required="" type="text">
    
  </div>
</div>

<!-- Text input-->
</div>

<!-- Text input-->

<div class="col-md-4">
<!-- Select Basic -->
<div class="form-group">
  <label class="col-md-6 control-label" for="product_categorie">MEMBER TYPE</label>
  <div class="col-md-6">
    <select id="product_categorie" name="typ" class="form-control">
      <option selected>Choose...</option>
    <option value="1">Student</option>
    <option value="2">Mentor</option>
    
    </select>
  </div>
</div>


</div>


</div>

<!-- ROW ENDS-->


<!-- ROW STARTS-->
<div class="row">
  <div class="col-md-4">


<div class="form-group">
  <label class="col-md-6 control-label" for="product_id">MEMBER 2</label>  
  <div class="col-md-6">
  <input id="product_id" name="mem"  class="form-control input-md" required="" type="text">
    
  </div>
</div>

<!-- Text input-->
</div>

<!-- Text input-->

<div class="col-md-4">
<!-- Select Basic -->
<div class="form-group">
  <label class="col-md-6 control-label" for="product_categorie">MEMBER TYPE</label>
  <div class="col-md-6">
    <select id="product_categorie" name="typ" class="form-control">
      <option selected>Choose...</option>
    <option value="1">Student</option>
    <option value="2">Mentor</option>
    
    </select>
  </div>
</div>


</div>
</div>

<!-- ROW ENDS-->


<!-- ROW STARTS-->
<div class="row">
  <div class="col-md-4">


<div class="form-group">
  <label class="col-md-6 control-label" for="product_id">MEMBER 3</label>  
  <div class="col-md-6">
  <input id="product_id" name="mem"  class="form-control input-md" required="" type="text">
    
  </div>
</div>

<!-- Text input-->
</div>

<!-- Text input-->

<div class="col-md-4">
<!-- Select Basic -->
<div class="form-group">
  <label class="col-md-6 control-label" for="product_categorie">MEMBER TYPE</label>
  <div class="col-md-6">
    <select id="product_categorie" name="typ" class="form-control">
      <option selected>Choose...</option>
    <option value="1">Student</option>
    <option value="2">Mentor</option>
    
    </select>
  </div>
</div>


</div>
</div>

<!-- ROW ENDS-->


<!-- ROW STARTS-->
<div class="row">
  <div class="col-md-4">


<div class="form-group">
  <label class="col-md-6 control-label" for="product_id">MEMBER 4</label>  
  <div class="col-md-6">
  <input id="product_id" name="mem"  class="form-control input-md" required="" type="text">
    
  </div>
</div>

<!-- Text input-->
</div>

<!-- Text input-->

<div class="col-md-4">
<!-- Select Basic -->
<div class="form-group">
  <label class="col-md-6 control-label" for="product_categorie">MEMBER TYPE</label>
  <div class="col-md-6">
    <select id="product_categorie" name="typ" class="form-control">
      <option selected>Choose...</option>
    <option value="1">Student</option>
    <option value="2">Mentor</option>
    
    </select>
  </div>
</div>


</div>
</div>

<!-- ROW ENDS-->


<!-- ROW STARTS-->
<div class="row">
  <div class="col-md-4">


<div class="form-group">
  <label class="col-md-6 control-label" for="product_id">MEMBER 5</label>  
  <div class="col-md-6">
  <input id="product_id" name="mem"  class="form-control input-md" required="" type="text">
    
  </div>
</div>

<!-- Text input-->
</div>

<!-- Text input-->

<div class="col-md-4">
<!-- Select Basic -->
<div class="form-group">
  <label class="col-md-6 control-label" for="product_categorie">MEMBER TYPE</label>
  <div class="col-md-6">
    <select id="product_categorie" name="typ" class="form-control">
      <option selected>Choose...</option>
    <option value="1">Student</option>
    <option value="2">Mentor</option>
    
    </select>
  </div>
</div>


</div>
</div>

<!-- ROW ENDS-->



<br>

<!-- Button -->
<div class="form-group">
  <div class="col-md-4" >
</div>
  <div class="col-md-6" >
    <button type="submit" id="singlebutton" name="singlebutton" class="btn btn-primary">Allocate</button>
  </div>
  </div>

</form>
<br>
<br>
<hr>
<legend>View/Remove Members</legend>

<br>
<!-- view members start -->


<!-- ROW STARTS-->
<div class="row">
  <div class="col-md-4">


<div class="form-group">
  <label class="col-md-6 control-label" for="product_id">Members</label>  
  

</div>

<!-- Text input-->
</div>

<!-- Text input-->

<div class="col-md-4">
<!-- Select Basic -->
<div class="form-group">
  <label class="col-md-6 control-label" for="product_categorie">Member Type</label>
  
</div>


</div>




</div>

<!-- ROW ENDS-->

<!-- ROW STARTS-->
<%while(rs.next()){%>
<div class="row">
  <div class="col-md-4">


<div class="form-group">
  <label class="col-md-6 control-label" for="product_id"><%=rs.getString("member_name")%></label>  
  

</div>

<!-- Text input-->
</div>

<!-- Text input-->

<div class="col-md-4">
<!-- Select Basic -->
<div class="form-group">
  <label class="col-md-6 control-label" for="product_categorie"><%=rs.getString("user_type")%></label>
  
</div>


</div>




</div>
<%}%>

<!-- ROW ENDS-->





<!-- view member ends -->

</div>
</fieldset>


<script type="text/javascript">

</script>
</body>
</html>
