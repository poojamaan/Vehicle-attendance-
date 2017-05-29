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

String empy_loc=String.valueOf(session.getAttribute("empy_loc"));

//String submit=request.getParameter("submit");
	
	

 
	// should i give duration ??
	
        String vis_name	=		String.valueOf(request.getParameter("vis_name"));
		String veh_type	=		String.valueOf(request.getParameter("veh_type"));
		
		String veh_categ=		String.valueOf(request.getParameter("veh_category"));
		
		String  veh_no	=		String.valueOf(request.getParameter("vis_veh_no"));
		String vis_comp	=		String.valueOf(request.getParameter("vis_company"));
		String meet_person=		String.valueOf(request.getParameter("meet_person"));
		String purpose	=		String.valueOf(request.getParameter("purpose"));
		String valid	=		String.valueOf(request.getParameter("valid"));
		
		System.out.println(vis_name+" "+veh_type+" "+ veh_categ +" " +veh_no+" "+vis_comp+" "+meet_person+" "+purpose);

		
		
		Connection conn=null;
		PreparedStatement pst_1=null;
		ResultSet rs_1=null;
		String sql_1="";
		
		try{
			System.out.println("1");
			
			DBConnection dbconn=new DBConnection();
			conn=dbconn.getOracleConnction();
			System.out.println("2");
		
			// here we write those varaible which is coming from form..
			
			sql_1 ="insert into visitors_vehicle(s_no, visitor_name, visitor_company, veh_number, veh_type, veh_category ,contact_person, purpose, valid_up,LOC_CODE) values(vv_seq_no.nextval,?,?,?,?,?,?,?,sysdate,?)";
			pst_1=conn.prepareStatement(sql_1);
			
			pst_1.setString(1,vis_name);
			pst_1.setString(2,vis_comp);
			pst_1.setString(3,veh_no);
			pst_1.setString(4,veh_type);
			pst_1.setString(5,veh_categ);
			pst_1.setString(6,meet_person);
			pst_1.setString(7,purpose);
			pst_1.setString(8,valid);	
			pst_1.setString(9,empy_loc);	
			
			rs_1=pst_1.executeQuery();

			
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
			
			if(conn!=null)
				conn.close();
				
		}

%>
<script type="text/javascript">
alert("Added Successfully")</script>
</body>
</html>