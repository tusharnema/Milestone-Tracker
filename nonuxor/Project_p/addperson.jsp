<%


Integer projectSes = (Integer) session.getAttribute("projectSession");

%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
 <HEAD>
  <TITLE>Add/Delete Person</TITLE>
  <script>
  function validate()
  {
      
       var len;
       if(document.getElementById("psize").value=="")
      {
            len = 1;
      }
      else
      {
          len  = parseInt(document.getElementById("psize").value);
      }
     
            for(var i=1; i<=len; i++) {
            var person = "person" + i;
            if(document.getElementById(person).value=="")
            {
                alert("Please enter person");
                document.getElementById(person).focus();
                return false;
            }
        }
      return true;
  }
function addRow()
{
  var ptable = document.getElementById('ptablePerson');
  var lastElement = ptable.rows.length;
  var index = lastElement;
  var row = ptable.insertRow(lastElement);


  var cellLeft = row.insertCell(0);
  var textNode = document.createTextNode(index);
  cellLeft.appendChild(textNode);

  var cellText = row.insertCell(1);
  var element = document.createElement('input');
  element.type = 'text';
  element.name = 'person' + index;
  element.id = 'person' + index;
  element.size = 30;
  element.hidden =index;
 
  cellText.appendChild(element);
  document.getElementById("psize").value=index;
  }

function removeRow()
{
  var ptable = document.getElementById('ptablePerson');
  var lastElement = ptable.rows.length;
  if (lastElement > 2) ptable.deleteRow(lastElement - 1);
  if(document.getElementById("psize").value>1)
    {
       document.getElementById("psize").value = document.getElementById("psize").value-1;
    }
}
</script>
 </HEAD>

 <BODY>

<form action="show.jsp" method="post" onsubmit="return validate();">
<input type="hidden" name="psize" id="psize">
<table style="border:1px solid #000000;" bgcolor="#efefef" id="ptablePerson" align="center">
<tr>
<th colspan="3">Add New Person</th>
</tr>
<tr>
<td>1</td>
<td><input type="text" name="person1"  id="person1" size="30"  /><input type="button" value="Add" onclick="addRow();" /></td>

</tr>
</table>
<table align="center">
 <tr><td><input type="button" value="Remove" onclick="removeRow();" /><input type="Submit" value="Submit" /></td></tr>
</table>
</form>
</BODY>
</HTML>
