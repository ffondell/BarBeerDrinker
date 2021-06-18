<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<% try {
	
			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();

			//Create a SQL statement
			Statement stmt = con.createStatement();
			stmt.executeQuery("set sql_mode=NO_ENGINE_SUBSTITUTION;");
			
			
			//Get the selected radio button from the index.jsp
			String entity = request.getParameter("drinker");
			//Make a SELECT query from the table specified by the 'command' parameter at the index.jsp
			String str = "SELECT bar , drinker, time, total_price FROM bills WHERE drinker = \"" + entity + "\" GROUP BY bar, time ORDER BY bar ASC;";
			//FROM bills WHERE drinker = \"Becky Cox\" GROUP BY bar, time ORDER BY bar ASC;";
					
		
				
					
			//String str = "SELECT * FROM " + "DatabaseBeerProject.Bills";
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);
			

		%>
		
		<table>
			<tr>    
			<td>Bar</td>
			<td>Drinker</td>
			<td>Total_Price</td>
			<td>Time</td>
			</tr>
		
		
		
			<%
			//parse out the results
			while (result.next()) { %>
				<tr>    
					<td><%= result.getString("bar") %></td>
					<td><%= result.getString("drinker") %></td>
					<td><%= result.getString("total_price") %></td>
					<td><%= result.getString("time") %></td>
				</tr>
				

			<% }
			//close the connection.
			db.closeConnection(con);
			%>
		</table>

			
		
	


	<%} catch (Exception e) {
			out.print(e);
		}%>


</body>
</html>