<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>

<html>
<head>
    <title>Save</title>
</head>
<body>
        <%
	String URL = "jdbc:sqlserver://localhost;databaseName=VEHICLESAE;integratedSecurity=true;";
	Connection connection = null;
	Statement statement = null;	
        try {
	ResultSet r = null;
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
        connection = DriverManager.getConnection(URL);
        statement = connection.createStatement();
        String VehID = request.getParameter("VehID");
        
        String sql = "DELETE FROM Vehicle " +
				" WHERE VehicleID = '" + VehID + "' ";
        statement.executeQuery(sql);
	//out.println("Record Update Successfully");
	  		
		} catch (Exception e) {
			// TODO Auto-generated catch block
			//out.println(e.getMessage());
			e.printStackTrace();
		}
	
		try {
			if(statement!=null){
				statement.close();
				connection.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			out.println(e.getMessage());
			e.printStackTrace();
		}
                
             // response.sendRedirect("http://localhost:8080/WebApplication/Vehicles.jsp"); 
             // return;
	%>
	
	<script>window.location.href='http://localhost:8080/WebApplication/Vehicles.jsp';</script>
</body>
</html>