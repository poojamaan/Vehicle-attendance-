<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@ page import="java.sql.*" %>
    <%@ page import="databaseConnection.*" %>
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
String user_id = request.getParameter("user_id");
System.out.print(user_id);
String user_loc=request.getParameter("user_loc");
System.out.print(user_loc);
String created_By=String.valueOf(session.getAttribute("empy_id"));


System.out.print(created_By);


System.out.print(created_By);
Connection conn=null;

PreparedStatement pst_2=null;
PreparedStatement pst_1=null;
ResultSet rs_1=null;
ResultSet rs_2=null;
String sql="";

DBConnection DBconn= new DBConnection();
conn= DBconn.getOracleConnction();


try{
	

			sql="insert into user_master (user_sno,user_id,user_role,status,active_date,created_by,user_loc) values (um_seq_no.nextval,?,?,'A',sysdate,?,?)";
			
					pst_1=conn.prepareStatement(sql);
					pst_1.setString(1,user_id);
					pst_1.setString(2,user_role);
					pst_1.setString(3,created_By);
					pst_1.setString(4,user_loc);
					
					
					rs_1 = pst_1.executeQuery();
			
			
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
	if(conn!=null)
		conn.close();
	
}
response.sendRedirect("createUser.jsp");
			
%>
<script> alert("Submit Successfully")</script>


</body>
</html>