<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@include file="userMenu.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

 <script type="text/javascript">
function checkLocation()
{
	var loc_code= document.getElementById("user_id").value;
	
}



</script> 
</head>
<body>


<%
Connection DBconn=null;
				PreparedStatement pst_1=null;
				ResultSet rs_1=null;
				PreparedStatement pst_role=null;
				ResultSet rs_role=null;
				String sql_1="";
				String sql_role="";
				
				DBConnection db= new DBConnection();
				DBconn = db.getOracleConnction();
				
			String usr_role="";
			String usr_loc="";
				
			%>
			
				
			
				
					
					
				<form  class="form-horizontal" name="fName" method="post" action="CreateDatabase.jsp" id="fName" data-toggle="validation" role="form">
				
				<table class="table table-striped" >
				
				
					<td>
					<label class="control-label col-sm-2"> Role</label>
					</td>
					<td>
					<% 
					try
					{
					sql_role="SELECT ra.role_id from role_master rm , role_access ra where rm.parent_id=ra.parent_id and rm.role_name=?";
					
					pst_role=DBconn.prepareStatement(sql_role);
					pst_role.setString(1,empy_role);
					rs_role=pst_role.executeQuery();
					System.out.println("1");
					%>
				
					
					<select name="user_role" id="user_role" required >
					
					<% 
					while(rs_role.next())
					{
						
					%>	
					<option> <% out.print(rs_role.getString(1)); %></option>
					
					
					<%
					usr_role=rs_role.getString("role_id");
					}
					}
					catch(Exception e)
					{
						e.printStackTrace();
					}
					finally
					{
						if(pst_role!=null)
						{
							pst_role.close();
							
						}
					
					}
					
					
					%>
					
					</select>
					
					</td>
					<td> <p id="msg3"></p> </td>
					</tr>
					</div>
				<tr>
					<td>
					<label class="control-label col-sm-2"> Location</label>
					</td>
					<td>
					<% 
					try
					{
					sql_1="select loc_name from user_location ";
					pst_1=DBconn.prepareStatement(sql_1);
					rs_1=pst_1.executeQuery();
					System.out.println("1");
					%>
				
					
					<select id="user_loc" name="user_loc" required >
					
					<% 
					while(rs_1.next())
					{
					%>	
					<option > <% out.print(rs_1.getString(1)); %></option>
					
					
					<%
					usr_loc=rs_1.getString("loc_name");
					}
					}
					catch(Exception e)
					{
						e.printStackTrace();
					}
					finally
					{
						if(pst_1!=null)
						{
							pst_1.close();
							
						}
						if(DBconn!=null)
						{
							DBconn.close();
						}
					}
					
					
					%>
					
					</select>
					
					</td>
					<td> <p id="msg4"></p> </td>
					</tr>
				
						<tr>
				<td>
				<label  class="control-label col-sm-2"> Emp_ID </label> 
				</td>
				<td>
				<%
				System.out.println(usr_role);
				System.out.println(usr_loc);
				if(usr_role.equals("SO") || usr_role.equals("SEC"))
				{
					try
					{
						
					//sql_1="SELECT substr(user_id,1, 5)  FROM user_master where user_role=? ";
					sql_1="select loc_id where loc_name=?";
					pst_1=DBconn.prepareStatement(sql_1);
					pst_1.setString(1, usr_loc);
					rs_1=pst_1.executeQuery();
					if(rs_1.next())
					{
						String loc_Code=rs_1.getString("loc_id");
					
					//if()
						System.out.println(loc_Code);
					%>
					<input type="text" name ="user_id" id ="user_id" required readonly >
				<%	out.print(rs_1.getString("loc_id"));
				%></input>
					
					<%
					}
					
					//out.println(empy_loc+"");
					}
					catch(Exception e)
					{
						
					}
				}
					else
					{
						%>
						
						<input type="text" name ="user_id" id ="user_id" required pattern="^[3][0-9]{6}[0]$" >
						
					<%
					}
				
				%>
					
					</td>
					<td> <p id="msg1"></p> </td>
					</tr>
				
			
					
					
				
					
					<tr>
					<td colspan=2 align="center">
					<button onclick="CreateDatabase.jsp" >Submit</button> </a>
					
					</td> 
					</table>
				</form>
				
</body>
</html>