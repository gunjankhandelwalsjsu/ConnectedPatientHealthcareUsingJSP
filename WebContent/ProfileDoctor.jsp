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
		<c:url value="/displayPatientList" var="displayURL">
			<c:param name="id" value="${doctor.id}"></c:param>
		</c:url>
		<c:url value="/EditDoctorProfile.jsp" var="editURL">
			<c:param name="id" value="${doctor.id}"></c:param>
		</c:url>
		<c:url value="/deletePerson" var="deleteURL"></c:url>
		<c:url value="/clickedProfileDoctor" var="clickedProfile"></c:url>
		<c:url var="getPhoto" value="/getPhoto">
			<c:param name="id" value="${doctor.id}"></c:param>

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
				<li><a href="contact.jsp">Contact Us</a></li>

				<li><a href="ProfileDoctor.jsp">My profile</a></li>

			</ul>

			<div class="col-md-3">
				<ul class="nav nav-pills nav-stacked">
					<li><a href="ProfileDoctor.jsp"><span
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
							Hello Doctor,
							<c:out value="${doctor.firstName}" />
							!
						</p>
					</center>
				</h1>
				<div class="clearfix"
					style="text-align: justify; padding: 20px; background: #eee; border: 2px solid #bbb; border-radius: 10px;">


					<div id="preview">
						<img src="${getPhoto}" alt="Profile Photo"
							style="float: center; margin-right: 15px; margin-bottom: 15px;" />
					</div>
					<p>Dr.Angel's primary interests are in the role of how viral
						infections play in the development of allergic diseases, such as
						asthma. He has an active NIH sponsored research program studying
						these issues, with a focus on the role of viruses in the
						development of asthma and food allergies. Clinically, Dr. Jeson's
						interests are asthma, allergic rhinitis, angioedema, and
						anaphylaxis.</p>

					<p></p>
					<br /> <br /> <br />
					<%-- General Info--%>
					<c:if test="${doctor ne null}">
						<center>
							<h3>General Info</h3>
						</center>
						<ul>
							<li><b> Name:</b>${doctor.firstName} ${doctor.lastName}</li>
							<li><b> Prior Experience:</b> Midtown Medical Center, New
								York, NY</li>
							<li><b> Residency:</b> Internal Medicine,San Fransisco,CA</li>
						</ul>
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
						<br>

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
						<div class="clearfix post_comment_box" style="margin-top: 20px;">
							<center>
								<h3>Need an Appointment?</h3>
							</center>
							<form class="form-horizontal">
								<div class="form-group">
									<label for="inputName" class="col-lg-2 control-label">Name</label>
									<div class="col-lg-10">
										<input type="text" class="form-control" id="inputName"
											placeholder="Your Good Name">
									</div>
								</div>
								<div class="form-group">
									<label for="inputEmail" class="col-lg-2 control-label">Email</label>
									<div class="col-lg-10">
										<input type="text" class="form-control" id="inputEmail"
											placeholder="Email">
									</div>
								</div>
								<div class="form-group">
									<label for="inputDate" class="col-lg-2 control-label">Date</label>
									<div class="col-lg-10">
										<input type="text" class="form-control" id="inputDate"
											placeholder="Date">
									</div>
								</div>
								<div class="form-group">
									<label for="inputTime" class="col-lg-2 control-label">Time</label>
									<div class="col-lg-10">
										<input type="text" class="form-control" id="inputTime"
											placeholder="Time">
									</div>
								</div>
								<div class="form-group">
									<label for="message" class="col-lg-2 control-label">Comment</label>
									<div class="col-lg-10">
										<textarea class="form-control" rows="3" id="message"></textarea>
										<span class="help-block">Comment help text</span>
									</div>
								</div>
								<div class="form-group">
									<div class="col-lg-10 col-lg-offset-2">
										<button type="submit" class="btn btn-success">Submit</button>
									</div>
								</div>
							</form>
						</div>

						<div class="clearfix post_comment_box" style="margin-top: 20px;">
							<h3>See what people are saying..</h3>
							<div class="clearfix" style="margin-top: 30px;">
								<div class="media">
									<a class="pull-left" href="#"> <img class="media-object"
										style="width: 64px; height: 64px;" src="images/user.jpg">
									</a>
									<div class="media-body">
										<h4 class="media-heading">User One</h4>
										I am planning to take an initiative to get the library hours
										of our university extended. I have always wanted to stay
										longer in the university during night and study in its silent
										and calm environment.
									</div>
								</div>
								<div class="media">
									<a class="pull-left" href="#"> <img class="media-object"
										style="width: 64px; height: 64px;" src="images/user.jpg">
									</a>
									<div class="media-body">
										<h4 class="media-heading">User One</h4>
										I am planning to take an initiative to get the library hours
										of our university extended. I have always wanted to stay
										longer in the university during night and study in its silent
										and calm environment.
									</div>
								</div>
								<div class="media">
									<a class="pull-left" href="#"> <img class="media-object"
										style="width: 64px; height: 64px;" src="images/user.jpg">
									</a>
									<div class="media-body">
										<h4 class="media-heading">User One</h4>
										I am planning to take an initiative to get the library hours
										of our university extended. I have always wanted to stay
										longer in the university during night and study in its silent
										and calm environment.
										<div class="media">
											<a class="pull-left" href="#"> <img class="media-object"
												style="width: 64px; height: 64px;" src="images/user.jpg">
											</a>
											<div class="media-body">
												<h4 class="media-heading">User One</h4>
												I am planning to take an initiative to get the library hours
												of our university extended. I have always wanted to stay
												longer in the university during night and study in its
												silent and calm environment.
											</div>
										</div>
										<div class="media">
											<a class="pull-left" href="#"> <img class="media-object"
												style="width: 64px; height: 64px;" src="images/user.jpg">
											</a>
											<div class="media-body">
												<h4 class="media-heading">User One</h4>
												I am planning to take an initiative to get the library hours
												of our university extended. I have always wanted to stay
												longer in the university during night and study in its
												silent and calm environment.
											</div>
										</div>
									</div>
								</div>
								<div class="media">
									<a class="pull-left" href="#"> <img class="media-object"
										style="width: 64px; height: 64px;" src="images/user.jpg">
									</a>
									<div class="media-body">
										<h4 class="media-heading">User One</h4>
										I am planning to take an initiative to get the library hours
										of our university extended. I have always wanted to stay
										longer in the university during night and study in its silent
										and calm environment.
										<div class="media">
											<a class="pull-left" href="#"> <img class="media-object"
												style="width: 64px; height: 64px;" src="images/user.jpg">
											</a>
											<div class="media-body">
												<h4 class="media-heading">User One</h4>
												I am planning to take an initiative to get the library hours
												of our university extended. I have always wanted to stay
												longer in the university during night and study in its
												silent and calm environment.
											</div>
										</div>
										<div class="media">
											<a class="pull-left" href="#"> <img class="media-object"
												style="width: 64px; height: 64px;" src="images/user.jpg">
											</a>
											<div class="media-body">
												<h4 class="media-heading">User One</h4>
												I am planning to take an initiative to get the library hours
												of our university extended. I have always wanted to stay
												longer in the university during night and study in its
												silent and calm environment.
											</div>
										</div>
									</div>
								</div>

								<ul class="pagination pagination-sm pull-right">
									<li><a href="#">&laquo;</a></li>
									<li class="active"><a href="#">1</a></li>
									<li><a href="#">2</a></li>
									<li><a href="#">3</a></li>
									<li><a href="#">4</a></li>
									<li><a href="#">5</a></li>
									<li><a href="#">&raquo;</a></li>
								</ul>

							</div>
						</div>
				</div>
			</div>
			<!-- End main content -->
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
				<a href='<c:out value="${deleteURL}" escapeXml="true"></c:out>'>Delete
					Profile</a><br> <a
					href='<c:out value="${editURL}" escapeXml="true"></c:out>'>Edit
					Profile</a>
			</div>

		</div>

	</div>

	</c:if>

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