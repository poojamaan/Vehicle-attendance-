<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
     <%@page import="java.sql.*"%>
<%@page import="databaseConnection.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Delete Registered Vehicle Registration</title>
</head>
<body>
<%
String id=request.getParameter("id");
Connection conn=null;
String sql="";
PreparedStatement pst =null;
ResultSet rs=null;

DBConnection DBConn = new DBConnection();
conn = DBConn.getOracleConnction();
try{
		sql="DELETE FROM employee WHERE id = '"+id+"'";
		pst=conn.prepareStatement(sql);
		pst.executeUpdate();
		response.sendRedirect("manageRegVeh.jsp");
		
		
	}
catch(Exception e){
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
		
</body>
</html>