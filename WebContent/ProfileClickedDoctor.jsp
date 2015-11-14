<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="com.journaldev.mongodb.dao.MongoDBPersonDAO"%>
<%@ page import="com.journaldev.mongodb.model.Person_login"%>

<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<title>Patient Profile</title>

<!-- Bootstrap core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Add custom CSS here -->
<link href="css/style.css" rel="stylesheet">
<link href='http://fonts.googleapis.com/css?family=Bevan'
	rel='stylesheet' type='text/css'>

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
						<li><a href="#">Allergy</a></li>
						<li><a href="#">Blood Pressure</a></li>
						<li><a href="#">Sugar</a></li>
					</ul></li>

				<li><a href="Doctors.jsp">Doctors</a></li>

				<li><a href="#">Patient</a></li>

				<li><a href="aboutUs.jsp">About Us</a></li>

				<li><a href="contact.jsp">Contact Us</a></li>

				<li><a href="chart.jsp">Pie Chart</a></li>

				<li><a href="ProfileDoctor.jsp">My profile</a></li>

			</ul>

			<div class="col-md-3">
				<ul class="nav nav-pills nav-stacked">
					<li><a href="ProfileDoctor.jsp"><span
							class="glyphicon glyphicon-user"></span> My Account</a></li>
					<li><a href="MainSignUp.jsp"><span
							class="glyphicon glyphicon-log-out"></span> Sign Out</a></li>
				</ul>
			</div>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container --> </nav>
	<c:if test="${requestScope.error ne null}">
		<strong style="color: red;"><c:out
				value="${requestScope.error}"></c:out></strong>
	</c:if>
	<c:if test="${requestScope.success ne null}">
		<strong style="color: green;"><c:out
				value="${requestScope.success}"></c:out></strong>
	</c:if>
	<c:url value="/editPerson" var="editURL"></c:url>
	<c:url value="/clickedProfileDoctor" var="clickedProfile"></c:url>
	<div class="container">

<c:url value="/displayPatientList" var="displayURL">
			<c:param name="id" value="${doctor.id}"></c:param>
		</c:url>
		<div class="page-header" id="site-header">
			<h1>Connected Patient Health Analytics Using Wearables</h1>
		</div>



		<div class="row">

			<div class="col-md-9">

				<h3>Your Account</h3>
				<h1 style="margin-top: 0">
					<center>
						<p>
							Hello Doctor,
							<c:out value="${doctor.firstName}" />

						</p>
					</center>
				</h1>
				<div class="clearfix"
					style="text-align: justify; padding: 20px; background: #eee; border: 2px solid #bbb; border-radius: 10px;">
					<img src="images/doctor2.jpg" alt="Image"
						style="float: center; margin-right: 15px; margin-bottom: 15px;" />
					<p></p>
					<br /> <br /> <br />
					<c:if test="${patient ne null}">
						<center>
							<h3>General Info of Patient ${patient.firstName} requested</h3>
						</center>
						<ul>
							<li><b> Patient Name:</b>${patient.firstName} ${patient.lastName}</li>
							<li><b> Patient Gender:</b>${patient.gender} </li>
							<li><b> Patient Birth Date:</b>${patient.birthDate} 
							
							</li>
							
							

						</ul>
						<center>
							<h3>Contact Info of Patient</h3>
						</center>
						<address>
							<ul>
								<li><b> Email:</b>${patient.email}</li>
								<li><b> Phone:</b> ${patient.phone}</li>
								<li><b> Address:</b>${patient.streetAddress}<br>${patient.city}<br>${patient.state}<br>${patient.zipcode}</li>
							</ul>
							<br /> <br />
						</address>
						
							<center>
								<h3>Health Information</h3>
							</center>

							<p>Allergy</p>
							<c:if test="${patient.allergy ne null}">
								<c:forEach items="${patient.allergy}" var="allergy">

									<p>${allergy},</p>

								</c:forEach>
							</c:if>
							<br>
							<p>Disease and history
							<p>
								<c:if test="${patient.disease ne null}">
									<c:forEach items="${patient.disease}" var="disease">
										
												<p>${disease},</p>
											
									</c:forEach>
								</c:if>
								<br>
								<br>
					</c:if>

				</div>
			</div>

			<div class="col-md-3">
				<p class="lead"></p>
				<div class="list-group">
					<a href="${displayURL}" class="list-group-item active">
						<h4 class="list-group-item-heading">List of Patients</h4>
					</a>
					<c:if test="${not empty patientList}">
						<c:forEach items="${patientList}" var="patient">
							<c:if test="${patient eq null}">No Patient</c:if>
							<c:if test="${patient ne null}">
								<c:url value="/clickedProfileDoctor" var="clickedProfile">
									<c:param name="id" value="${patient.id}"></c:param>
								</c:url>
								<a href="${clickedProfile}" class="list-group-item"><c:out
										value="${patient.firstName}"></c:out></a>
							</c:if>

						</c:forEach>
					</c:if>

				</div>
			</div>


		</div>

	</div>


	<!-- /.container -->

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
	<!-- /.container -->

	<!-- JavaScript -->
	<script src="js/jquery-1.10.2.js"></script>
	<script src="js/bootstrap.js"></script>

</body>



</html>