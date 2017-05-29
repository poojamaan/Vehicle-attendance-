<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page import="databaseConnection.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

 <% 
	if(session.isNew()==true || session.getAttribute("empy_id")==null)
	{
		response.sendRedirect(response.encodeRedirectUrl("login.jsp"));
	}

	response.setHeader("Cache-Control","no-cache,no-store,must-revalidate"); //HTTP 1.1
	response.setHeader("Pragma","no-cache");  //HTTP 1.0
	response.setDateHeader("Expires",0);
	String dealer_code =String.valueOf(session.getAttribute("empy_id"));
	String collection_Validation_flag="Y";
	
%> 
<html>
<head>

<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>USER MENU</title>

<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
 <link rel="stylesheet"  href="css/bootstrap.min.css">
  <link rel="stylesheet"  href="css/header.css">
   <style type="text/css">
  #left
 {
 height: 100px;
 width: 20%;
  background-image: url('images/Hindustan_Petroleum_Logo.svg');
   background-size: 150px 100px;
    background-repeat: no-repeat;
    float: left;
 }
 
 .jumbotron text-center
 {
 margin-top: 
 }</style>
</head>
<body>
<%


String empy_name = String.valueOf(session.getAttribute("empy_name"));
String empy_role = String.valueOf(session.getAttribute("empy_role"));
String empy_loc = String.valueOf(session.getAttribute("empy_loc"));
String empy_id=String.valueOf(session.getAttribute("empy_id"));

%>
<div class="container">
 <div  class="jumbotron text-center"> 
<div id="outer">
		<div id="left"></div>
		<div id="centers">
				<H2>HINDUSTAN PETROLEUM CORPORATION LIMITED</H2>
		</div>
		<div id="right">
		<button class="btn btn-danger navbar-btn" onlick="logout.jsp">LOGOUT</button>
		<BR>
		<span><%= empy_loc %></span>
		</div>
</div>


	<div id="welcome">
		<h2>WELCOME 
		<SPAN><%= empy_name %></SPAN></h2>
<div>


<%
	
	

		String role_id=String.valueOf(session.getAttribute("empy_role"));
	System.out.println(role_id);
	
		Connection conn = null;
		Connection conn_other = null;
	    PreparedStatement pst = null;
	    ResultSet rs = null;
	    String sql = "";
	    PreparedStatement pst_other = null;
	    ResultSet rs_other = null;
	    String sql_other = "";
	    List<String> menu_link = new ArrayList<String>();
	    //List<String> link_desc = new ArrayList<String>();
	    //select distinct menu_parent.parent_id,parent_name from menu_parent join menumaster on menu_parent.parent_id = menumaster.parent_id
                                  //join menuaccess ON menumaster.menu_id = menuaccess.menu_id where menuaccess.sg_access_flag='Y';

	    try{
	    	
    	DBConnection DBconn = new DBConnection();
        conn = DBconn.getOracleConnction();
        if(role_id.equals("Supervisor")){
        	sql="select distinct menu_parent.parent_id,parent_name from menu_parent join menumaster on ";
            sql+="menu_parent.parent_id = menumaster.parent_id join menuaccess on ";
            sql+="menumaster.menu_id = menuaccess.menu_id where menuaccess.sp_access_flag='Y'";
            }
            
        else if(role_id.equals("Admin")){
        	sql="select distinct menu_parent.parent_id,parent_name from menu_parent join menumaster on ";
            sql+="menu_parent.parent_id = menumaster.parent_id join menuaccess on ";
            sql+="menumaster.menu_id = menuaccess.menu_id where menuaccess.ad_access_flag='Y'";
            }
            
        else if(role_id.equals("SO")){
        	sql="select distinct menu_parent.parent_id,parent_name from menu_parent join menumaster on ";
            sql+="menu_parent.parent_id = menumaster.parent_id join menuaccess on ";
            sql+="menumaster.menu_id = menuaccess.menu_id where menuaccess.so_access_flag='Y'";
            }
            
        else if(role_id.equals("SEC")){
        	sql="select distinct menu_parent.parent_id,parent_name from menu_parent join menumaster on ";
            sql+="menu_parent.parent_id = menumaster.parent_id join menuaccess on ";
            sql+="menumaster.menu_id = menuaccess.menu_id where menuaccess.sg_access_flag='Y'";
            }
        
        %>
        
        
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
      <a class="navbar-brand" href="#"><%=empy_role %></a>
       </div>
       <div id="navbar" class="navbar-collapse collapse">
   
    
        <%
        pst=conn.prepareStatement(sql);
        rs=pst.executeQuery();
        	
        while(rs.next()){
        	%>
        	<ul class="nav navbar-nav navbar-right">
        	
        	<!--  <li class="active"><a href="#">Home</a></li> -->
        	  <li class="dropdown">
        	
        	
        	        	
        	
        	<a class="dropdown-toggle" data-toggle="dropdown" ><%= rs.getString("parent_name")%>
        	<span class="caret"></span></a> 
        	
        	<ul class="dropdown-menu"><%
        	String parent_id=rs.getString("parent_id");
        	try{
        		
            conn_other = DBconn.getOracleConnction();
            if(role_id.equals("Supervisor")){
            	
        	sql_other="select menumaster.menu_link from menumaster join menuaccess on";
        	sql_other+=" menumaster.menu_id=menuaccess.menu_id where sp_access_flag='Y' and parent_id=?";
            }
            
        else if(role_id.equals("Admin")){
        	
        	sql_other="select menumaster.menu_link from menumaster join menuaccess on";
        	sql_other+=" menumaster.menu_id=menuaccess.menu_id where ad_access_flag='Y' and parent_id=?";
            }
            
        else if(role_id.equals("SO")){
        	
        	sql_other="select menumaster.menu_link from menumaster join menuaccess on";
        	sql_other+=" menumaster.menu_id=menuaccess.menu_id where so_access_flag='Y' and parent_id=?";
        }
            
        else if(role_id.equals("SEC")){
        	
        	sql_other="select menumaster.menu_link from menumaster join menuaccess on";
        	sql_other+=" menumaster.menu_id=menuaccess.menu_id where sg_access_flag='Y' and parent_id=?";
            }
            
        pst_other = conn_other.prepareStatement(sql_other);
        pst_other.setString(1, parent_id);
        rs_other = pst_other.executeQuery();
       // System.out.println("benten");
    	
        while (rs_other.next()) {
        
        	%><li><%= rs_other.getString(1)%></li><%
        			
       
        }
        %> </ul></li> <%
      
    		}
   		 catch(Exception e){
    		e.printStackTrace();
    		}
    		finally{
    		if(rs_other!=null){rs_other.close();}
    		if(pst_other!=null){pst_other.close();}
    		if(conn_other!=null){conn_other.close();}
    		%></ul>
    		<%}
    }
  }catch(Exception e){
	  e.printStackTrace();
	  }
    finally{
    	if(rs!=null){rs.close();}
    	if(pst!=null){pst.close();}
    	if(conn!=null){conn.close();}
    }
    %>
    
    </div>
    </nav>

    </div>
    <div>
    		
    </div>
  
  </div>
  </div>
  </div>
</body>
</html>