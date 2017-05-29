
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page import="java.sql.*"%>
<%@page import="databaseConnection.DBConnection"%>

<%@ page import="java.util.*"%>

<%@ page import="java.util.regex.Pattern"%>
<%@ page import="java.util.regex.Matcher"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		int user_id = Integer.valueOf(request.getParameter("emp_id"));//user id from login.jsp
		String password = request.getParameter("pwd"); 					// password from login form 
		System.out.println(user_id + " " + password);
		Connection conn = null;
		PreparedStatement pst = null;
		PreparedStatement pst_1 = null;
		PreparedStatement pst_2 = null;
		ResultSet rs = null;
		ResultSet rs_1 = null;
		ResultSet rs_2 = null;

		//for security 
		String sql_2 = "";
		int usr_id = 0;
		String usr_pass = "";
		String usr_name = "";
		String usr_role = "";
		String usr_loc = "";
		String usr_status = "";

		String sql_0 = "";
		int emp_id = 0;
		String emp_password = "";
		String emp_name = "";
		String emp_role = "";
		String emp_loc = "";

		String sql_1 = "";
		String empy_status = "";
		String empy_zonal_code = "";
		int empy_id = 0;
		String empy_password = "";
		String empy_name = "";
		String empy_role = "";
		String empy_loc="";

// Choose which role redirect from one page to another 

// It is only for ADMIN and SUPERVISOR redirect

		try {

			if (Pattern.matches("[3]{1}[0-9]{6}[0]{1}", String.valueOf(user_id))) {
				System.out.println("1");
				DBConnection DBConn = new DBConnection();
				conn = DBConn.getOracleConnction();

				sql_1 = "select user_master.user_id,ads.emp_password,user_master.user_role,user_master.user_loc";
				sql_1+=",user_master.status,emp_details.emp_name from user_master, ads,emp_details ";
				sql_1+="where emp_details.emp_id=ads.emp_id and	user_master.user_id=ads.emp_id and ads.emp_id= ? and ads.emp_password=? ";
				

				
				pst_1 = conn.prepareStatement(sql_1);
				pst_1.setString(1, String.valueOf(user_id));
				pst_1.setString(2, password);
				
				
			

				rs_1 = pst_1.executeQuery();
			
				
				if (rs_1.next()) {

					
					empy_id = rs_1.getInt("user_id");

				
					
					empy_loc = rs_1.getString("user_loc");
					empy_password = rs_1.getString("emp_password");
					
				
					
					empy_role = rs_1.getString("user_role");
					empy_name=rs_1.getString("emp_name");
					empy_status = rs_1.getString("status").trim();
					
				}
				
				session.setAttribute("empy_loc", empy_loc);
				session.setAttribute("empy_id", empy_id);
				session.setAttribute("empy_role", empy_role);
				session.setAttribute("empy_name", empy_name);
				
				System.out.println("user_id---" + user_id + "---empy_id--" + empy_id + "---password---" + password
						+ "--empy_password--" + empy_password + "--empy_status--" + empy_status);

				if ((user_id == empy_id) && (password.equals(empy_password))) {
					System.out.println("\nYour ghffdd");

					if (empy_status.equals("A")) {
						System.out.println("\nYour authentication is valid");
						if (empy_role.equals("Supervisor")) {
							response.sendRedirect("userMenu.jsp");
						} else if (empy_role.equals("Admin")) {
							response.sendRedirect("userMenu.jsp");
						}
					}
				}
			} 
			
			// Selection for Security Officer and Security Guard
			
			else {
				System.out.println("5");
				
				DBConnection DBConn = new DBConnection();
				conn = DBConn.getOracleConnction();

				sql_2 = "select sd.sec_id,sd.sec_name,sd.sec_password,um.user_loc ,um.user_role,um.status,um.created_by from security_details sd,user_master um where sd.sec_id=um.user_id and um.user_id=? and sd.sec_password=?";
				System.out.println("6");
				pst_2 = conn.prepareStatement(sql_2);
				
				System.out.println(user_id);
				pst_2.setInt(1, user_id);
				System.out.println(user_id);
				pst_2.setString(2, password);
				System.out.println(password);
				rs_2 = pst_2.executeQuery();
				System.out.println("7");
				if (rs_2.next()) {
				
					usr_id = rs_2.getInt("sec_id");

					System.out.println("9");
					usr_pass = rs_2.getString("sec_password");
					System.out.println("10");
					usr_role = rs_2.getString("user_role");
					System.out.println(usr_role);
					usr_name = rs_2.getString("sec_name");
					System.out.println(usr_name);
					usr_loc = rs_2.getString("user_loc");
					
					usr_status = rs_2.getString("status");
					System.out.println("11");
				}
				System.out.println("12");
				session.setAttribute("empy_id", usr_id);
				System.out.println(usr_id);
				session.setAttribute("empy_loc", usr_loc);
				session.setAttribute("empy_name", usr_name);
				session.setAttribute("empy_role", usr_role);
				session.setAttribute("empy_id", usr_id);
				System.out.println(usr_role);
					
				if (user_id == usr_id && password.equals(usr_pass))

				{
					System.out.println(usr_status);

					if (!usr_status.equals("A")) {
						System.out.println("\nYour authentication is valid");
						if (empy_role.equals("SO")) {
							response.sendRedirect("userMenu.jsp");
						} else if (empy_role.equals("SEC")) {
							response.sendRedirect("userMenu.jsp");
						}
					}
				}
			}

			
		} catch (SQLException e) {
			out.println("No details found for this User. Please Login with valid details.");
			e.printStackTrace();
		} catch (Exception e) {
			out.println("No details found for this User. Please Login with valid details.");
			e.printStackTrace();
		} finally {
			try {
				// it is for close all connection :)
				if (rs_1 != null) {
					rs_1.close();
				}
				if (pst_1 != null) {
					pst_1.close();
				}

				if (rs_2 != null) {
					rs_2.close();
				}
				if (pst_2 != null) {
					pst_2.close();
				}

				if (conn != null) {
					conn.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}

		}
	%>

</body>
</html>





