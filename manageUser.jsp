<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="databaseConnection.*"%>
<%@include file="userMenu.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/bootstrap.min.css">


<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Manage User</title>

<script language="javascript">
function editRecord(id){
    var f=document.form;
    f.method="post";
    f.action='editUser.jsp?id='+id;
    f.submit();
}
function deleteRecord(id){
    var f=document.form;
    f.method="post";
    f.action='deleteUser.jsp?id='+id;
    f.submit();
}
</script>
</head>

<body>
<%
Connection dbconn = null;
String sql_1 = "";
String sql_2="";
PreparedStatement pst_1 = null;

ResultSet rs_1 = null;
PreparedStatement pst_2 = null;

ResultSet rs_2 = null;

DBConnection DBConn = new DBConnection();
conn = DBConn.getOracleConnction();

try{
	
	if(empy_role.equals("Admin"))
	{
	sql_2="select * from user_master where user_role IN ('Admin','SO','SEC')";
	pst_2=dbconn.prepareStatement(sql_2);
	
	rs_2=pst_2.executeQuery();
	
	}
}
catch(Exception e)
{
	
}
%>


	<form>
		<table border=1 class="table table-striped">
			<td>USER_SNO</td>
			<td>USER_ID</td>
			<td>USER_ROLE</td>
			<td>STATUS</td>
			<td>ACTIVE_DATE</td>
			<td>INACTIVE_DATE</td>
			<td>CREATED_BY</td>
			<td>LASTMODIFIED_BY</td>
			<td>USER_LOC</td>
			<td>EDIT</td>
			<td>DELETE</td>
			<tr>

				<%
				try {
					if(empy_role.equals("Admin"))
					{
						
					
						sql_1 = "select * from user_master where user_role IN ('Admin','SO','SEC')";
						pst_1 = dbconn.prepareStatement(sql_1);
						rs_1 = pst_1.executeQuery();
					}
						else
							if(empy_role.equals("Supervisior"))
							{
								
							
								sql_1 = "select * from user_master where user_role IN ('Supervisor''Admin','SO','SEC')";
								pst_1 = dbconn.prepareStatement(sql_1);
								rs_1 = pst_1.executeQuery();
						
							}
							else 
								
								{
									
								
									sql_1 = "select * from user_master where user_role IN ('SO','SEC')";
									pst_1 = dbconn.prepareStatement(sql_1);
									rs_1 = pst_1.executeQuery();

								}
							
						while (rs_1.next()) {
				%>
				<td><%=rs_1.getString("S_NO")%></td>
				<td><%=rs_1.getString("user_id")%></td>
				<td><%=rs_1.getString("USER_ROLE")%></td>
				<td><%=rs_1.getString("STATUS")%></td>
				<td><%=rs_1.getString("ACTIVE_DATE")%></td>
				<td><%=rs_1.getString("INACTIVE_DATE")%></td>
				<td><%=rs_1.getString("CREATED_BY")%></td>
				<td><%=rs_1.getString("LASTMODIFIED_BY")%></td>
				<td><%=rs_1.getString("USER_LOC")%></td>

				<td><button name="edit"
						onclick="editRecord(<%=rs_1.getString(1)%>);">EDIT</button></td>
				<td><button name="delete"
						onclick="editRecord(<%=rs_1.getString(1)%>);">DELETE</button></td>

			</tr>
			}
			
			
			<%
				}
				} catch (Exception e) {
					e.printStackTrace();
				}

				finally {
					if (rs_1!= null) {
						rs_1.close();
					}
					if (pst_1 != null) {
						pst_1.close();
					}
					if (conn != null) {
						dbconn.close();
					}
				}
			%>



			</tr>



		</table>
	</form>
</body>
</html>