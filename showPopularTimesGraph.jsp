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
		ArrayList<Map<String,Integer>> list = new ArrayList();
   		Map<String,Integer> map = null;
   		//Get the database connection
   		ApplicationDB db = new ApplicationDB();	
   		Connection con = db.getConnection();		

   		//Create a SQL statement
   		Statement stmt = con.createStatement();
   		  
   		//Make a query
   		String entity = request.getParameter("bar");
   	   	String query = "SELECT time FROM (SELECT bill_id FROM transactions) sub NATURAL JOIN bills WHERE bar = '"+entity+"'";
		
   	 	map=new HashMap<String,Integer>();
		map.put("12am",0);
		list.add(map);
		map=new HashMap<String,Integer>();
		map.put("1am",0);
		list.add(map);
		map=new HashMap<String,Integer>();
		map.put("2am",0);
		list.add(map);
		map=new HashMap<String,Integer>();
		map.put("3am",0);
		list.add(map);
		map=new HashMap<String,Integer>();
		map.put("4am",0);
		list.add(map);
		map=new HashMap<String,Integer>();
		map.put("5am",0);
		list.add(map);
		map=new HashMap<String,Integer>();
		map.put("6am",0);
		list.add(map);
		map=new HashMap<String,Integer>();
		map.put("7am",0);
		list.add(map);
		map=new HashMap<String,Integer>();
		map.put("8am",0);
		list.add(map);
		map=new HashMap<String,Integer>();
		map.put("9am",0);
		list.add(map);
		map=new HashMap<String,Integer>();
		map.put("10am",0);
		list.add(map);
		map=new HashMap<String,Integer>();
		map.put("11am",0);
		list.add(map);
		map=new HashMap<String,Integer>();
		map.put("12pm",0);
		list.add(map);
		map=new HashMap<String,Integer>();
		map.put("1pm",0);
		list.add(map);
		map=new HashMap<String,Integer>();
		map.put("2pm",0);
		list.add(map);
		map=new HashMap<String,Integer>();
		map.put("3pm",0);
		list.add(map);
		map=new HashMap<String,Integer>();
		map.put("4pm",0);
		list.add(map);
		map=new HashMap<String,Integer>();
		map.put("5pm",0);
		list.add(map);
		map=new HashMap<String,Integer>();
		map.put("6pm",0);
		list.add(map);
		map=new HashMap<String,Integer>();
		map.put("7pm",0);
		list.add(map);
		map=new HashMap<String,Integer>();
		map.put("8pm",0);
		list.add(map);
		map=new HashMap<String,Integer>();
		map.put("9pm",0);
		list.add(map);
		map=new HashMap<String,Integer>();
		map.put("10pm",0);
		list.add(map);
		map=new HashMap<String,Integer>();
		map.put("11pm",0);
		list.add(map);
		
   		//Run the query against the database.
   		ResultSet result = stmt.executeQuery(query);
   		
   		
   		//Process the result
   		while (result.next()) { 
   			map=new HashMap<String,Integer>();
   			boolean add = true;
   			int i = 0;
   			int currentTime = Integer.parseInt(result.getString("time").replace(":",""));
   			String interval = "";
   			if((0<=currentTime)&&(currentTime<=59)){
   				interval = "12am";
   			}
   			if((100<=currentTime)&&(currentTime<=159)){
   				interval = "1am";
   			}
   			if((200<=currentTime)&&(currentTime<=259)){
   				interval = "2am";
   			}
   			if((300<=currentTime)&&(currentTime<=359)){
   				interval = "3am";
   			}
   			if((400<=currentTime)&&(currentTime<=459)){
   				interval = "4am";
   			}
   			if((500<=currentTime)&&(currentTime<=559)){
   				interval = "5am";
   			}
   			if((600<=currentTime)&&(currentTime<=659)){
   				interval = "6am";
   			}
   			if((700<=currentTime)&&(currentTime<=759)){
   				interval = "7am";
   			}
   			if((800<=currentTime)&&(currentTime<=859)){
   				interval = "8am";
   			}
   			if((900<=currentTime)&&(currentTime<=959)){
   				interval = "9am";
   			}
   			if((1000<=currentTime)&&(currentTime<=1059)){
   				interval = "10am";
   			}
   			if((1100<=currentTime)&&(currentTime<=1159)){
   				interval = "11am";
   			}
   			if((1200<=currentTime)&&(currentTime<=1259)){
   				interval = "12pm";
   			}
   			if((1300<=currentTime)&&(currentTime<=1359)){
   				interval = "1pm";
   			}
   			if((1400<=currentTime)&&(currentTime<=1459)){
   				interval = "2pm";
   			}
   			if((1500<=currentTime)&&(currentTime<=1559)){
   				interval = "3pm";
   			}
   			if((1600<=currentTime)&&(currentTime<=1659)){
   				interval = "4pm";
   			}
   			if((1700<=currentTime)&&(currentTime<=1759)){
   				interval = "5pm";
   			}
   			if((1800<=currentTime)&&(currentTime<=1859)){
   				interval = "6pm";
   			}
   			if((1900<=currentTime)&&(currentTime<=1959)){
   				interval = "7pm";
   			}
   			if((2000<=currentTime)&&(currentTime<=2059)){
   				interval = "8pm";
   			}
   			if((2100<=currentTime)&&(currentTime<=2159)){
   				interval = "9pm";
   			}
   			if((2200<=currentTime)&&(currentTime<=2259)){
   				interval = "10pm";
   			}
   			if((2300<=currentTime)&&(currentTime<=2359)){
   				interval = "11pm";
   			}
   			
   			
   	   		for(i = 0; i<list.size(); i++){
   				if(((list.get(i)).keySet().toArray()[0]).equals(interval)){
   					int newVal = 1 + (list.get(i)).get(interval);
   					map.put(interval, newVal);
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
        for(Map<String,Integer> hashmap : list){
        		Iterator it = hashmap.entrySet().iterator();
            	while (it.hasNext()) { 
           		Map.Entry pair = (Map.Entry)it.next();
           		String key = pair.getKey().toString().replaceAll("'", "");
           		myData.append("['"+ key +"',"+ pair.getValue() +"],");
           	}
        }
        strData = myData.substring(0, myData.length()-1); //remove the last comma
        
        //Create the chart title according to what the user selected
        
        chartTitle = "Busiest times";
        legend = "times";

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