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
		
			
		sql_1 ="insert into registered_vehicle (rv_seq_sno,user_id,veh_type,veh_category,user_company,veh_no) values(seq_no.NEXTVAL,?,?,?,?,?)";
			 pst_1 = DBconn.prepareStatement(sql_1);
			 System.out.println("2");
				pst_1.setString(1,user_id);
			
			pst_1.setString(2,veh_type);
			pst_1.setString(3,veh_categ);
			
			pst_1.setString(4,user_company);
			pst_1.setString(5,veh_no);
			int i=pst_1.executeUpdate();
			if(i>0){
				System.out.println("4");
				
			}	
			

		}
		catch(SQLException e){
			e.printStackTrace();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			if (rs_1 != null) {
				rs_1.close();
			}
			if (pst_1 != null) {
				pst_1.close();
			}
			if (DBconn != null) {
				DBconn.close();
			}
		} 
		
		

		 response.sendRedirect("generatecode.jsp"); 
		 
		 
		 
	
		}
	%>
</body>
</html>