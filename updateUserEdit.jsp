<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@ page import="java.sql.*" %>
    <%@ page import="databaseConnection.*" %>
    <%@include file="userMenu.jsp"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%



String user_role=request.getParameter("user_role");
System.out.print(user_role);

String user_loc=request.getParameter("user_loc");
System.out.print(user_loc);
String created_By=String.valueOf(session.getAttribute("empy_id"));

String user_status=request.getParameter("status");



String last_mod_by=request.getParameter("last_mod_by");
System.out.print(created_By);


System.out.print(created_By);
Connection dbconn=null;

PreparedStatement pst_2=null;
PreparedStatement pst_1=null;
ResultSet rs_1=null;
int rs_2=0;

String sql_2="";

DBConnection DBconn= new DBConnection();
dbconn= DBconn.getOracleConnction();


try{
	

			sql="select distict status from user_master where status=?";
			
					pst_1=dbconn.prepareStatement(sql);
					pst_1.setString(1,user_status);
					
					rs_1 = pst_1.executeQuery();
					if(rs_1.next())
					{
						String status=rs_1.getString("status");
						if(status.equals("A"))
						{
							
						}
						else
						{
							sql_2="update user_master set user_role= ?,user_loc=?, LASTMODIFIED_BY=? ";
							pst_2=dbconn.prepareStatement(sql_2);
							pst_2.setString(1,user_role);
							pst_2.setString(2,user_loc);
							pst_2.setString(3,empy_id);
							
							rs_2=pst_2.executeUpdate();
							if(rs_2>1)
							{
							%><script> alert("Update Successfuly");</script>	<% 
							}
						}
					}
			
			
}
catch(Exception e)
{
	e.printStackTrace();
	System.out.print("Error in sql insert value");
	
}

finally
{
	if(pst_1!=null)
		pst_1.close();
	if(dbconn!=null)
		dbconn.close();
	
}
response.sendRedirect("createUser.jsp");
			
%>



</body>
</html>