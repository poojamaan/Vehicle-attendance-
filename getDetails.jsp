
<%@page import="databaseConnection.*" %>

<%@page import="java.sql.*" %>
<%-- <%@page import="org.json.JSONArray" %>
<%@page import="org.json.JSONObject" %>
<%@page import="org.json.JSONException" %> --%>
<%@page import="java.util.*" %>
<%@page import = "java.text.*" %>



<%-- 
    Document   : getDetails
    Created on : May 3, 2017, 2:19:41 PM
    Author     : Administrator
--%>


<% 
Connection conn=null;
String sql="";
PreparedStatement pst =null;
ResultSet rs=null;

String usr_name="";
String veh_num="";
PreparedStatement pst_visitor =null;


    
    try {
    	
    	
        String veh_number = request.getParameter("veh_number");
        
        String user_loc=String.valueOf(session.getAttribute("usr_loc"));
        System.out.println("1");
        int flag=Integer.valueOf( request.getParameter("flag"));
        flag=1;
        DBConnection DBConn = new DBConnection();
        conn = DBConn.getOracleConnction();
        int i=0 ;
        
        
       
        if(flag ==0)
        {
        String get_visitorData = "insert into reg_veh_attendance(s_no,in_date_time, vehicle_reg_sno ,veh_loc) values(rva_seq_no.nextval, sysdate, ( select s_no from registered_vehicle where veh_no = ? ) ,?)";
        
        //System.out.println(get_visitorData);
       //System.out.println(conn);
       
        pst_visitor = conn.prepareStatement(get_visitorData);
      
        pst_visitor.setString(1, veh_number);
        pst_visitor.setString(2, user_loc);
        
        //System.out.println(conn);
        
         i = pst_visitor.executeUpdate();
         
        
         
        }
        
        else 
        	
        {
        	
        	  sql = "update REG_VEH_ATTENDANCE set OUT_DATE_TIME = sysdate where S_NO = (select max(s_no) from REG_VEH_ATTENDANCE where vehicle_reg_sno = (select s_no from REGISTERED_VEHICLE where veh_no =?))";
        	 pst= conn.prepareStatement(sql);
        	 System.out.println(sql);
             pst.setString(1, veh_number);
            
             
             
             
             System.out.println(conn);
             System.out.println(veh_number);
             System.out.println(i);
              i = pst.executeUpdate();
             System.out.println(i);
             
        }
        
        String data="";
        

        
        if(i>0){
			
			sql=" select user_name, veh_no from registered_vehicle where veh_no=? ";
			pst= conn.prepareStatement(sql);
			pst.setString(1,veh_number);
			rs=pst.executeQuery();
			
			if(rs.next())
			{
		         data=":"+rs.getString(1)+":"+ rs.getString(2);
		         
	        }
        }
        
        out.println(data);


			
            

%>

<%   } catch (Exception e) {
	
	e.printStackTrace();
        out.println(e.toString());
    }
finally
{
	if(pst_visitor !=null)
		conn.close();
    if(conn !=null)
        conn.close();
    
}
%>
