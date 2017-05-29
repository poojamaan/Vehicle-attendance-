<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*"%>
<%@page import="databaseConnection.*" %>
 <%@include file="userMenu.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String vis_name	=		String.valueOf(request.getParameter("vis_name"));
		String veh_type	=		String.valueOf(request.getParameter("veh_type"));
		
		String veh_categ=		String.valueOf(request.getParameter("veh_category"));
		
		String  veh_no	=		String.valueOf(request.getParameter("vis_veh_no"));
		String vis_comp	=		String.valueOf(request.getParameter("vis_company"));
		String meet_person=		String.valueOf(request.getParameter("meet_person"));
		String purpose	=		String.valueOf(request.getParameter("purpose"));
		String valid	=		String.valueOf(request.getParameter("valid"));
		
		System.out.println(vis_name+" "+veh_type+" "+ veh_categ +" " +veh_no+" "+vis_comp+" "+meet_person+" "+purpose);

		
		
		Connection dbconn=null;
		PreparedStatement pst_1=null;
		ResultSet rs_1=null;
		String sql_1="";
		
		try{
			System.out.println("1");
			
			DBConnection DBconn=new DBConnection();
			dbconn=DBconn.getOracleConnction();
			System.out.println("2");
		
			sql_1 ="update  visitors_vehicle set visitor_name =?, visitor_company =?, veh_number=?, veh_type=?, veh_category=?,contact_person=?, purpose=?, valid_up=?,LOC_CODE=?) ";
			pst_1=dbconn.prepareStatement(sql_1);
			pst_1.setString(1,vis_name);
			pst_1.setString(2,vis_comp);
			pst_1.setString(3,veh_no);
			pst_1.setString(4,veh_type);
			pst_1.setString(5,veh_categ);
			pst_1.setString(6,meet_person);
			pst_1.setString(7,valid);
			pst_1.setString(8,empy_loc);
			
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
			
			if(dbconn!=null)
				dbconn.close();
				
		}

%>
</body>
</html>