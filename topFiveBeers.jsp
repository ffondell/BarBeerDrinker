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
			
			
			//Get the selected radio button from the index.jsp
			String entity = request.getParameter("beer");
			//Make a SELECT query from the table specified by the 'command' parameter at the index.jsp
			String str = "SELECT SUM(quantity)as sum_total, bar FROM (SELECT bill_id, quantity, type, item FROM transactions WHERE type = 'beer') sub NATURAL JOIN bills WHERE item = '"+entity+"' GROUP BY bar ORDER BY sum_total desc";


					
		
				
					
			//String str = "SELECT * FROM " + "DatabaseBeerProject.Bills";
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);
			

		%>
		
		<table>
			<tr>    
			<td>Bars:</td>
			</tr>
		
		
		
			<%
			//parse out the results
			int count =0;
			while(result.next()&&count!=5) { %>
				<% count++; %>
				<tr>    
					<td><%= result.getString("bar") %></td>
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