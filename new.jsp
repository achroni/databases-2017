<%@page language="java"%>
<%@page import="java.sql.*"%>
<form method="post" action="save2.jsp">
   
        <%
        
        try {
        String URL = "jdbc:sqlserver://localhost;databaseName=VEHICLESAE;integratedSecurity=true;";
        Connection connection = null;
        Statement st = null;	
        ResultSet r = null;
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
        connection = DriverManager.getConnection(URL);
       
        %>
      <table>
        <tr>
            <td>LicensePlate: </td>
            <td><input type="text" name="license" value=""><br></td>
        </tr>
        <tr>
            <td>VehicleType:</td>
            <td><input type="text" name="type" value=""><br></td>
        </tr>
        <tr>
            <td>Make:</td>
            <td><input type="text" name="make" value=""><br></td>
        </tr>
        <tr>
            <td>Model:</td>
            <td><input type="text" name="model" value=""><br></td>
        </tr>
        <tr>
            <td>CylinderCapacity:</td>
            <td><input type="text" name="cylinder" value=""><br></td>
        </tr>
        <tr>
            <td>HorsePower:</td>
            <td><input type="text" name="horse" value=""><br></td>
        </tr>
        <tr>
            <td>FuelType:</td>
            <td><input type="text" name="fuel" value=""><br></td>
        </tr>
        <tr>
            <td>VehicleYear:</td>
            <td><input type="text" name="year" value=""><br></td>
        </tr>
        <tr>
            <td>Kilometers:</td>
            <td><input type="text" name="km" value=""><br></td>
        </tr>
        <tr>
            <td>LastService:</td>
            <td><input type="date" name="last_serv" value=""><br></td>
        </tr>
        <tr>
            <td>NextService:</td>
            <td><input type="date" name="next_serv" value=""><br></td>
        </tr>
        <tr>
            <td>InsurExpDate:</td>
            <td><input type="date" name="insur_date" value=""><br></td>
        </tr>
        <tr>
            <td>DamageDescription:</td>
            <td><input type="text" name="damage" value=""><br></td>
        </tr>
        <tr>
            <td>Malfunctions:</td>
            <td><input type="text" name="malfunction" value=""><br></td>
        </tr>
        <tr>
            <td><input type="submit" name="Submit" value="NEW" style="background-color:#49743D;font-weight:bold;color:#ffffff;"></td>
        </tr>
      </table>
        <%
     
        }
        catch(Exception e){}
        %>
    
</form>