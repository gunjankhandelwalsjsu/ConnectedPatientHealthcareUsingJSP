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

				<li><a href="LinearChart.jsp">Pie Chart</a></li>

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
                <h1 style="margin-top: 0"><center>Blood Pressure</center></h1>
                <div class="clearfix" style="text-align: justify; padding: 30px 20px; background: #eee; border: 2px solid #bbb; border-radius: 10px;">
                    <h4>What is blood pressure?</h4>
                    <p>
                    
When your heart beats, it pumps blood round your body to give it the energy and oxygen it needs. As the blood moves, it pushes against the sides of the blood vessels. The strength of this pushing is your blood pressure. If your blood pressure is too high, it puts extra strain on your arteries (and your heart) and this may lead to heart attacks and strokes.
                    </p>
                    
                   <h4> How you can tell if you have high blood pressure</h4>
                    <p>
Having high blood pressure (hypertension) is not usually something that you feel or notice. It does not tend to produce obvious signs or symptoms. The only way to know what your blood pressure is, is to have it measured.

Blood pressure is measured in ‘millimetres of mercury’ (mmHg) and is written as two numbers. For example, if your reading is 120/80mmHg, your blood pressure is ‘120 over 80’.
                    </p>
                    
                    <h4>What do the numbers mean?</h4>
                    <p>
                    	
Every blood pressure reading consists of two numbers or levels. They are shown as one number on top of the other.

The first (or top) number is your systolic blood pressure. It is the highest level your blood pressure reaches when your heart beats.

The second (or bottom) number is your diastolic blood pressure. It is the lowest level your blood pressure reaches as your heart relaxes between beats.
                    </p>
                    <h4>Keep your blood pressure low</h4>
                    <p>
Even if you do not have high blood pressure at the moment, it is important to keep your blood pressure as low as you can. The higher your blood pressure, the higher your risk of health problems.

For example, a blood pressure of 135 over 85 may be “normal” but someone with this reading is twice as likely to have a heart attack or stroke as someone with a reading of 115 over 75.
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
