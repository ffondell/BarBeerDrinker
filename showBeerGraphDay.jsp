<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<% 
	StringBuilder myData=new StringBuilder();
	String strData ="";
    String chartTitle="";
    String legend="";
	try{
		//this list will hold the x-axis and y-axis data as a pair
		ArrayList<Map<String,Double>> list = new ArrayList();
   		Map<String,Double> map = null;
   		ArrayList<Map<String,Double>> list1 = new ArrayList();
   		Map<String,Double> map1 = null;
   		//Get the database connection
   		ApplicationDB db = new ApplicationDB();	
   		Connection con = db.getConnection();		

   		//Create a SQL statement
   		Statement stmt = con.createStatement();
   		  
   		//Make a query
   		String entity = request.getParameter("drinker");
   	   	String query = "SELECT date, drinker, day, total_price FROM bills WHERE drinker = '"+ entity +"'";
   		
   		
   		//Run the query against the database.
   		ResultSet result = stmt.executeQuery(query);
   		
   		map=new HashMap<String,Double>();
   		map.put("Monday",0.0);
		list.add(map);
		map=new HashMap<String,Double>();
   		map.put("Tuesday",0.0);
		list.add(map);
		map=new HashMap<String,Double>();
   		map.put("Wednesday",0.0);
		list.add(map);
		map=new HashMap<String,Double>();
   		map.put("Thursday",0.0);
		list.add(map);
		map=new HashMap<String,Double>();
   		map.put("Friday",0.0);
		list.add(map);
		map=new HashMap<String,Double>();
   		map.put("Saturday",0.0);
		list.add(map);
		map=new HashMap<String,Double>();
   		map.put("Sunday",0.0);
		list.add(map);
		
		map=new HashMap<String,Double>();
   		map.put("January",0.0);
		list1.add(map);
		map=new HashMap<String,Double>();
   		map.put("February",0.0);
		list1.add(map);
		map=new HashMap<String,Double>();
   		map.put("March",0.0);
		list1.add(map);
		map=new HashMap<String,Double>();
   		map.put("April",0.0);
		list1.add(map);
		map=new HashMap<String,Double>();
   		map.put("May",0.0);
		list1.add(map);
		map=new HashMap<String,Double>();
   		map.put("June",0.0);
		list1.add(map);
		map=new HashMap<String,Double>();
   		map.put("July",0.0);
		list1.add(map);
		map=new HashMap<String,Double>();
   		map.put("August",0.0);
		list1.add(map);
		map=new HashMap<String,Double>();
   		map.put("September",0.0);
		list1.add(map);
		map=new HashMap<String,Double>();
   		map.put("October",0.0);
		list1.add(map);
		map=new HashMap<String,Double>();
   		map.put("November",0.0);
		list1.add(map);
		map=new HashMap<String,Double>();
   		map.put("December",0.0);
		list1.add(map);
		
		
   		
   		//Process the result
   		while (result.next()) { 
   			map=new HashMap<String,Double>();
   			int i = 0;
   	   		for(i = 0; i<list.size(); i++){
   				if(((list.get(i)).keySet().toArray()[0]).equals(result.getString("day"))){
   					double newVal = result.getDouble("total_price") + (list.get(i)).get(result.getString("day"));
   					map.put(result.getString("day"), newVal);
   					list.set(i, map);
   				}
   			}
   	    } 
   		/*
   		int i = 0;
   		for(i = 0; i<list.size(); i++){
   			out.print((list.get(i)));
   		}
   		*/
   	    result.close();
   	    
   	    //Create a String of graph data of the following form: ["Caravan", 3],["Cabana",2],...
        for(Map<String,Double> hashmap : list){
        		Iterator it = hashmap.entrySet().iterator();
            	while (it.hasNext()) { 
           		Map.Entry pair = (Map.Entry)it.next();
           		String key = pair.getKey().toString().replaceAll("'", "");
           		myData.append("['"+ key +"',"+ pair.getValue() +"],");
           	}
        }
        strData = myData.substring(0, myData.length()-1); //remove the last comma
        
        //Create the chart title according to what the user selected
        
        chartTitle = "Total Spent by day of the week";
        legend = "total spent";

	}catch(SQLException e){
    		out.println(e);
    }
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Graphs</title>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script> 
		
			var data = [<%=strData%>]; //contains the data of the graph in the form: [ ["Caravan", 3],["Cabana",2],...]
			var title = '<%=chartTitle%>'; 
			var legend = '<%=legend%>'
			//this is an example of other kind of data
			//var data = [["01/22/2016",108],["01/24/2016",45],["01/25/2016",261],["01/26/2016",224],["01/27/2016",307],["01/28/2016",64]];
			var cat = [];
			data.forEach(function(item) {
			  cat.push(item[0]);
			});
			document.addEventListener('DOMContentLoaded', function () {
			var myChart = Highcharts.chart('graphContainer', {
			    chart: {
			        defaultSeriesType: 'column',
			        events: {
			            //load: requestData
			        }
			    },
			    title: {
			        text: title
			    },
			    xAxis: {
			        text: 'xAxis',
			        categories: cat
			    },
			    yAxis: {
			        text: 'yAxis'
			    },
			    series: [{
			        name: legend,
			        data: data
			    }]
			});
			});
		
		</script>
</head>
<body>

	<div id="graphContainer"
		style="width: 500px; height: 400px; margin: 0 auto"></div>



</body>
</html>