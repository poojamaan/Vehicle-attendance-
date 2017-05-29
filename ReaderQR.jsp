<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page import="java.sql.*"%>
<%@ page import="databaseConnection.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="icon" type="images/png" href="favicon.png">

<!-- this is for camera  -->
<link rel="stylesheet" href="css/style.css">
<script type="text/javascript" src="js/instascan.min.js"></script>


<script type="text/javascript" src="js/adapter.min.js"></script>
<script type="text/javascript" src="js/vue.min.js"></script> 
 <script type="text/javascript" src="js/jquery-3.2.1.min.js"></script> 
<script>
    function capture()
    {
    	alert(document.getElementById('veh_number').innerHTML);
    }
    </script>

<script type="text/javascript">
function getVehnum(Fname)
{
	//var xmlhttp = new XmlHttpRequest();
   
	var veh_number=document.getElementById("veh_number").innerHTML;
	
    if (Fname != "-1")
    {
        xmlHttp = GetXmlHttpObject();
        if (xmlHttp == null)
        {
            alert("Browser does not support HTTP Request");
            return;
        }

        var url = "getDetails.jsp";
        var flag=0;
        url = url + "?veh_number=" +veh_number+"&flag="+flag;
        xmlHttp.onreadystatechange = stateChangeTest;
        xmlHttp.open("GET", url, true);
        xmlHttp.send(null);

    }
    else
    {
        alert("Please Select test");
    }
    //secondLvlEmpName

}

function stateChangeTest()
{

   alert("statechange"+xmlHttp.readyState);

    if (xmlHttp.readyState == 4 || xmlHttp.readyState == "complete")
    {


        var showdata = xmlHttp.responseText;
        alert(showdata);
        var strar = showdata.split(":");

        if (strar.length == 1)
        {

            alert("Not valid Test Code");


            document.getElementById("usr_name") = '';
            document.getElementById("veh_num") = '';
          


        }
        else if (strar.length > 1)
        {

        	document.getElementById("usr_name").value = strar[1];
            document.getElementById("veh_num").value = strar[2];

        }

    }
}


function GetXmlHttpObject()
{
    var xmlHttp = null;
    try
    {
        // Firefox, Opera 8.0+, Safari
        xmlHttp = new XMLHttpRequest();
        alert("crome"+xmlHttp);
    }
    catch (e)
    {
        //Internet Explorer
        try
        {
            xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
            alert("ie"+xmlHttp);
        }
        catch (e)
        {
            xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
            alert("catch ie"+xmlHttp);
        }
    }
    return xmlHttp;
}


function getVehout(Fname)
{
	var veh_number=document.getElementById("veh_number").innerHTML;
	
	alert(veh_number);
    if (Fname != "-1")
    {
        xmlHttp = GetXmlHttpObject();
        if (xmlHttp == null)
        {
            alert("Browser does not support HTTP Request");
            return;
        }
        alert("hi i am in out "+xmlHttp );
        var url = "getDetails.jsp";
        var flag=1;
        url = url + "?veh_number=" +veh_number+"&flag="+flag;
        alert(url);
        xmlHttp.onreadystatechange = stateChangeTest;
        xmlHttp.open("GET", url, true);
        xmlHttp.send(null);

    }
    else
    {
        alert("Please Select test");
    }
	}
    
    </script>
<style>
#validQR {
	
}
</style>
<title>Insert title here</title>
</head>
<body>


	<div id="app">
		<div class="sidebar">
			<section class="cameras">
			<h2>Cameras</h2>
			<ul>
				<li v-if="cameras.length === 0" class="empty">No cameras found</li>
				<li v-for="camera in cameras"><span
					v-if="camera.id == activeCameraId" :title="formatName(camera.name)"
					class="active">{{ formatName(camera.name) }}</span> <span
					v-if="camera.id != activeCameraId" :title="formatName(camera.name)">
						<a @click.stop="selectCamera(camera)">{{
							formatName(camera.name) }}</a>
				</span></li>
			</ul>
			</section>
			
				<section class="scans">
				<h2>Scans</h2>
				<ul v-if="scans.length === 0">
					<li class="empty">No scans yet</li>
				</ul>
				<transition-group name="scans" tag="ul">
				
				<li v-for="scan in scans" name="veh_number" id="veh_number"
				
					:key="scan.date" :title="scan.content">{{ scan.content }}</li>
					
				</transition-group> </section>
				<br>
				
				<form method="post" name="getDetails" action="getDetails.jsp">
				<input type="button" onclick="return getVehnum(getDetails);"
					id="validQR" value="in time"> 
					
					<br>
						<br>
					<input type="text" name="usr_name" id="usr_name" value="">
				<input type="text" name="veh_num"  id="veh_num" value="">
					
				


			</form>
		<!-- //second form for out time details ::	 -->
			
			<form name ="getOutDetails" method="get" action="getDetails.jsp" >
					<br>
					<input type="button" onclick="return getVehout(getOutDetails);"
					id="validQRcode" value="out time "> 
					
				<input type="text" name="usr_name" id="usr_name" value="">
				<input type="text" name="veh_num"  id="veh_num" value="">
			</form>
		
		</div>
		<div class="preview-container">
			<video id="preview"></video>
		</div>
	</div>
	<script type="text/javascript" src="js/app.js"></script>




</body>
</html>
>
