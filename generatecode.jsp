<%@page import="com.sun.net.httpserver.HttpContext"%>
<%@page import="com.sun.webkit.PageCache"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.google.zxing.WriterException"%>
<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%> --%>
    
 <%@ page import= "java.awt.Color"%>
<%@ page import=" java.awt.Graphics2D"%>
<%@ page  import=" java.awt.image.BufferedImage" %>

<%-- <%@ page package=" com.journaldev.qrcode.generator "%> --%>
<%@ page import ="java.io.File" %>
<%@ page import=" java.io.IOException" %>
<%@ page import=" java.util.Hashtable" %>
<%@ page import ="javax.imageio.ImageIO "%>
<%@ page  import=" com.google.zxing.BarcodeFormat "%>
<%@ page import=" com.google.zxing.EncodeHintType" %>
<%@ page import ="com.google.zxing.WriterException"  %>
<%@ page import ="com.google.zxing.common.BitMatrix" %>
<%@ page import=" com.google.zxing.common.BitMatrix" %>
<%@ page  import ="com.google.zxing.qrcode.QRCodeWriter "%>
<%@ page import ="com.google.zxing.qrcode.decoder.ErrorCorrectionLevel"%>
  
    <%@ page import="databaseConnection.*" %>
    <%@page import="java.sql.*" %>
   <%@page import="java.io.FileInputStream"%> 
   <%@ page  import ="javax.print.Doc "%>
     <%@ page import=" javax.print.DocFlavor" %>
       <%@ page import ="javax.print.DocPrintJob "%>
         <%@ page import ="javax.print.PrintException" %>
         
           <%@ page import=" javax.print.PrintService" %>
             <%@ page import=" javax.print.PrintServiceLookup"  %>
               <%@ page import ="javax.print.SimpleDoc" %>
                 <%@ page import=" javax.print.attribute.HashPrintRequestAttributeSet" %>
                   <%@ page import ="javax.print.attribute.PrintRequestAttributeSet "%>
                   
                     <%@ page import ="javax.print.attribute.standard.Copies" %>
                     <%@ page import= "javax.servlet.*" %>
                     <%@ page import="javax.servlet.http.*" %>
    
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%


String user_id=String.valueOf(session.getAttribute("user_id"));
System.out.println(user_id);
//String vis_veh_no= request.getParameter("veh_no");
//
//System.out.println(vis_veh_no);
System.out.println(user_id);


Connection conn=null;
PreparedStatement pst=null;

ResultSet rs=null;
String sql="";
String veh_number="";


try
{
	DBConnection DBConn = new DBConnection();
	conn = DBConn.getOracleConnction();
	
	System.out.println("2");
sql="select veh_no from registered_vehicle where user_id=?";
System.out.println("xxx");
pst=conn.prepareStatement(sql);
System.out.println("yyy");
pst.setString(1,user_id);
	System.out.println("5");
	rs=pst.executeQuery();
	if(rs.next())
	{
		System.out.println("zzz");
		veh_number=rs.getString("veh_no");
	}
	else
	{
		//veh_number=vis_veh_no;
	}
	/*  String filePath = request.getServletContext().getContextPath();
	System.out.println(filePath); */
	System.out.println(veh_number);
	
	
	
	createQRImage( veh_number);
	
	response.sendRedirect("displayQR.jsp");
	
	
}

	catch(Exception e)
	{
		e.printStackTrace();
	}


%>


<%!


public void createQRImage(String veh_number) throws WriterException, IOException , Exception{ 
	
	
	System.out.println("4");
	String qrCodeText =String.valueOf( veh_number);
	System.out.println(veh_number);
	
	int size = 125;
	String fileType = "png";
	/*  String filePath ="D:\\java\\Automated_Vehicle_Recognition\\WebContent\\images\\qr.png";   */
	
	 String filePath=getServletContext().getRealPath("/")+"\\images\\qr.png";  
/* 	System.out.print(qrFile.getAbsolutePath()); */
	// Create the ByteMatrix for the QR-Code that encodes the given String
	
	File qrFile = new File(filePath);
	Hashtable hintMap = new Hashtable();
	hintMap.put(EncodeHintType.ERROR_CORRECTION, ErrorCorrectionLevel.L);
	QRCodeWriter qrCodeWriter = new QRCodeWriter();
	BitMatrix byteMatrix = qrCodeWriter.encode(qrCodeText,
			BarcodeFormat.QR_CODE, size, size, hintMap);
	// Make the BufferedImage that are to hold the QRCode
	int matrixWidth = byteMatrix.getWidth();
	BufferedImage image = new BufferedImage(matrixWidth, matrixWidth,
			BufferedImage.TYPE_INT_RGB);
	image.createGraphics();

	Graphics2D graphics = (Graphics2D) image.getGraphics();
	graphics.setColor(Color.WHITE);
	graphics.fillRect(0, 0, matrixWidth, matrixWidth);
	// Paint and save the image using the ByteMatrix
	graphics.setColor(Color.BLACK);

	for (int i = 0; i < matrixWidth; i++) {
		for (int j = 0; j < matrixWidth; j++) {
			if (byteMatrix.get(i, j)) {
				graphics.fillRect(i, j, 1, 1);
			}
		}
	}
	ImageIO.write(image, fileType, qrFile);

		
		
	//printQRCode(filePath);
    }

     %>


		
<%!

public  static void printQRCode( String filePath) throws Exception
{
	

System.out.println("5");
PrintRequestAttributeSet pras = new HashPrintRequestAttributeSet();
pras.add(new Copies(1));
PrintService pss[] = PrintServiceLookup.lookupPrintServices(DocFlavor.INPUT_STREAM.GIF, pras);
if (pss.length == 0)
  throw new RuntimeException("No printer services available.");
PrintService ps = pss[0];
System.out.println("Printing to " + ps);
DocPrintJob job = ps.createPrintJob();
FileInputStream fin = new FileInputStream(filePath);
Doc doc = new SimpleDoc(fin, DocFlavor.INPUT_STREAM.GIF, null);
job.print(doc, pras);
fin.close();

}
%>


</body>
</html>