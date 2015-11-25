<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.mongodb.*"
	import="java.net.UnknownHostException"
	import="com.sun.org.apache.bcel.internal.generic.NEW"
	import="java.util.Date" import="com.journaldev.mongodb.util.dconnect"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Temperature Visualization</title>
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Add custom CSS here -->
<link href="css/style.css" rel="stylesheet">
<link href='http://fonts.googleapis.com/css?family=Bevan'
	rel='stylesheet' type='text/css'>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script src="http://code.highcharts.com/highcharts.js"></script>

</head>
<body>
	<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target=".navbar-ex1-collapse">
				<span class="sr-only">Navigation</span> <span class="icon-bar"></span>
				<span class="icon-bar"></span> <span class="icon-bar"></span>
			</button>
			<!--<a class="navbar-brand" href="index.html">Straight Talk</a>-->
		</div>
		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse navbar-ex1-collapse">
			<ul class="nav navbar-nav">
				<li><a href="home.jsp">Home</a></li>
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#">Topic <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="FoodAllergy.jsp">Food Allergy</a></li>
						<li><a href="BloodPressure.jsp">Blood Pressure</a></li>
						<li><a href="Diabetics.jsp">Diabetics</a></li>
					</ul></li>
				<li><a href="contact.jsp">Contact Us</a></li>

				<li><a href="ProfileDoctor.jsp">My profile</a></li>

			</ul>

			<div class="col-md-3">
				<ul class="nav nav-pills nav-stacked">
					<li><a href="Profile.jsp"><span
							class="glyphicon glyphicon-user"></span> My Account</a></li>
					<li><a href="${logOutURL}"><span
							class="glyphicon glyphicon-log-out"></span> Sign Out</a></li>
				</ul>
			</div>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	</nav>



	<div class="container">

		<div class="page-header" id="site-header">
			<h1>Connected Patient Health Analytics Using Wearables</h1>
		</div>

		<div class="row">

			<div class="col-md-9">
				<h1 style="margin-top: 0"> Temperature Analytics</h1>
				<div class="clearfix"
					style="text-align: justify; padding: 20px; background: #eee; border: 2px solid #bbb; border-radius: 10px;">
					<canvas id="canvas" height="0" width="250" style="margin: 0 auto;"></canvas>

                      

					<%
						String[] anArray;
						anArray = new String[10];

						dconnect mymongo = dconnect.createInstance();
						String email = (String)request.getAttribute("email");
     					DBCollection collection = mymongo.getCollection("Temperatures");
						BasicDBObject query = new BasicDBObject();
						query.put("email", email);
						System.out.println(email);
						DBCursor cursor = collection.find(query);
						try {
							int i = 0;
							while (cursor.hasNext()) {
								anArray[i] = cursor.next().toString();
								i++;
							}
						} finally {
							cursor.close();
						}
						int timeIndexStart = anArray[0].indexOf('[');
						int timeIndexEnd = anArray[0].indexOf(']');
						int temperatureIndexStart = anArray[0].indexOf('[', timeIndexStart + 1);
						int temperatureIndexEnd = anArray[0].indexOf(']', timeIndexEnd + 1);
						String actualTimes = anArray[0].substring(timeIndexStart, timeIndexEnd + 1);
						String actualTemperatures = anArray[0].substring(temperatureIndexStart, temperatureIndexEnd + 1);

						int currentT = 0;
						int avance = 0;
						int tempIndex = anArray[0].indexOf("temperature");
						int toStop = 0;
						String tiempoReal = "";
						String[] actualTime;
						actualTime = new String[10];

						while (toStop == 0) {
							currentT = anArray[0].indexOf('T', avance);
							avance = currentT + 1;
							if (avance == (tempIndex - 20))
								toStop = -1;

							tiempoReal = tiempoReal + "\'" + anArray[0].substring(currentT - 10, currentT + 6) + "\', ";
						}
						tiempoReal = tiempoReal.substring(0, tiempoReal.length() - 2);
						tiempoReal = "[" + tiempoReal + "]";
						//DBObject doc = collection.findOne(query);
					%>
					<div id="container"
						style="width: 550px; height: 400px; margin: 0 auto"></div>
					<script language="JavaScript">
						var patient = "${email}";

						var dates =
					<%=tiempoReal%>
						;

						var temperatures =
					<%=actualTemperatures%>
						;

						$(document).ready(function() {
							var title = {
								text : 'Temperatures of Patient'
							};
							var subtitle = {
								text : 'Sensor Tag Data'
							};
							var xAxis = {
								title : {
									text : 'Time (Date/Time)'
								},
								categories : dates
							};
							var yAxis = {
								title : {
									text : 'Temperature (\xB0F)'
								},
								plotLines : [ {
									value : 0,
									width : 1,
									color : '#808080'
								} ]
							};

							var tooltip = {
								valueSuffix : '\xB0C'
							}

							var legend = {
								layout : 'horizontal',
								align : 'center',
								horizontalAlign : 'bottom',
								borderWidth : 0
							};

							var series = [ {
								name : 'Patient: ' + patient,
								data : temperatures
							} ];

							var json = {};
							json.tooltip = tooltip;
							json.title = title;
							json.subtitle = subtitle;
							json.xAxis = xAxis;
							json.yAxis = yAxis;

							json.legend = legend;
							json.series = series;

							$('#container').highcharts(json);
						});
					</script>


				<a class="btn btn-block btn-primary" href="FoodAllergy.jsp"
					style="margin-top: 20px;">&leftarrow; Go Back</a>
		</div>
						</div>
		


			<div class="col-md-3">
				<p></p>
				<br />
				<p></p>
				<div class="list-group">
					<a href="Doctors.jsp" class="list-group-item active">
						<h4 class="list-group-item-heading">Doctors</h4>
					</a> <a href="patientRegistration.jsp" class="list-group-item">Patient</a>
					<a href="aboutUs.jsp" class="list-group-item">About us</a> <a
						href="contact.jsp" class="list-group-item active">Contact us</a>
				</div>

				
			</div>


			</div>

	</div>
	<div class="container">

		<hr>

		<footer>
		<div class="row">
			<div class="col-lg-12">
				<p class="text-right">Copyright &copy; Company 2014 - Hardik
					Shah</p>
			</div>
		</div>
		</footer>

	</div>

</body>
</html>