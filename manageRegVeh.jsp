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

<title>Manage Reg veh</title>
</head>
<body>
<form>
<table border=1 class="table table-striped">
<th>
	<!-- <td>S_NO </td> -->
	<td>USER NAME</td>
	<td> USER ID</td>
	<td>VEH TYPE</td>
	<td>VEH CATEGORY</td>
	<td>USER COMPANY</td>
	<td>VEH NUMBER</td>
	<td>EDIT </td>
	<td>DELETE</td>
	<TD>REPRINT</TD>
	
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
		sql="select * FROM REGISTERED_VEHICLE";
		pst=conn.prepareStatement(sql);
		rs=pst.executeQuery();
		
		while(rs.next())
		{
%>

	<td><%= rs.getString("rv_seq_sno") %></td>
	<td><%= rs.getString("user_name") %></td>
	<td><%= rs.getString("user_id") %></td>
	<td><%= rs.getString("veh_type") %></td>
	<td><%= rs.getString("veh_category") %></td>
	<td><%= rs.getString("user_company") %></td>
	<td><%= rs.getString("veh_no") %></td>
	<td><button  name="edit"  "onclick="editRecord(<%=rs.getString(1)%>);">EDIT</button></td>
	<td><button   name="delete" "onclick="deleteRecord(<%=rs.getString(1)%>);">DELETE</button></td>
	<td><button>REPRINT</button>
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
</form>
</body>
</html>