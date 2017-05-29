<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Scanning QR</title>


<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
 <link rel="stylesheet"  href="css/bootstrap.min.css">
  <link rel="stylesheet"  href="css/header.css">
   <style type="text/css">
  #left
 {
 height: 100px;
 width: 20%;
  background-image: url('images/Hindustan_Petroleum_Logo.svg');
   background-size: 150px 100px;
    background-repeat: no-repeat;
    float: left;
 }</style>
 
 
</head>
<body>


			<%
			String empy_name=String.valueOf(session.getAttribute("empy_name"));
			System.out.println(empy_name);
			String empy_role=String.valueOf(session.getAttribute("empy_role"));
			String empy_loc=String.valueOf(session.getAttribute("empy_loc"));
			String empy_id=String.valueOf(session.getAttribute("empy_id"));
			%>
			
		<div  class="jumbotron text-center"> 
<div id="outer">
		<div id="left"></div>
		<div id="centers">
				<H2>HINDUSTAN PETROLEUM CORPORATION LIMITED</H2>
		</div>
		<div id="right">
		<button class="btn btn-danger navbar-btn">LOGOUT</button>
		<BR>
		<span><%= empy_loc %></span>
		</div>
</div>


	<div id="welcome">
		<h2>WELCOME 
		<SPAN><%= empy_name %></SPAN></h2>
		SELECT IN AND OUT OF VEHICLE :
</div>
			
			
			<div>		
				
					<a href="InSelect.jsp" ><Button  class="btn btn-danger navbar-btn"> Vehicle In</Button></a>
					
					
		<br>
		<br>
		<br>
					<a href="OutSelect.jsp" ><Button  class="btn btn-danger navbar-btn"> Vehicle Out</Button></a>
			
			
			</div>
			
		
	
</div>
</body>
</html>