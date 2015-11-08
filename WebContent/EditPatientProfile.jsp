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

			<ul class="navbar-brand navbar-right">
				<li><a href="ProfileDoctor.jsp">My Account</a></li>
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
		<c:url value="/displayPatientList" var="displayURL">
			<c:param name="id" value="${doctor.id}"></c:param>
		</c:url>
		<c:url value="/editPatient" var="editURL">
			<c:param name="id" value="${Patient.id}"></c:param>
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
							Hello patient,
							<c:out value="${Patient.firstName}" />

						</p>
					</center>
				</h1>
				<div class="clearfix"
					style="text-align: justify; padding: 20px; background: #eee; border: 2px solid #bbb; border-radius: 10px;">
					<img src="images/doctor2.jpg" alt="Image"
						style="float: left; margin-right: 15px; margin-bottom: 15px;" />


					<p></p>
					<br /> <br /> <br /> <br /> <br /> <br /> <br />
					<%-- Edit Request --%>
					<c:if test="${Patient ne null}">
						<form action='<c:out value="${editURL}"></c:out>' method="post">

							<h3>
								First Name: <input type="text" value="${Patient.firstName}"
									name="firstName"><br>
							</h3>

							<h3>
								Last Name: <input type="text" value="${Patient.lastName}"
									name="lastName"><br>
							</h3>

							<h3>
								Email: <input type="text" value="${Patient.email}" name="email"><br>
							</h3>

							<h3>
								Phone: <input type="text" value="${Patient.phone}" name="phone"><br>
							</h3>

							<h3>
								Street Address: <input type="text"
									value="${Patient.streetAddress}" name="streetAddress"><br>
							</h3>

							<h3>
								City: <input type="text" value="${Patient.city}" name="city"><br>
							</h3>

							<h3>
								Zip code: <input type="text" value="${Patient.zipCode}"
									name="zipCode"><br>
							</h3>
							<center>
								<h3>Health Information</h3>
							</center>
							<p>
							<h3>Allergy</h3>
							</p>
							<!-- Allergy checkBox content -->
							
							<label>FoodAllergies:</label><br />
							<ul class="checkbox-grid">

								<li><input type="checkbox" name="Allergy" value="soybean" /><span>soybean</span>
									<br /></li>
								<li><input type="checkbox" name="Allergy" value="milk" /><span>milk</span>
									<br /></li>
								<li><input type="checkbox" name="Allergy" value="gluten" /><span>gluten</span>
									<br /></li>
								<li><input type="checkbox" name="Allergy" value="egg" /><span>egg</span>
									<br /></li>
								<li><input type="checkbox" name="Allergy" value="mustard" /><span>mustard</span>
									<br /></li>
								<li><input type="checkbox" name="Allergy" value="peanuts" /><span>peanuts</span>
									<br /></li>
								<li><input type="checkbox" name="Allergy" value="nuts" /><span>nuts</span>
									<br /></li>
								<li><input type="checkbox" name="Allergy" value="fish" />
								<span>fish</span>
								<br /></li>
								<li><input type="checkbox" name="Allergy" value="coconut" /><span>coconut</span>
									<br /></li>
								<li><input type="checkbox" name="Allergy"
									value="seasme seeds" /><span>seasmeSeeds</span> <br /></li>
								<li><input type="checkbox" name="Allergy" value="corn" /><span>corn</span>
									<br /></li>
								<li><input type="checkbox" name="Allergy" value="Flour" /><span>flour</span>
									<br/></li>
								<li><input type="checkbox" name="Allergy"
									value="Whey-powder" /><span>wheyPowder</span> <br /></li>
								<li><input type="checkbox" name="Allergy"
									value="Cornstarch" /><span>cornstarch</span> <br /></li>
								<li><input type="checkbox" name="Allergy" value="Celery" /><span>celery</span>
									<br /></li>
								<li><input type="checkbox" name="Allergy" value="Candlenut" /><span>candlenut</span>
									<br /></li>
							</ul>
							<!-- Allergy checkBox content -->
							<c:forEach items="${Patient.allergy}" var="allergy">
								<p>Allergy: ${allergy}</p>
							</c:forEach>
							<center>
								<h3>Doctor Information</h3>
							</center>
							<h3>
								Name: <input type="text" value="${Patient.dName}"
									readonly="readonly" name="doctorName"><br>
							</h3>

							<h3>
								Email: <input type="text" value="${Patient.dMailId}"
									readonly="readonly" name="doctorMailId"><br>
							</h3>

							<h3>
								Id: <input type="text" value="${Patient.dId}"
									readonly="readonly" name="doctorId"><br>
							</h3>

							<br> <br>
							<h3>
								<input type="submit" value="Save">
							</h3>
						</form>
					</c:if>


				</div>
			</div>

			<!-- End main content -->
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