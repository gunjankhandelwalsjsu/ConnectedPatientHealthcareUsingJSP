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
<c:if test="${requestScope.error ne null}">
			<strong style="color: red;"><c:out
					value="${requestScope.error}"></c:out></strong>
		</c:if>
		<c:if test="${requestScope.success ne null}">
			<strong style="color: green;"><c:out
					value="${requestScope.success}"></c:out></strong>
		</c:if>
		<c:url value="/editPerson" var="editURL"></c:url>
		<c:url value="/clickedProfile" var="clickedProfile"></c:url>

		<c:url value="/addDoctorToPatientProfile"
			var="addDoctorToPatientProfileURL">
			<c:param name="id" value="${doctor.id}"></c:param>
		</c:url>
		<c:url var="getPhoto" value="/getPhoto">
			<c:param name="id" value="${doctor.id}"></c:param>

		</c:url>
		 <c:url var="getChart" value="/ChartServlet" >
          <c:param name="id" value="${Patient.id}"></c:param>         
          </c:url>
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

				<li><a href="Doctors.jsp">Doctors</a></li>


				<li><a href="aboutUs.jsp">About Us</a></li>

				<li><a href="contact.jsp">Contact Us</a></li>

				<li><a href="${getChart}">Chart</a></li>
				<li><a href="Profile.jsp">My profile</a></li>

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
	<!-- /.container --> </nav>

	<div class="container">

		<div class="page-header" id="site-header">
			<h1>Connected Patient Health Analytics Using Wearables</h1>
		</div>


		
		<div class="row">

			<div class="col-md-9">
				<h3>Your Account</h3>

				<h1 style="margin-top: 0">
					<center>
						<p>
							Hello Patient,
							<c:out value="${Patient.firstName}" />

						</p>
					</center>
				</h1>
				<div class="clearfix"
					style="text-align: justify; padding: 20px; background: #eee; border: 2px solid #bbb; border-radius: 10px;">


					<div id="preview">
						<img src="${getPhoto}" alt="Profile Photo"
							style="float: center; margin-right: 15px; margin-bottom: 15px;" />
					</div>

					<p></p>
					<br /> <br /> <br />


					<c:if test="${doctor ne null}">
						<center>
							<h3>General Info of ${doctor.firstName} requested</h3>
						</center>
						<ul>
							<li><b> Name:</b>${doctor.firstName} ${doctor.lastName}</li>
							<li><b> Prior Experience:</b> Midtown Medical Center, New
								York, NY</li>
							<li><b> Residency:</b> Internal Medicine,San Fransisco,CA</li>
						</ul>

						<center>
							<h3>Contact Info</h3>
						</center>
						<address>						
							<ul>
							
								<li><b> Email:</b>${doctor.email}</li>
								<li><b> Phone:</b> ${doctor.phone}</li>
								<li><b> Address:</b>${doctor.streetAddress}<br>${doctor.city}<br>${doctor.state}<br>${doctor.zipcode}</li>
							</ul>
							<br /> <br /> <b>office hours:</b> <br /> Monday-Thursday :
							8.30am to 5.pm Friday-8.30am to 3.30pm
						</address>
						<center>
							<h3>Specializations</h3>
						</center>

						<c:if test="${doctor.specialization ne null}">
							<c:forEach items="${doctor.specialization}" var="specialization">
								<ul>
									<li>
										<p>${specialization}</p>
									</li>
								</ul>
							</c:forEach>
						</c:if>


						<form
							action='<c:out value="${addDoctorToPatientProfileURL}"></c:out>'
							method="post">

							<center>
								<h3>
									<input type="submit" value="Add doctor">
								</h3>
							</center>
						</form>
					</c:if>

				</div>
			</div>



			<div class="col-md-3">
				<p class="lead">Side Bar Links</p>
				<div class="list-group">
					<a href="#" class="list-group-item active">
						<h4 class="list-group-item-heading">List Of Doctors</h4>
					</a>
					<c:if test="${not empty doctors}">
						<c:forEach items="${doctors}" var="doctor">
							<c:url value="/clickedProfile" var="clickedProfile">
								<c:param name="id" value="${doctor.id}"></c:param>
							</c:url>

							<a href="${clickedProfile}" class="list-group-item"><c:out
									value="${doctor.firstName}"></c:out></a>


						</c:forEach>
					</c:if>


				</div>
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