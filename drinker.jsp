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

	<br>Type the name of the drinker to get his/her transaction history

	<form method="get" action="drinkerTrans.jsp">
		<table>
			<tr>
				<td>Drinker:</td>
				<td><input type="text" name="drinker"></td>
			</tr>
		</table>
		<input type="submit" value="Get drinker!">
	</form>
	
	<br> Show Graph of Most Ordered beers
	<br>
	<form method="get" action="showBeerGraph.jsp">
		<table>
			<tr>
				<td>Drinker:</td>
				<td><input type="text" name="drinker"></td>
			</tr>
		</table>
		</select>&nbsp;<br> <input type="submit" value="submit">
	</form>
	
	
	<br>Show graph of Beers ordered by day
	<form method="get" action="showBeerGraphDay.jsp">
		<table>
			<tr>
				<td>Drinker:</td>
				<td><input type="text" name="drinker"></td>
			</tr>
		</table>
		</select>&nbsp;<br> <input type="submit" value="submit">
	</form>
	<br>Show graph of Beers ordered by month
	<form method="get" action="showBeerGraphMonth.jsp">
		<table>
			<tr>
				<td>Drinker:</td>
				<td><input type="text" name="drinker"></td>
			</tr>
		</table>
		</select>&nbsp;<br> <input type="submit" value="submit">
	</form>

</body>
</html>