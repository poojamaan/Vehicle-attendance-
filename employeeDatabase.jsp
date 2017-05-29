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
	
        String EId	=		String.valueOf(request.getParameter("EId"));
		String EName	=		String.valueOf(request.getParameter("EName"));
		
		String email=		String.valueOf(request.getParameter("email"));
		
		String  CNum	=		String.valueOf(request.getParameter("CNum"));
		String LCode	=		String.valueOf(request.getParameter("LCode"));
		String addr=		String.valueOf(request.getParameter("addr"));
		String PCode	=		String.valueOf(request.getParameter("PCode"));
		String EState	=		String.valueOf(request.getParameter("EState"));
		String MStatus	=		String.valueOf(request.getParameter("MStatus"));
		String DOB	=		String.valueOf(request.getParameter("DOB"));
		String BPay	=		String.valueOf(request.getParameter("BPay"));
		
		//System.out.println(vis_name+" "+veh_type+" "+ veh_categ +" " +veh_no+" "+vis_comp+" "+meet_person+" "+purpose);

		
		
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
			
			sql_1 ="insert into emp_details(S_NO,EMP_ID,EMP_NAME,EMAIL_ID,CONTACT_NO,LOC_CODE,ADDRESS,PIN_CODE,EMP_STATE,DOB,MARITAL_STATUS,BASIC_PAY)values(ed_seq_no.nextval,?,?,?,?,?,?,?,?,?,?,?)";
			pst_1=conn.prepareStatement(sql_1);
			
			pst_1.setString(1,EId);
			pst_1.setString(2,EName);
			pst_1.setString(3,email);
			pst_1.setString(4,CNum);
			pst_1.setString(5,LCode);
			pst_1.setString(6,addr);
			pst_1.setString(7,PCode);
			pst_1.setString(8,EState);
			pst_1.setString(9,DOB);
			pst_1.setString(10,MStatus);	
				
			pst_1.setString(11,BPay);	
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
</body>
</html>