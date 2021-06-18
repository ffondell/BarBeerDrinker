<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Hi Beer World</title>
</head>
<body>

	<br>see the 5 top bars where this beer sells the most

	<form method="get" action="topFiveBeers.jsp">
		<table>
			<tr>
				<td>Beer:</td>
				<td><input type="text" name="beer"></td>
			</tr>
		</table>
		<input type="submit" value="Get top 5 beers!">
	</form>
	
	<br>See biggest consumers of given beer

	<form method="get" action="topTenConsumers.jsp">
		<table>
			<tr>
				<td>Beer:</td>
				<td><input type="text" name="beer"></td>
			</tr>
		</table>
		<input type="submit" value="Get biggest consumers!">
	</form>
	
	<br>See when the beer sells the most

	<form method="get" action="sellsTheMost.jsp">
		<table>
			<tr>
				<td>Beer:</td>
				<td><input type="text" name="beer"></td>
			</tr>
		</table>
		<input type="submit" value="See when it sells the most!">
	</form>

</body>
</html>