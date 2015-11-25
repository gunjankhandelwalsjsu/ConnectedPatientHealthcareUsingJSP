<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

     <title>Connected Patient Health Analytics Using Wearables</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Add custom CSS here -->
    <link href="css/style.css" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Bevan' rel='stylesheet' type='text/css'>

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

				<li><a href="Doctors.jsp">Doctors</a></li>


				<li><a href="aboutUs.jsp">About Us</a></li>

				<li><a href="contact.jsp">Contact Us</a></li>


				<li><a href="Profile.jsp">My profile</a></li>

			</ul>
			<div class="col-md-3">
				<ul class="nav nav-pills nav-stacked">
					<li><a href="Profile.jsp"><span
							class="glyphicon glyphicon-user"></span> My Account</a></li>
							<c:url value="/logout" var="logOutURL">
							</c:url>
							
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
                <h1 style="margin-top: 0"><center>Food Allergy</center></h1>
                <div class="clearfix" style="text-align: justify; padding: 30px 20px; background: #eee; border: 2px solid #bbb; border-radius: 10px;">
                    <p>
                    Food allergy is a serious medical condition affecting up to 15 million people in the United States, including 1 in 13 children.
                    </p>
                   <h5><b>What is Food Allergy?</b></h5>
                    <p>
The job of the body’s immune system is to identify and destroy germs (such as bacteria or viruses) that make you sick. A food allergy results when the immune system mistakenly targets a harmless food protein – an allergen – as a threat and attacks it.
                     </p>
                     
                     <p>Unlike other types of food disorders, such as intolerances, food allergies are “IgE mediated.” This means that your immune system produces abnormally large amounts of an antibody called immunoglobulin E — IgE for short. IgE antibodies fight the “enemy” food allergens by releasing histamine and other chemicals, which trigger the symptoms of an allergic reaction. 
                     </p>
                     <h5><b>Symptoms:</b></h5>
                     <p>
						An allergic reaction to food can affect the skin, the gastrointestinal tract, the respiratory tract, and, in the most serious cases, the cardiovascular system. Reactions can range from mild to severe, including the potentially life-threatening condition known as anaphylaxis.
					</p>
					<h5><b>Mild symptoms may include one or more of the following:</b></h5>
					<p>
					<ul>
						<li>Redness of the skin or around the eyes</li>
						<li>Itchy mouth or ear canal </li>
						<li>Nausea or vomiting </li>
						<li>Diarrhea </li>
						<li>Stomach pain </li>
					</ul>
					</p>
					<h5><b>Severe symptoms may include one or more of the following:</b></h5>
					<p>
						
						<ul>
							<li>Obstructive swelling of the lips, tongue, and/or throat</li>
							<li>Trouble swallowing</li>
							<li>Shortness of breath or wheezing</li>
							<li>Turning blue</li>
							<li>Drop in blood pressure (feeling faint, confused, weak, passing out)</li>
						</ul>
					</p>             
                </div>
            </div>
            
            <!-- End main content -->
            
            <div class="col-md-3">
                <p></p><br/>
                <p></p>
                                <div class="list-group">
                    <a href="Doctors.jsp" class="list-group-item active">
                        <h4 class="list-group-item-heading">Doctors</h4>  
                      </a>
                    <a href="patientRegistration.jsp" class="list-group-item">Patient</a>
                    <a href="aboutUs.jsp" class="list-group-item">About us</a>
                
                    <a href="contact.jsp" class="list-group-item active">Contact us</a>                    
                </div>
                
                <a href="chart.jsp"><button class="btn btn-danger btn-block btn-lg" >Analytics</button></a>
            </div>

        </div>

    </div>
    <!-- /.container -->

    <div class="container">

        <hr>

        <footer>
            <div class="row">
                <div class="col-lg-12">
                    <p class="text-right">Copyright &copy; Company 2014 - Hardik Shah
                    </p>
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
