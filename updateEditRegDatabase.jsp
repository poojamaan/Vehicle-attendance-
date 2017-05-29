<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
       <%@ page import="databaseConnection.DBConnection"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%

	String submit=request.getParameter("submit");
System.out.println(submit);
	if(submit!=null)
		{ 
		String user_id=request.getParameter("user_id");
		
		String veh_type=request.getParameter("veh_type");
		
		String veh_categ=String.valueOf(request.getParameter("veh_categ"));
		
		String  veh_no=String.valueOf(request.getParameter("veh_no"));
		
		String user_company=String.valueOf(request.getParameter("user_company"));
	
		System.out.println(user_id+" "+veh_type);
		session.setAttribute("user_id", user_id);
		session.setAttribute("veh_no",veh_no);
		

		System.out.println(user_id+" "+veh_type+" "+veh_no);

	
		Connection DBconn=null;
		
		PreparedStatement pstmt=null;
		ResultSet rsmt=null;
		PreparedStatement pst_1=null;
		String sql_1="";
		String sqlmt="";
		ResultSet rs_1=null;
		try{
			
			System.out.println("1");
			
			DBConnection dbconn=new DBConnection();
			DBconn=dbconn.getOracleConnction();
		
			
		sql_1 ="update registered_vehicle set ";
			 pst_1 = DBconn.prepareStatement(sql_1);
			 
		}
		catch(SQLException e)
		{
			out.println("no row inserted in vehicle type");
			e.printStackTrace();
		}
		
		catch(Exception e)
		{
			out.print("\n no row is inserted in vehicle table ");
		}
		
		finally
		{
			if(pst_1!=null)
			pst_1.close();
			
			if(DBconn!=null)
				DBconn.close();
				
		}


		}	 %>
			 
</body>
</html>