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
			String entity = request.getParameter("bar");
			//Make a SELECT query from the table specified by the 'command' parameter at the index.jsp
			String str = "SELECT manf, SUM(sum_total) as total_sum FROM (SELECT item, SUM(quantity) as sum_total FROM (SELECT bill_id, quantity, item FROM transactions WHERE transactions.type = 'beer') sub NATURAL JOIN bills WHERE bar = '"+entity+"' GROUP BY item ORDER BY sum_total desc) sub1 NATURAL JOIN beer WHERE item = name GROUP BY manf ORDER BY total_sum desc";


					
		
				
					
			//String str = "SELECT * FROM " + "DatabaseBeerProject.Bills";
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);
			

		%>
		
		<table>
			<tr>    
			<td>Manufacturer</td>
			<td>Amount Sold</td>
			</tr>
		
		
		
			<%
			//parse out the results
			int count =0;
			while(result.next()&&count!=5) { %>
				<% count++; %>
				<tr>    
					<td><%= result.getString("manf") %></td>
					<td><%= result.getString("total_sum") %></td>
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