<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="databaseConnection.DBConnection"%>
    <%@page import="java.sql.*" %>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>



<link rel="stylesheet" type="text/css" href="date-jquery-ui.css">

 <script type="text/javascript" src="js/date-jquery-1.12.4.js"></script>
  <script type="text/javascript" src="js/ui-1.12.1-jquery-ui.js"></script>
  
 <script type="text/javascript">
  $( function() {
    $( "#datepicker" ).datepicker(
    		{
    			dateFormat:'mm-dd-yy',
    			changeMonth:true,
    		changeYear:true
    		});
  }
  );
  </script>
  
  
  
  <link rel="stylesheet" type="text/css" href="css/Create.css"> 
  
</head>
<body>

<% 

	String empy_name=String.valueOf(session.getAttribute("empy_name"));
	String empy_role=String.valueOf(session.getAttribute("empy_role"));
	String empy_loc=String.valueOf(session.getAttribute("empy_loc"));
	//String valid=String.valueOf(session.getAttribute("valid"));
%>

       
	
<div>
	<div id="Outer">
		<div id="Header">
			<div id="leftContainer"> 
				<img src="images/Hindustan_Petroleum_Logo.png" height="100" width="100">
			 </div>

			<div id=" rightContainer" align="center">
				<p align="centre"><b style="font-size: 50px; font-family:sans-sarif;color:white"> Hindustan
					Petroleum Corporation Limited </b> </p>
			</div>
		</div>
		
		<div class="mainBody">
		
			<div class="leftBar">
			
			</div>
			
			<div class="midBar">
			
				<p align="center" > <b> <u>Visitor Vehicle  Registration </u></b></p>
				
				<form id="info" action="visDatabase.jsp" method="post">
					
					<input type="text" name="name"  value="<%= empy_name%>"/>
					<br>
					<input type="text" name="role"  value="<%= empy_role%>" />
					<br>
					<input type="text" name="location" value="<%= empy_loc%>" />
					
					</form>
					
				
					
				<form action="visDatabase.jsp" method="get">
				<table >
				<tr>
				<td>
				<label > Security ID </label> 
				</td>
				<td>
					<input type="text" name ="vis_name" id="vis_name">
					</td>
					</tr>
					
					<tr>
				<td>
				<label > Security NAME</label> 
				</td>
				<td>
					<input type="text" name ="vis_company" id="vis_company">
					</td>
					</tr>
				
					<tr>
					<td>
					<label> SECURITY PASSWORD</label>
				
					</td>
					<td>
					
					<input type="text" name="vis_veh_no" id="vis_veh_no"/>
					
					</td>
					</tr>
					<tr>
					<td>
					<label> CONTACT_NO</label>
					</td>
					<td>
					
					<input type="text" name="vis_veh_no" id="vis_veh_no"/>
				

					</td>
					
					</tr>
					<tr>
					<td>
					<label> LOC_CODE</label>
					</td>
					<td>
					
					<input type="text" name="vis_veh_no" id="vis_veh_no"/>
					</td>
					
					</tr>
					
					</tr>
					
					
					</tr>
					<tr>
					<td>
					<label> ADDRESS</label>
					</td>
					<td>
					
					<input type="text" name="meet_person" id="meet_person"/>
					</td>
					</tr>
					
					</tr>
					<tr>
					<td>
					<label> PIN_CODE</label>
					</td>
					<td>
					
					<input type="text" name="purpose" id="purpose "/>
					</td>
					</tr>
					
					</tr>
					<tr>
					<td>
					<label>EMP_STATE</label>
					</td>
					
					<td>
					
						<select name="veh_category" id="veh_category">
					<option value="scooter"> scooter</option>
					<option value="bike"> bike</option>
					<option value="car"> car</option>
					<option value="bus"> bus</option>
					<option value="truck"> truck</option>
					<option value="Scooty"> Scooty</option>
					</select>
					
					
					</td>
					</tr>
					
					<tr>
					<tr>
					<td>
					<label> MARITAL_STATUS</label>
					</td>
					<td>
					
					<input type="text" name="purpose" id="purpose "/>
					</td>
					</tr>
					<tr>
					<td>
					<label> DOB</label>
					</td>
					<td>
					
					<input type="text" id="datepicker" name="valid" />
					</td>
					</tr>
					<tr>
					<td>
					<label> BASIC_PAY</label>
					</td>
					<td>
					
					<input type="text" name="purpose" id="purpose "/>
					</td>
					</tr>
				
					<td >
					<button value="submit" name="submit" id="submit">Submit</button>
					</td>
					<td>
					<button onclick="generatecode.jsp">Generate QR-Code</button>
					</table>
				</form>
			
			</div>
			
			<div  class="rightBar"> 
			
			</div>
		</div>
		</div>
	
</div>
</body>
</html>