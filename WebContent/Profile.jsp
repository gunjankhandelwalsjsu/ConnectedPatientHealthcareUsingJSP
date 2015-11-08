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

<title>Straight Talk..because every opinion matters</title>

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

				<li><a href="Profile.jsp">My profile</a></li>

			</ul>

			<ul class="navbar-brand navbar-right">
				<li><a href="Profile.jsp">My Account</a></li>
				<li><a href="MainSignUp.jsp">Sign Out</a></li>

			</ul>
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
		
		<c:url value="/clickedProfile" var="clickedProfile">
			<c:param name="id" value="${doctor.id}"></c:param>
		</c:url>
		<c:url value="/deletePerson" var="deleteURL">
			<c:param name="id" value="${person.id}"></c:param>
		</c:url>
		<c:url value="/EditPatientProfile.jsp" var="editURL">
			<c:param name="id" value="${Patient.id}"></c:param>
		</c:url>

		<div class="row">
			<div class="col-md-9">

				<h3>Your Account</h3>
				<h1 style="margin-top: 0">
					<center>
						<p>
							Hello Patient,
							<c:out value="${Patient.firstName}" />
							!
						</p>
					</center>
				</h1>
				<div class="clearfix"
					style="text-align: justify; padding: 20px; background: #eee; border: 2px solid #bbb; border-radius: 10px;">
					<img src="images/doctor2.jpg" alt="Image"
						style="float: center; margin-right: 15px; margin-bottom: 15px;" />
					<p></p>
					<br /> <br /> <br />
					<%-- General Info--%>
					<c:if test="${Patient ne null}">
						<center>
							<h3>General Info</h3>
						</center>
						<ul>
							<li><b> Name:</b>${Patient.firstName} ${Patient.lastName}</li>

						</ul>
						<center>
							<h3>Contact Info</h3>
						</center>
						<address>
							<ul>
								<li><b> Email:</b>${Patient.email}</li>
								<li><b> Phone:</b> ${Patient.phone}</li>
								<li><b> Address:</b>${Patient.streetAddress}<br>${Patient.city}<br>${Patient.state}<br>${Patient.zipCode}</li>
							</ul>
						</address>

						<br />
						<br />

						<center>
							<h3>Health Information</h3>
						</center>

						<p>Allergy
						<p>
							<c:if test="${Patient.allergy ne null}">
								<c:forEach items="${Patient.allergy}" var="allergy">
									<ul>
										<li>
											<p>Allergy: ${allergy}</p>
										</li>
									</ul>
								</c:forEach>
							</c:if>
						<center>
							<h3>Doctor Information</h3>
						</center>
						<ul>
							<li><b> Id:</b>${Patient.dId}</li>
							<li><b> Name:</b>${Patient.dName}</li>
							<li><b> Email:</b>${Patient.dMailId}</li>

						</ul>
					</c:if>
				</div>
			</div>

			<%-- Side Bar Link --%>

			<div class="col-md-3">
				<p class="lead"></p>
				<div class="list-group">
					<a href="#" class="list-group-item active">
						<h4 class="list-group-item-heading">List Of Doctors</h4>
					</a>
					<c:if test="${not empty doctors}">
						<c:forEach items="${doctors}" var="doctor">
							<a href="${clickedProfile}" class="list-group-item"><c:out
									value="${doctor.firstName}"></c:out></a>
						</c:forEach>
					</c:if>
					<button class="btn btn-danger btn-block btn-lg">Add Doctor</button>
				</div>
			</div>
		</div>


		<%-- Edit Request --%>
		<c:if test="${Patient ne null}">
			<form action='<c:out value="${editURL}"></c:out>' method="post">
				ID: <input type="text" value="${Patient.id}" readonly="readonly"
					name="id"><br>
				<center>
					<h3>
						First Name: <input type="text" value="${Patient.firstName}"
							name="firstName"><br>
					</h3>
				</center>
				<center>
					<h3>
						Last Name: <input type="text" value="${Patient.lastName}"
							name="lastName"><br>
					</h3>
				</center>
				<center>
					<h3>
						Email: <input type="text" value="${Patient.email}" name="email"><br>
					</h3>
				</center>
				<center>
					<h3>
						Phone: <input type="text" value="${Patient.phone}" name="phone"><br>
					</h3>
				</center>
				<center>
					<h3>
						Street Address: <input type="text"
							value="${Patient.streetAddress}" name="streetAddress"><br>
					</h3>
				</center>
				<center>
					<h3>
						City: <input type="text" value="${Patient.city}" name="city"><br>
					</h3>
				</center>
				<center>
					<h3>
						Zip code: <input type="text" value="${Patient.zipCode}"
							name="zipCode"><br>
					</h3>
				</center>
				<p>Allergy
				<p>
					<c:forEach items="${Patient.allergy}" var="allergy">
						<p>Allergy: ${allergy}</p>
					</c:forEach>
				<center>
					<h3>
						Doctor-Name: <input type="text" value="${Patient.dName}"
							name="doctorName"><br>
					</h3>
				</center>
				<center>
					<h3>
						Doctor-Mail-id: <input type="text" value="${Patient.dMailId}"
							name="doctorMailId"><br>
					</h3>
				</center>
				<center>
					<h3>
						Doctor-id: <input type="text" value="${Patient.dId}"
							name="doctorId"><br>
					</h3>
				</center>
				<center>
					<h3>
						Doctor: <input type="text" value="${Patient.doctor.firstName}"
							name="doctorName"><br>
					</h3>
				</center>
				<strong>Doctor</strong> ${Patient.doctor.firstName} <br> <br>
				<center>
					<h3>
						<input type="submit" value="Save">
					</h3>
				</center>
			</form>
		</c:if>


		
		<a href='<c:out value="${deleteURL}" escapeXml="true"></c:out>'>Delete Profile</a>
		<a href='<c:out value="${editURL}" escapeXml="true"></c:out>'>Edit Profile</a>
		
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