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

	<br>Get top 10 drinking spenders at given bar

	<form method="get" action="topTenDrinkers.jsp">
		<table>
			<tr>
				<td>Bar:</td>
				<td><input type="text" name="bar"></td>
			</tr>
		</table>
		<input type="submit" value="Get biggest spenders!">
	</form>
	
	<br>Get top 10 beers at a given bar

	<form method="get" action="topTenBeers.jsp">
		<table>
			<tr>
				<td>Bar:</td>
				<td><input type="text" name="bar"></td>
			</tr>
		</table>
		<input type="submit" value="Get popular beers!">
	</form>
	
	<br>Get top 5 beers per manufacturer given a bar

	<form method="get" action="topFiveManu.jsp">
		<table>
			<tr>
				<td>Bar:</td>
				<td><input type="text" name="bar"></td>
			</tr>
		</table>
		<input type="submit" value="Get popular manufacturers!">
	</form>
	
	<br>Get graph of busiest times given bar

	<form method="get" action="showPopularTimesGraph.jsp">
		<table>
			<tr>
				<td>Bar:</td>
				<td><input type="text" name="bar"></td>
			</tr>
		</table>
		<input type="submit" value="Get busiest times!">
	</form>
	
	<br>Get graph of busiest weekdays

	<form method="get" action="showPopularWeekdaysGraph.jsp">
		<table>
			<tr>
				<td>Bar:</td>
				<td><input type="text" name="bar"></td>
			</tr>
		</table>
		<input type="submit" value="Get busiest days!">
	</form>

</body>
</html>