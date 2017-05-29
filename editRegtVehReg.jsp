<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@page import="java.sql.*"%>
<%@page import="databaseConnection.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
 <link rel="stylesheet"  href="css/bootstrap.min.css">
 
<title>Edit Registered Vehicle Registration</title>
</head>
<body>
<form action="registeredDatabase.jsp">

<table border=1 class="table table-striped">
<th>
	<!-- <td>S_NO </td> -->
	<td>USER NAME</td>
	<td> USER ID</td>
	<td>VEH TYPE</td>
	<td>VEH CATEGORY</td>
	<td>USER COMPANY</td>
	<td>VEH NUMBER</td>

	
</th>

<tr>

<% 
String id=request.getParameter("id");
Connection conn=null;
String sql="";
PreparedStatement pst =null;
ResultSet rs=null;

DBConnection DBConn = new DBConnection();
conn = DBConn.getOracleConnction();
try{
		sql="select * FROM REGISTERED_VEHICLE where s_no=?";
		
		pst=conn.prepareStatement(sql);
		pst.setString(1,id);
		rs=pst.executeQuery();
		
		while(rs.next())
		{
%>

	<td><input type="text" name="sno" value="<%= rs.getString("s_no") %>"></td>
	<td><input type="text" name="user_name" value="<%= rs.getString("user_name") %>"  readonly></td>
	<td><input type="text" name="user_id" readonly value="><%= rs.getString("user_id")  %>"></td>
	<td><input type="text" name="veh_type" value="<%= rs.getString("veh_type") %>"></td>
	<td><input type="text" name="veh_categ" value="<%= rs.getString("veh_category") %>"></td>
	<td><input type="text" name="user_company" value="<%= rs.getString("user_company") %>"></td>
	<td><input type="text" name="veh_no" value="<%= rs.getString("veh_no") %>"></td>

	</tr>
	<%
	}
}catch(Exception e){
	e.printStackTrace();
}
	
finally
{
	if (rs != null) {
		rs.close();
	}
	if (pst!= null) {
		pst.close();
	}if (conn != null) {
		conn.close();
	}
}
	%>
	
	
	
</tr>
<button name="submit">Submit</button>
</table>
</form>
</body>
</html>