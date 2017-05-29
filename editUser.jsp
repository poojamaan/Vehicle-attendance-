<%@ page language="java" contentType="text/html; chars_1et=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@include file="userMenu.jsp"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/bootstrap.min.css">
<meta http-equiv="Content-Type" content="text/html; chars_1et=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<form action="updateUserEdit.jsp" method="post">
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

			<tr>

				<%
				
				
					Connection dbconn = null;
					String sql_1 = "";
					PreparedStatement pst_1 = null;
					ResultSet rs_1 = null;

					DBConnection DBconn = new DBConnection();
					dbconn = DBconn.getOracleConnction();
					try {
						sql_1= "select * FROM user_master";
						pst_1 = dbconn.prepareStatement(sql_1);
						rs_1 = pst_1.executeQuery();

						while (rs_1.next()) {
				%>
				<td><input type="text" name="sno"
					value="<%=rs_1.getString("S_NO")%>" readonly></td>
				<td><input type="text" name="user_id"
					value="<%=rs_1.getString("user_id")%>" readonly ></td>
					
					<% 
					String sql_1_role="";
					PreparedStatement pst_1_role=null;
					ResultSet rs_1_role=null;
					try
					{
					sql_1_role="SELECT ra.role_id from role_master rm , role_access ra where rm.parent_id=ra.parent_id and rm.role_name=?";
					
					pst_1_role=dbconn.prepareStatement(sql_1_role);
					pst_1_role.setString(1,empy_role);
					rs_1_role=pst_1_role.executeQuery();
					System.out.println("1");
					%>
				
					
					<select name="user_role" id="user_role" required >
					
					<% 
					while(rs_1_role.next())
					{
					%>	
					<option> <% out.print(rs_1_role.getString(1)); %></option>
					
					
					<%
					}
					}
					catch(Exception e)
					{
						e.printStackTrace();
					}
					finally
					{
						if(pst_1_role!=null)
						{
							pst_1_role.close();
							
						}
					
					}
					
					
					%>
					
					</select>
					
					
				<%-- <td><input type="text" name="user_role"
					value="<%=rs_1.getString("USER_ROLE")%>"></td>
					
					
					
				 <td><select name="roles" required area-required="true">
						<option value="A"
							<%=rs_1.getString("USER_ROLE").equals("A") ? "selected" : ""%>>
							A</option>
						<option value="IA"
							<%=rs_1.getString("USER_ROLE").equals("IA") ? "selected" : ""%>>IA</option>
							<option value="IA"
							<%=rs_1.getString("USER_ROLE").equals("IA") ? "selected" : ""%>>IA</option>
						
				</select></td>  --%>
				
				<td><input type="text" name="status" value="<%= rs_1.getString("STATUS") %>"></td>


				<td><input type="text" name="active_date"
					value="<%=rs_1.getString("ACTIVE_DATE")%>" readonly></td>
				<td><input type="text" name="inactive_date"
					value="<%=rs_1.getString("INACTIVE_DATE")%>" readonly></td>
				<td><input type="text" name="created_by"
					value="<%=rs_1.getString("CREATED_BY")%>" readonly></td>
				<td><input type="text" name="last_mod_by"
					value="<%=rs_1.getString("LASTMODIFIED_BY")%>" readonly></td>
				<td><input type="text" name="user_loc"
					value="<%=rs_1.getString("USER_LOC")%>"></td>

				<td>
					<button>Update</button>
			</tr>
			<%
				}
				} catch (Exception e) {
					e.printStackTrace();
				}

				finally {
					if (rs_1 != null) {
						rs_1.close();
					}
					if (pst_1 != null) {
						pst_1.close();
					}
					if (dbconn != null) {
						dbconn.close();
					}
				}
			%>






		</table>
	</form>
</body>
</html>