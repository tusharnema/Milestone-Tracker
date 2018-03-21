<%@ page import = "org.apache.log4j.*,java.sql.*,com.cl.sql.PoolManager,oracle.jdbc.driver.OracleTypes,oracle.sql.CLOB,java.io.*,java.text.*, java.net.*,com.cl.auth.EncrDec,com.cl.auth.IlligalAccess,java.util.*"  %>

<%



  PoolManager pool = PoolManager.getInstance();
    Connection connection=null;
    CallableStatement call=null;
  ResultSet rs = null;
  int projectid = 0;
  String status="";
  StringBuffer sb = new StringBuffer();
  connection = pool.getConnection("erp");
  
  ArrayList<String> area = new ArrayList<String>();
  ArrayList<Integer> areaId = new ArrayList<Integer>();

  ArrayList<String>  spl = new ArrayList<String>();
  ArrayList<Integer> splId = new ArrayList<Integer>();
  ArrayList<Integer> topicSplId = new ArrayList<Integer>();

  ArrayList<String> topic = new ArrayList<String>();
  ArrayList<String> topicImg = new ArrayList<String>();
  ArrayList<Integer> topicId = new ArrayList<Integer>();
  ArrayList<Integer> areaTopicId = new ArrayList<Integer>();

  ArrayList<String> subtopic = new ArrayList<String>();
  ArrayList<Integer> subtopicId = new ArrayList<Integer>();
  ArrayList<Integer> splSubtopicId = new ArrayList<Integer>();

  try
  {
    call = connection.prepareCall("CALL ERP.CL_WAIN_PKG.GET_PROJECT_DETAILS(?,?,?,?)");   
        call.registerOutParameter(1,OracleTypes.CURSOR);
        call.registerOutParameter(2,OracleTypes.CURSOR);
        call.registerOutParameter(3,OracleTypes.CURSOR);
        call.registerOutParameter(4,OracleTypes.CURSOR);
        call.execute();
    rs = (ResultSet)call.getObject(1);
    while(rs.next())
    {
      areaId.add(rs.getInt("AREA_ID"));
      area.add("'"+rs.getString("AREA_NAME")+"'");
    }
    rs = (ResultSet)call.getObject(2);
    while(rs.next())
    {
      topicSplId.add(rs.getInt("TOPIC_ID"));
      splId.add(rs.getInt("SPL_ID"));
      spl.add("'"+rs.getString("SPL_NAME")+"'");
    }
    rs = (ResultSet)call.getObject(3);
    while(rs.next())
    {
      areaTopicId.add(rs.getInt("AREA_ID"));
      topicId.add(rs.getInt("TOPIC_ID"));
      topic.add("'"+rs.getString("TOPIC_NAME")+"'");
      topicImg.add("'"+rs.getString("FILE_URL")+"'");
    }
    rs = (ResultSet)call.getObject(4);
    while(rs.next())
    {
      splSubtopicId.add(rs.getInt("SPL_ID"));
      subtopicId.add(rs.getInt("SUB_TOPIC_ID"));
      subtopic.add("'"+rs.getString("SUB_TOPIC_NAME")+"'");
    }
    
    
  try{
    int cnt=0;
    call = connection.prepareCall("CALL ERP.CL_WAIN_PKG.GET_INSTITUTES(?)");
        call.registerOutParameter(1,OracleTypes.CURSOR);
        call.execute();
    rs=(ResultSet) call.getObject(1);
    while(rs.next())
    {
      ++cnt;
      sb.append("<option value="+rs.getString("INST_NAME")+">"+rs.getString("INST_NAME")+"</option>");
    }
    }catch(Exception e)
    {
      throw e;
    }
  }catch(Exception ex)
  {
    throw ex;
  }finally
  {
      try{call.close();}catch(Exception ex){}
      try{rs.close();}catch(Exception ex){}
  }
%>

<html>
<head>
    <meta charset="UTF-8">
  <title>Sign Up Form</title>
  
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">

  <link rel='stylesheet prefetch' href='http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css'>

      <link rel="stylesheet" href="css/style.css">

<style>
select option[data-default] {
  color: #888;
}
h4 {
    color: #7d5717;
}
</style>
 
  <script LANGUAGE="JavaScript" src="/jscript/cl_functions.js"></script>
  <script language="JavaScript">

    var area     = <%=area%>;
  var areaId     = <%=areaId%>;
  
  var topicId    = <%=topicId%>;
  var topic    = <%=topic%>;
  var topicImg   = <%=topicImg%>;
  var areaTopicId  = <%=areaTopicId%>;

  var splId    = <%=splId%>;
  var spl      = <%=spl%>;
  var topicSplId   = <%=topicSplId%>;

  var subtopicId   = <%=subtopicId%>;
  var splSubtopicId= <%=splSubtopicId%>;
  var subtopic   = <%=subtopic%>;

  
  function validate()
  {
        var flag=true;
     
    if(document.projectForm.area.value=="0")
    {
      alert("Please Select Area");return false;
    }
    if(document.projectForm.topic.value=="0")
    {
      alert("Please select Topic");return false;
    }
    if(document.projectForm.spl.value=="0")
    {
      alert("Please Select Specializton");return false;
    }
    if(document.projectForm.subtopic.value=="0")
    {
      alert("Please Select Sub Topic");return false;
    }

    if(document.getElementById("projecttitle").value=="")
    {
      alert("Please Enter Project Title");return false;
    }

    if(document.getElementById("focusarea").value=="")
    {
      alert("Please Enter Focus area");return false;
    }

    if(document.getElementById("novelty1").value=="")
    {
      alert("Please Enter Novelty1");return false;
    }

    if(document.getElementById("application1").value=="")
    {
      alert("Please Enter Application 1");return false;
    }
    if(document.getElementById("keywords").value=="")
    {
      alert("Please Enter Keywords");return false;
    }

    if(document.getElementById("instname").value=="")
    {
      alert("Please Enter Institute Name");return false;
    }

    if(document.projectForm.insType.value=="")
    {
      alert("Please Select Institute Type");return false;
    }

    $('#innovators.form-control').each(function(i,v){
      if(v.value=="")
      { flag=false;return;}
    });

    $('#innovatorsemail.form-control').each(function(i,v){
      if(v.value=="")
      { flag=false;return;}
    });
    
    if(!flag)
    {
      alert("Please Enter Innovater name and Email");return false;
    }
/*
    if(document.getElementById("innovators").value=="")
    {
      alert("Please Enter Innovater");return false;
    }
    
    if(document.getElementById("innovatorsemail").value=="")
    {
      alert("Please Enter Innovatorsemail");return false;
    }
*/
    return true;
  }

 

  function getTopic(a)
  {
    var topicList = "<select name='topic' id='topic' class='form-control' onchange=getSpecialization(this.value);><option value='0'>&nbsp;&nbsp; --Select-- &nbsp;&nbsp;</option>";//onchange='getModule(this.value)'
    for(var i=0;i<areaTopicId.length;i++)
    {
      if(areaTopicId[i] == a)
      topicList+="<option value = " +topicId[i]+ ">" + topic[i]+"</option>";
    } 
    topicList+="</select>";
    
    document.getElementById("getTopics").innerHTML = topicList;
  }
  

  function getSpecialization(t)
  {
        var splList = "<select name='spl' id='spl' class='form-control' ><option value='0'>&nbsp;&nbsp; --Select-- &nbsp;&nbsp;</option>";

    for(var i=0;i<topicSplId.length;i++)
    {
      if(topicSplId[i] == t)
      splList+="<option value = " +splId[i]+ ">" + spl[i]+"</option>";
    } 
    splList+="</select>";
    
    document.getElementById("getSpl").innerHTML = splList; 
    var ind =  topicId.indexOf(Number(t)); 
    var tmp=topicImg[ind];
    
  }

 

 
  

 

  function saveData(key,thisvar)
  {
    var area =$("#area").val(),
      topic=$("#topic").val(),
      spl=$("#spl").val();
    
    if($(thisvar).val() != '' && $(thisvar).val().length>5 && confirm("Data will be added.\nDo You want to Continue?"))
    {
      $.ajax({
          url   : "SaveChanges.jsp", 
          data  : {area:area,topic:topic,spl:spl,key:key,value:thisvar.value} , 
          success : function(result){
                if(result.trim() == "SUCCESS")
                  alert("Added Successfuly!");
                else
                  alert("Session Expired!");
                window.location.reload();
                 },
          error : function(result){
                  alert("Failed While Adding Data!");
                }
        });
    }
    else
    {     
      $(thisvar).prev().show();
      $(thisvar).remove();
    }
  }


  </script>

</head>
<body>
<%
    

  try
  { projectid=Integer.parseInt(request.getParameter("projectid"));}catch(Exception e){projectid=0;}
    
  String key = request.getParameter("key");
  
  int areaid = 0;
  int splid = 0;
  int topicid = 0;
  int subtopicid = 0;
  //String  = "";
  String ptitle = "";
  String pdesc = "";
  String farea = "";
  String n1 = "";
  String n2 = "";
  String n3 = "";
  String app1 = "";
  String app2 = "";
  String app3 = "";
  String fview = "";
  String insname = "";
  String keyword = "";
  //String innov = "";
  //String innovemail = "";
  String innov[]    = null;
  String innovemail[] = null;
  String mentor1 = "";
  String mentor2 = "";
  String mentoremail1 = "";
  String mentoremail2 = "";
  String mentororg1 = "";
  String mentororg2 = "";
  String insType = "";
  String stage = "";

  try{
      call = connection.prepareCall("CALL ERP.CL_INNOVATION_PKG.MT_PROJECT_SEARCH_ALL(?,?)");
      call.setInt(1,projectid);
      call.registerOutParameter(2,OracleTypes.CURSOR);
      call.execute();
      rs = (ResultSet)call.getObject(2);

        if(rs.next())
      {
        areaid = rs.getInt("AREA_ID");
        splid = rs.getInt("SPL_ID");
        topicid = rs.getInt("TOPIC_ID");
         
      }
    }catch(Exception e)
    {
      throw e;
    }
    finally                          
    {
      try{call.close();}catch(Exception ex){}
      try{rs.close();}catch(Exception ex){}
      pool.freeConnection("erp",connection);
    }
  //}

%>





  
<div class="container" style="color:black;">
  <form action="../rt.jsp">
    <div class="row">
      <h4>Create New Project</h4>
      
	  <br>
	  <br>
	  
	         <div class="form-group">
          <label class="control-label col-sm-4">Name of the Project<font color='red'>*</font></label>
		   <div class="col-sm-8"> 
          <input type="text" name="P_name" placeholder="Name of the Project"/>
		  <br>
		<br>
        </div>
		</div>
		
 
 
        <div class="form-group">
          <label class="control-label col-sm-4">Area<font color='red'>*</font></label>
          <div class="col-sm-8">          
            <select class="form-control" id="area" name="Area" onchange="getTopic(this.value)">
              <option value="0">Please select </option>
              <script language=javascript>              
                for(i=0;i<areaId.length;i++)
                {
                  if(areaId[i]==<%=areaid%>)
                  document.write("<option value = " +areaId[i]+ " selected>" + area[i]+"</option>");
                  else
                  document.write("<option value = " +areaId[i]+ ">" + area[i]+"</option>");
                }             
              </script>
            </select>
			<br>
		<br>
          </div>
        </div>
		<br>
		
                <div class="form-group">
          <label class="control-label col-sm-4">Topic <font color='red'>*</font></label>
          <div class="col-sm-8" id="getTopics">         
            <select class="form-control" name="top_name" id="topic">
              <option value="0">Please Select </option>
              <script language=javascript>              
                for(i=0;i<topicId.length;i++)
                {
                  if(topicId[i]==<%=topicid%>)
                  document.write("<option value = " +topicId[i]+ " selected>" + topic[i]+"</option>");                  
                }             
              </script>
            </select>
			
			
						
		
		
          </div>
          
        </div>
<br><br><br>
                <div class="form-group">
          <label class="control-label  col-sm-4">Spl<font color='red'>*</font></label>
          <div class="col-sm-8" id="getSpl">              
            <select class="form-control" id="spl" name="spl">
              <option value="0">Please Select </option>
              <script language=javascript>              
                for(i=0;i<splId.length;i++)
                {
                  if(splId[i]==<%=splid%>)
                  document.write("<option value = " +splId[i]+ " selected>" + spl[i]+"</option>");                  
                }             
              </script>
            </select>
			
          </div>
		  </br>
		</br>

        </div>
		
        	         <div class="form-group">
					 </br>
		</br>
          <label class="control-label col-sm-4">Start Date<font color='red'>*</font></label>
		   <div class="col-sm-8"> 
          <input type="text" placeholder="DD-MM-YYYY" name="SD" />
		  <br>
		<br>
        </div>
		</div>
		
      	         <div class="form-group">
          <label class="control-label col-sm-4">End Date<font color='red'>*</font></label>
		   <div class="col-sm-8"> 
          <input type="text" placeholder="DD-MM-YYYY" name="ED" />
		  <br>
		<br>
        </div>
		</div>
		
      
      
      <!--<div class="input-group input-group-icon">
        <input type="password" placeholder="Password"/>
        <div class="input-icon"><i class="fa fa-key"></i></div>
      </div>-->
          	         <div class="form-group">
          <label class="control-label col-sm-4">Novelity<font color='red'>*</font></label>
		   <div class="col-sm-8"> 
          <input type="text" name="Novelity" />
		  <br>
		<br>
        </div>
		</div>
		
            	         <div class="form-group">
          <label class="control-label col-sm-4">Application<font color='red'>*</font></label>
		   <div class="col-sm-8"> 
          <input type="text" name="Application" />
		  <br>
		<br>
        </div>
		</div>
		
            	         <div class="form-group">
          <label class="control-label col-sm-4">Description<font color='red'>*</font></label>
		   <div class="col-sm-8"> 
          <input type="text" name="Desc" />
		  <br>
		<br>
        </div>
		</div>
		
      
   
    
    
</div>


    <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
              <div class="pull-right">
                <button type="submit" class="btn btn-default">Cancel</button>
                <button type="submit" class="btn btn-primary">Create</button>
              </div>
            </div>
          </div>
    
  </form>
</div>
  <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

  

    <script  src="js/index.js"></script>




</body>

</html>
