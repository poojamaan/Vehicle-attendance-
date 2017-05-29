<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import= "java.sql.*" %>
    <%@ page import= "databaseConnection.*" %>
    <%@ include file="userMenu.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registered Vehicle Registration</title>


</head>
<body>


				<form action="registeredDatabase.jsp" method="post">
				<table class="table table-striped">
				<tr>
				<td>
				<label > Emp_ID </label> 
				</td>
				<td>
					<input type="text" name ="user_id" id="user_id" pattern="^[3][0-9]{6}[0]$|" required>
					</td>
					</tr>
					
					<br>
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
					<select name="veh_category" id="veh_category" required >
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
					
					<input type="text" name="veh_no" id="veh_no" required pattern="^[A-Z]{2}[0-9A-Z]{8}| ^[A-Z]{2}[0-9A-Z]{9}$"/>
					</td>
					</tr>
					
					<tr>
					<td>
					
<!-- 					user company should be deleted --> 

					<label> User Company</label>
					</td>
					<td>
					
					<input type="text" name="user_company" id="user_company" pattern="[A-Z][a-zA-Z]*" required/>
					</td>
					</tr>
					<tr>
				
					<td align="center">
					<button id="submit" name="submit" value="submit">Submit</button>
					</td>
					<td align="center">
					<button type="button" onclick="generatecode.jsp">Generate QR code</button>
					</td>
					</tr>
					</table>
				</form>
				
				
			
		
			<button value="submit" id="submit" name="submit"> </button>
		
			
	
</div>
</body>
</html>