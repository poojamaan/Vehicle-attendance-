
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="databaseConnection.DBConnection"%>
    <%@page import="java.sql.*" %>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
 <link rel="stylesheet"  href="css/bootstrap.min.css">


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

<% 

	String empy_name=String.valueOf(session.getAttribute("empy_name"));
	String empy_role=String.valueOf(session.getAttribute("empy_role"));
	String empy_loc=String.valueOf(session.getAttribute("empy_loc"));
	//String valid=String.valueOf(session.getAttribute("valid"));
%>

       
	

			
					
				<form action="employeeDatabase.jsp" method="get">
				<table class="table table-striped" >
				<tr>
				<td>
				<label > EMP_ID </label> 
				</td>
				<td>
					<input type="text" name ="EId" id="EId">
					</td>
					</tr>
					
					<tr>
				<td>
				<label > EMP_NAME</label> 
				</td>
				<td>
					<input type="text" name ="EName" id="EName">
					</td>
					</tr>
				
					<tr>
					<td>
					<label> EMAIL_ID</label>
				
					</td>
					<td>
						<input type="text" name="email" id="email"/>
					
					</td>
					</tr>
					<tr>
					<td>
					<label> CONTACT_NO</label>
					</td>
					<td>
						<input type="text" name="CNum" id="CNum"/>
					
					</td>
					
					</tr>
					<tr>
					<td>
	<!-- 				it shoulf be come from database  -->
					<label> LOC_CODE</label>
					</td>
					<td>
					
					<input type="text" name="LCode" id="LCode"/>
					</td>
					
					</tr>
					
					</tr>
					
					
					</tr>
					<tr>
					<td>
					<label> ADDRESS</label>
					</td>
					<td>
					
					<input type="text" name="addr" id="addr"/>
					</td>
					</tr>
					
					</tr>
					<tr>
					<td>
					<label> PIN_CODE</label>
					</td>
					<td>
					
					<input type="text" name="PCode" id="PCode "/>
					</td>
					</tr>
					
					</tr>
					<tr>
					<td>
					<label>EMP_STATE</label>
					</td>
					
					<td>
					
						<select name="EState" id="EState">
					<option value="January"> January</option>
					<option value="February"> February</option>
					<option value="March"> March</option>
					<option value="April"> April</option>
					<option value="May"> May</option>
					<option value="June"> June</option>
					</select>
					
					
					</td>
					</tr>
					
					<tr>
				
					<td>
					<label> MARITAL_STATUS</label>
					</td>
					<td>
					
					<input type="text" name="MStatus" id="MStatus"/>
					</td>
					</tr>
					<tr>
					<td>
					<label> DOB</label>
					</td>
					<td>
					
					<input type="text" id="datepicker" name="DOB" />
					</td>
					</tr>
					<tr>
					<td>
					<label> BASIC_PAY</label>
					</td>
					<td>
					
					<input type="text" name="BPay" id="BPay"/>
					</td>
					</tr>
				<tr>
					<td >
					<button value="submit" name="submit" id="submit">Submit</button>
					</td>
					</tr>
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