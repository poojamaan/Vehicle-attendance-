
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="databaseConnection.DBConnection"%>
    <%@page import="java.sql.*" %>
    <%@ include file="userMenu.jsp" %>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Visitor Vehicle Registration</title>


<!--  for date picker -->
<link rel="stylesheet" type="text/css" href="css/date-jquery-ui.css">
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
  
  

  
</head>
<body>

<div class="container">
		<div id="welcome" align="center">
			<h1> Visitor Vehicle Registration</h1>
		</div >
					
					
				<form action="visDatabase.jsp" method="post">
				<table class="table table-striped" frame="box">
				<tr>
				<td>
				<label > Visiter_Name </label> 
				</td>
				<td>
					<input type="text" name ="vis_name" id="vis_name" required pattern="[A-Z][a-zA-Z]*">
					</td>
					</tr>
					
					<tr>
				<td>
				<label > Visiter_Company</label> 
				</td>
				<td>
					<input type="text" name ="vis_company" id="vis_company" required>
					</td>
					</tr>
				
					<tr>
					<td>
					<label> Vehicle type</label>
				
					</td>
					<td>
						<select name="veh_type" id="veh_type" required>
					<option value="2-Wheeler">2-Wheeler </option>
					<option value="3-Wheeler">3-Wheeler </option>
					<option value="4-Wheeler"> 4-Wheeler</option>
					<option value="6-Wheeler"> 6-Wheeler</option>
					<option value="8-Wheeler"> 8-Wheeler</option>
					</select>
					
					
					</td>
					</tr>
					<tr>
					<td>
					<label> Vehicle Category</label>
					</td>
					<td>
						<select name="veh_category" id="veh_category" required>
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
					<td>
					<label> Vehicle Number</label>
					</td>
					<td>
					
					<input type="text" name="vis_veh_no" id="vis_veh_no" required pattern="^[A-Z]{2}[0-9A-B]{8}$^[A-Z]{2}[0-9A-B]{9}$"/>
					</td>
					
					</tr>
					
					</tr>
					
					
					</tr>
					<tr>
					<td>
					<label> Meet Person</label>
					</td>
					<td>
					
					<input type="text" name="meet_person" id="meet_person" pattern="[A-Z][a-zA-Z]*" required/>
					</td>
					</tr>
					
					</tr>
					<tr>
					<td>
					<label> Purpose</label>
					</td>
					<td>
					
					<input type="text" name="purpose" id="purpose " required pattern="[A-Z][a-zA-Z]*"/>
					</td>
					</tr>
					
					</tr>
					<tr>
					<td>
					<label> Valid Up_to</label>
					</td>
					<td>
					
					<input type="text" id="datepicker" name="valid" required/>
					</td>
					</tr>
					
					<tr>
				
					<td >
					<button value="submit" name="submit" id="submit" >Submit</button>
					</td>
					<td>
					<button onclick="generatecode.jsp">Generate QR-Code</button>
					</table>
				</form>
			
			</div>
			

</body>
</html>