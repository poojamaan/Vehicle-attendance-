<%@page import="java.sql.*"%>
<%@page import="databaseConnection.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<!-- For data tables :: -->

<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css">

<!-- <script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/bootstrap.min.css">
 -->
<title>Manage Reg veh</title>


<script language="javascript">
function editRecord(id){
	alert("hii");
	alert(id);
    var f=document.form;
    f.method="post";
    //f.id.value=sno;
    f.action='editVisVeh.jsp?id='+id;
    f.submit();
}
function deleteRecord(id){
    var f=document.form;
    f.method="post";
    f.action='deleteRegVehReg.jsp?id='+id;
    f.submit();
}

function reprintRecord(id)
{
	var f=document.form;
	f.method="post";
	f.action='reprintQrcode.jsp?id='+id;
	f.submit();
	}
</script>
<script>

$(document).ready(function() {
    // Setup - add a text input to each footer cell
    $('#example tfoot th').each( function () {
        var title = $(this).text();
        $(this).html( '<input type="text" placeholder="Search '+title+'" />' );
    } );
 
    // DataTable
    var table = $('#example').DataTable();
 
    // Apply the search
    table.columns().every( function () {
        var that = this;
 
        $( 'input', this.footer() ).on( 'keyup change', function () {
            if ( that.search() !== this.value ) {
                that
                    .search( this.value )
                    .draw();
            }
        } );
    } );
} );

</script>
<style>
tfoot input {
        width: 100%;
        padding: 3px;
        box-sizing: border-box;
    }
</style>
</head>
<body>
	<form name="form">
		<!-- <table border=1 class="table table-striped"> -->
		<table  id="example" class="display" cellspacing="0" width="100%">
			<thead>
			<tr>
				<td>S_NO </td> 
				
			<td>VISITOR NAME</td>
			<td>VISITOR COMPANY</td>
			<td>VEHICLE NUMBER</td>
			<td>VEHICLE CATEGORY</td>
			<td>CONTACT PERSON</td>
			<td>PURPOSE</td>
			<td>VALID UP</td>
			<td>LOCATION CODE</td>
			<td>EDIT</td>
			<td>DELETE</td>
			<td>REPRINT</td>
			</tr>
			</thead>
			<tfoot>
			<tr>
				<td>S_NO </td> 
			<td>VISITOR NAME</td>
			<td>VISITOR COMPANY</td>
			<td>VEHICLE NUMBER</td>
			<td>VEHICLE CATEGORY</td>
			<td>CONTACT PERSON</td>
			<td>PURPOSE</td>
			<td>VALID UP</td>
			<td>LOCATION CODE</td>
			<td>EDIT</td>
			<td>DELETE</td>
			<td>REPRINT</td>
	</tr>
			</tfoot>
			
			<tbody>
			
				<%
					Connection conn = null;
					String sql = "";
					PreparedStatement pst = null;
					ResultSet rs = null;

					DBConnection DBConn = new DBConnection();
					conn = DBConn.getOracleConnction();
					try {
						sql = "select * FROM visitors_vehicle";
						pst = conn.prepareStatement(sql);
						rs = pst.executeQuery();

						while (rs.next()) {
				%>
			<tr>
				<td><%=rs.getString("S_NO")%></td>
				<td><%=rs.getString("VISITOR_NAME")%></td>
				<td><%=rs.getString("VISITOR_COMPANY")%></td>
				<td><%=rs.getString("VEH_NUMBER")%></td>
				<td><%=rs.getString("VEH_CATEGORY")%></td>
				<td><%=rs.getString("CONTACT_PERSON")%></td>
				<td><%=rs.getString("PURPOSE")%></td>
				<td><%=rs.getString("VALID_UP")%></td>
				<td><%=rs.getString("LOC_CODE")%></td>

				<td><input type="button" value="EDIT" name="edit"
					onclick="editRecord(<%=rs.getString("S_NO")%>);">]</td>
				<td><input type="button" value="DELETE" name="delete"
					onclick="deleteRecord(<%=rs.getString("S_NO")%>);"></td++>
				<td><input type="button" value="REPRINT" name="reprint"
					onclick="reprintRecord(<%=rs.getString("VEH_NUMBER")%>);"></td>
			</tr>
			<%
				}
				} catch (Exception e) {
					e.printStackTrace();
				}

				finally {
					if (rs != null) {
						rs.close();
					}
					if (pst != null) {
						pst.close();
					}
					if (conn != null) {
						conn.close();
					}
				}
			%>



			</tbody>
		</table>
	</form>
</body>
</html>