<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@page import="java.sql.*"%>
<%@page import="databaseConnection.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form>
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
		sql="select * FROM visitors_vehicle where s_no=?";
		
		pst=conn.prepareStatement(sql);
		pst.setString(1,id);
		rs=pst.executeQuery();
		
		while(rs.next())
		{
%>
	<td><input type="text" name="sno" value="<%= rs.getString("S_NO") %>" readonly></td>
	<td><input type="text" name="vis_name" value="<%= rs.getString("VISITOR_NAME") %>"></td>
	<td><input type="text" name="vis_company" value="<%= rs.getString("VISITOR_COMPANY") %>"></td>
	<td><input type="text" name="vis_num" value="<%= rs.getString("VEH_NUMBER") %>"></td>
	<td><input type="text" name="vis_categ" value="<%= rs.getString("VEH_CATEGORY") %>"></td>
	<td><input type="text" name="vis_meet" value="<%= rs.getString("CONTACT_PERSON") %>"></td>
	<td><input type="text" name="vis_purpose" value="<%= rs.getString("PURPOSE") %>"></td>
		<td><input type="text" name="vis_valid" value="<%= rs.getString("VALID_UP") %>"></td>
			<td><input type="text" name="vis_loc" value="<%= rs.getString("LOC_CODE") %>"></td>
	
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