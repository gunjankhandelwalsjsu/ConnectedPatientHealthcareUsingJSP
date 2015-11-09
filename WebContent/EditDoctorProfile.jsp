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

				<li><a href="contact.jsp">Contact Us</a></li>

				<li><a href="ProfileDoctor.jsp">My profile</a></li>

			</ul>

			<div class="col-md-3">
				<ul class="nav nav-pills nav-stacked">
					<li><a href="Profile.jsp"><span
							class="glyphicon glyphicon-user"></span> My Account</a></li>
					<li><a href="MainSignUp.jsp"><span
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
		<c:url value="/editDoctor" var="editURL">
			<c:param name="id" value="${doctor.id}"></c:param>
		</c:url>
		<c:url value="/clickedProfileDoctor" var="clickedProfile"></c:url>

		<c:url value="/deletePerson" var="deleteURL">
			<c:param name="id" value="${person.id}"></c:param>
		</c:url>

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
					<img src="images/doctor2.jpg" alt="Image"
						style="float: left; margin-right: 15px; margin-bottom: 15px;" />
					<p>Dr.Angel's primary interests are in the role of how viral
						infections play in the development of allergic diseases, such as
						asthma. He has an active NIH sponsored research program studying
						these issues, with a focus on the role of viruses in the
						development of asthma and food allergies. Clinically, Dr. Jeson's
						interests are asthma, allergic rhinitis, angioedema, and
						anaphylaxis.</p>

					<p></p>
					<br /> <br /> <br /> <br /> <br />
					<%-- Edit Request --%>
					<c:if test="${doctor ne null}">
						<center>
							<h3>General Info</h3>
						</center>
						<form action='<c:out value="${editURL}"></c:out>' method="post">
							<%--       ID: <input type="text" value="${doctor.id}" readonly="readonly" name="id"><br> --%>
							<p>
								First Name: <input type="text" value="${doctor.firstName}"
									name="firstName"><br>
							</p>
							<p>
								Last Name: <input type="text" value="${doctor.lastName}"
									name="lastName"><br>
							</p>




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

							<br> <br> <label>Your existing Specializations
								are:</label>
							<c:if test="${doctor.specialization ne null}">
								<c:forEach items="${doctor.specialization}" var="specialization">

									<ul>
										<li>
											<p>${specialization},</p>
										</li>
									</ul>
								</c:forEach>
							</c:if>
							<br>
							<ul class="checkbox-grid">
								<li><input type="checkbox" name="Specialization"
									value="Diabetes" /><span>Diabetes</span> <br /></li>
								<li><input type="checkbox" name="Specialization"
									value="Blood Pressure" /><span>Blood Pressure</span> <br /></li>

							</ul>
							<br>
							<br>




							<center>
								<h3>Contact Info</h3>
							</center>
							<p>
								Email: <input type="text" value="${doctor.email}" readonly
									name="email"><br>
							</p>
							<p>
								Phone: <input type="text" value="${doctor.phone}" name="phone"><br>
							</p>
							<p>
								Street Address: <input type="text"
									value="${doctor.streetAddress}" name="streetAddress"><br>
							</p>
							<p>
								City: <input type="text" value="${doctor.city}" name="city"><br>
							</p>
							<p>
								Zip code: <input type="text" value="${doctor.zipCode}"
									name="zipCode"><br>
							</p>
							<p>
								<input type="submit" value="Save">
							</p>
						</form>
					</c:if>
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