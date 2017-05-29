<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <meta name="viewport" content="width=device-width, initial-scale=1">
<title>Login Page</title>

 <link rel="stylesheet"  href="css/header.css">
 
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
 <link rel="stylesheet"  href="css/bootstrap.min.css">
 

 <style type="text/css">
  #left
 {
 height: 100px;
 width: 20%;
  background-image: url('images/Hindustan_Petroleum_Logo.svg');
   background-size: 150px 100px;
    background-repeat: no-repeat;
    float: left;
    /*  background-color:  #ebd9c6; */
 }</style>
</head>
<body>
<div  class="jumbotron text-center">
<div id="outer">
		<div id="left"></div>
		<div id="centers">
				<H2>HINDUSTAN PETROLEUM CORPORATION LIMITED</H2>
		</div>
		<div id="right">
		</div>
		
</div>

  <form class="form-horizontal" action="loginDatabase.jsp" id="bg">
    <div class="form-group">
    
    <h2>Login Credential </h2>
       
      <label class="control-label col-sm-2" >Employee ID:</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" id="email" placeholder="Enter User Id" name="emp_id"  required>
        <span class="help-block with-errors"> Start with 3 and end with 0 and contains 8 digit</span>
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="pwd">Password:</label>
      <div class="col-sm-10">          
        <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="pwd" required>
      </div>
    </div>
    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-10">
        <div class="checkbox">
          <label><input type="checkbox" name="remember"> Remember me</label>
        </div>
      </div>
    </div>
    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-10">
        <button type="submit" class="btn btn-default">Submit</button>
      </div>
    </div>
  </form>

</div>
</body>
</html>