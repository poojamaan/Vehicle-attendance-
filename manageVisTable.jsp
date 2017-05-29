<%@page import="java.sql.*"%>
<%@page import="databaseConnection.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
 <link rel="stylesheet"  href="css/bootstrap.min.css">
 
<title>Manage Reg veh</title>

 
 <script language="javascript">
function editRecord(id){
    var f=document.form;
    f.method="post";
    f.action='editRegVehReg.jsp?id='+id;
    f.submit();
}
function deleteRecord(id){
    var f=document.form;
    f.method="post";
    f.action='deleteRegVehReg.jsp?id='+id;
    f.submit();
}
</script>

</head>
<body>

<table border=1 class="table table-striped">
<th>
	<!-- <td>S_NO </td> -->
	<td>VISITOR NAME</td>
	<td> VISITOR COMPANY</td>
	<td>VEHICLE NUMBER</td>
	<td>VEHICLE CATEGORY</td>
	<td>CONTACT PERSON</td>
	<td>PURPOSE</td>
	<td>VALID UP</td>
	<td>LOCATION CODE</td>
	<td>EDIT </td>
	<td>DELETE</td>
	<td>REPRINT</td>
	
</th>

<tr>

<% 
Connection conn=null;
String sql="";
PreparedStatement pst =null;
ResultSet rs=null;

DBConnection DBConn = new DBConnection();
conn = DBConn.getOracleConnction();
try{
		sql="select * FROM visitors_vehicle";
		pst=conn.prepareStatement(sql);
		rs=pst.executeQuery();
		
		while(rs.next())
		{
%>
	<td><%= rs.getString("S_NO") %></td>
	<td><%= rs.getString("VISITOR_NAME") %></td>
	<td><%= rs.getString("VISITOR_COMPANY") %></td>
	<td><%= rs.getString("VEH_NUMBER") %></td>
	<td><%= rs.getString("VEH_CATEGORY") %></td>
	<td><%= rs.getString("CONTACT_PERSON") %></td>
	<td><%= rs.getString("PURPOSE") %></td>
		<td><%= rs.getString("VALID_UP") %></td>
			<td><%= rs.getString("LOC_CODE") %></td>
			
	<td><button name="edit"  "onclick="editRecord(<%=rs.getString(1)%>);">EDIT</button></td>
	<td><button name="delete"  "onclick="editRecord(<%=rs.getString(1)%>);">DELETE</button></td>
	<td><button>REPRINT</button></td>
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
</table>
</body>
</html>