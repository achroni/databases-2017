<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ page import="java.sql.*" 
         import="java.util.*"%>

<%
String URL = "jdbc:sqlserver://localhost;databaseName=VEHICLESAE;integratedSecurity=true;";
	Connection connection = null;
	Statement statement = null;	
        
	ResultSet r = null;
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
        connection = DriverManager.getConnection(URL);
        statement = connection.createStatement();
	String VehID = request.getParameter("VehID");
        String sql="select * from Vehicle";	
        r = statement.executeQuery(sql);
	
        %>

<html>
<title>VehiclesWeb</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body,h1,h2,h3,h4,h5 {font-family: "Poppins", sans-serif}
body {font-size:16px;}
.w3-half img{margin-bottom:-6px;margin-top:16px;opacity:0.8;cursor:pointer}
.w3-half img:hover{opacity:1}
</style>
<style>
#customers {
    font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
    border-collapse: collapse;
    width: 100%;
}

#customers td, #customers th {
    border: 1px solid #ddd;
    padding: 8px;
}

#customers tr:nth-child(even){background-color: #f2f2f2;}

#customers tr:hover {background-color: #ddd;}

#customers th {
    padding-top: 12px;
    padding-bottom: 12px;
    text-align: left;
    background-color: #4CAF50;
    color: white;
}
</style>
<head>
</head>
<body>

<!-- Sidebar/menu -->
<nav class="w3-sidebar w3-collapse w3-top w3-large w3-padding"  style="z-index:3;width:300px;font-weight:bold; background-color: #606488; color: white;" id="mySidebar"><br>
  <a href="javascript:void(0)" onclick="w3_close()" class="w3-button w3-hide-large w3-display-topleft" style="width:100%;font-size:22px">Close Menu</a>
  <div class="w3-container">
    <h3 class="w3-padding-64"><b>Vehicles<br>Believe</b></h3>
  </div>
  <div class="w3-bar-block">
    <a href="index.html"  class="w3-bar-item w3-button w3-hover-white">Home</a> 
    <a href="#"  class="w3-bar-item w3-button w3-hover-white">Καταστήματα</a> 
    <a href="#showcase" class="w3-bar-item w3-button w3-hover-white">Πελάτες</a> 
    <a href="Vehicles.jsp" class="w3-bar-item w3-button w3-hover-white">Οχήματα</a> 
    <a href="#designers" class="w3-bar-item w3-button w3-hover-white">Ενοικιάσεις</a> 
  </div>
</nav>

<!-- Top menu on small screens -->
<header class="w3-container w3-top w3-hide-large w3-red w3-xlarge w3-padding">
  <a href="javascript:void(0)" class="w3-button w3-red w3-margin-right" onclick="w3_open()">☰</a>
  <span>Vehicles Believe</span>
</header>

<!-- Overlay effect when opening sidebar on small screens -->
<div class="w3-overlay w3-hide-large" " style="cursor:pointer" title="close side menu" id="myOverlay"></div>

<!-- !PAGE CONTENT! -->
<div class="w3-main" style="margin-left:340px;margin-right:40px">

  <!-- Header -->
  <div class="w3-container" style="margin-top:10px" id="showcase">
    <h1 class="w3-jumbo"><b>Vehicles</b></h1>
  </div>
  
<script>
    function NewRowFunction() {
        var f=document.form;
        f.method="post";
        f.action='new.jsp';
        f.submit();
    }
</script>

  <table id="customers">

    <form method="post" name="form">
        <button style="font-size:16px" onclick="NewRowFunction()">Add new record<i class="fa fa-plus-square" style="font-size:17px"></i></button>
    </form>

      <tr>
      <td></td>
      <td><b>LicensePlate</b></td>
      <td><b>VehicleType</b></td>
      <td><b>Make</b></td>
      <td><b>Model</b></td>
      <td></td>
      </tr>
      
      <%
		while (r.next()) {
                   if (r.getString("VehicleID").equals(VehID)) {
        
      %>
      
 
      
   
            <form name="frmUpdate" method="post" action="save.jsp?VehID=<%=r.getString("VehicleID")%>">
                <tr>
                     <td>
                            <button style="font-size:16px">
                                 <a href="delete.jsp?VehID=<%=r.getString("VehicleID")%>">Delete</a> <i class="material-icons" style="font-size:17px">delete</i>
                            </button>
                     </td>
			<td><input type="text" name="txtLicense" size="20" value="<%=r.getString("LicensePlate")%>"></td>
			<td><input type="text" name="txtType" size="20" value="<%=r.getString("VehicleType")%>"></td>
                        <td><input type="text" name="txtMake" size="20" value="<%=r.getString("Make")%>"></td>
                        <td><input type="text" name="txtModel" size="20" value="<%=r.getString("Model")%>"></td>
                      
                        <td><input type="submit" value="Save"></td>
		</tr>
            </form>
       <%
           }
            else{
       %>
            
            <tr>
                 <td>
                            <button style="font-size:16px">
                                 <a href="delete.jsp?VehID=<%=r.getString("VehicleID")%>">Delete</a> <i class="material-icons" style="font-size:17px">delete</i>
                            </button>
                     </td>
               
                <td><%=r.getString("LicensePlate")%></td>
		<td><%=r.getString("VehicleType")%></td>
                <td><%=r.getString("Make")%></td>
                <td><%=r.getString("Model")%></td>
                      
                <td> <button style="font-size:16px">
                                <a href="update2.jsp?VehID=<%=r.getString("VehicleID")%>">Edit</a> <i class="material-icons" style="font-size:17px">border_color</i>
                     </button>
                </td>
            </tr>

       
                
        <%
            }
		}

		r.close();
	%>
  </table>


  
</div>

 



</body>
</html>


