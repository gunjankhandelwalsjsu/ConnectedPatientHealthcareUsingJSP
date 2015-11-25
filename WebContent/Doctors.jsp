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
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                    <span class="sr-only">Navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <!--<a class="navbar-brand" href="index.html">Straight Talk</a>-->
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse navbar-ex1-collapse">
                <ul class="nav navbar-nav">
                    <li class="active"><a href="home.jsp">Home</a>
                    </li>
                    
                    <li class="dropdown">
                      <a class="dropdown-toggle" data-toggle="dropdown" href="#">Topic
                      <span class="caret"></span></a>
                       <ul class="dropdown-menu">
                        <li><a href="FoodAllergy.jsp">Food Allergies</a></li>
                        <li><a href="BloodPressure.jsp">Blood Pressure</a></li>
                        <li><a href="Diabetics.jsp">Diabetics</a></li> 
                      </ul>
                    </li>
                    
                    <li><a href="Doctors.jsp">Doctors</a></li>
                    
                    
                    <li><a href="aboutUs.jsp">About Us</a>
                    </li>
                    <li><a href="contact.jsp">Contact Us</a>
                    
                    </li>
                </ul>
                 <div class="col-md-3">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="Profile.jsp"><span
							class="glyphicon glyphicon-user"></span> My Account</a></li>
				<li><a href="${logOutURL}"><span
							class="glyphicon glyphicon-log-out"></span> Sign Out</a></li>
				</ul>
			</div>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>

    <div class="container">
        
        <div class="page-header" id="site-header">
            <h1>Connected Patient Health Analytics Using Wearables</h1>
        </div>

        <div class="row">

            <div class="col-md-9">
                <!-- Begin Slider -->
                <div class="row carousel-holder">

                    <div class="col-md-12">
                        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                            <ol class="carousel-indicators">
                                <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                                <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                                <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                                <li data-target="#carousel-example-generic" data-slide-to="3"></li>
                            </ol>
                            <div class="carousel-inner">
                                <div class="item active">
                                    <img class="slide-image" src="images/slider1.jpg" alt="">
                                </div>
                                <div class="item">
                                    <img class="slide-image" src="images/slider2.jpg" alt="">
                                </div>
                                <div class="item">
                                    <img class="slide-image" src="images/slider3.jpg" alt="">
                                </div>
                                <div class="item">
                                    <img class="slide-image" src="images/slider4.jpg" alt="">
                                </div>
                            </div>
                            <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
                                <span class="glyphicon glyphicon-chevron-left"></span>
                            </a>
                            <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
                                <span class="glyphicon glyphicon-chevron-right"></span>
                            </a>
                        </div>
                    </div>

                </div>
                <!-- end slider -->
                
                <!-- Main Content -->
                <div class="row" style="margin-top: 40px;">

                    <div class="col-sm-4 col-lg-4 col-md-4">
                        <div class="thumbnail" style="padding: 12px;box-shadow: 1px 1px 5px #aaa;">
                            <h4><center><a href="DoctorMark.html">Dr.Mark Devis</a></center></h4>
                            <img src="images/doctor1.jpg" alt="">
                            <p>
                                Dr.Mark's primary interests are in the role of how viral infections play in the development of allergic diseases, like asthma.<a href="DoctorMark.html">Read More</a></p>
                        </div>
                    </div>

                    <div class="col-sm-4 col-lg-4 col-md-4">
                        <div class="thumbnail"  style="padding: 12px;box-shadow: 1px 1px 5px #aaa;">
                            <h4><center><a href="DoctorAngel.html">Dr.Angel Cruz</a></center></h4>
                            <img src="images/doctor2.jpg" alt="">
                            <p>
                                Dr.Angel's primary interests are in the role of how viral infections play in the development of allergic diseases, like asthma.<a href="DoctorAngel.html">Read More</a></p>
                        </div>
                    </div>

                    <div class="col-sm-4 col-lg-4 col-md-4">
                        <div class="thumbnail" style="padding: 12px;box-shadow: 1px 1px 5px #aaa;">
                            <h4><center><a href="DoctorVelentine.html">Dr.Venentine D'mello</a></center></h4>
                            <img src="images/doctor3.jpg" alt="">
                            <p>
                                Dr.Velentine's primary interests are in the role of how viral infections play in the development of allergic diseases, like asthma.<a href="DoctorVelentine.html">Read More</a></p>
                        </div>
                    </div>

                    <div class="col-sm-4 col-lg-4 col-md-4">
                        <div class="thumbnail" style="padding: 12px;box-shadow: 1px 1px 5px #aaa;">
                            <h4><center><a href="DoctorCole.html">Dr.Cole Abedeyor</a></center></h4>
                            <img src="images/doctor4.jpg" alt="">
                            <p>
                                Dr.Cole's primary interests are in the role of how viral infections play in the development of allergic diseases, like asthma.<a href="DoctorCole.html">Read More</a></p>
                        </div>
                    </div>

                    <div class="col-sm-4 col-lg-4 col-md-4">
                        <div class="thumbnail" style="padding: 12px;box-shadow: 1px 1px 5px #aaa;">
                            <h4><center><a href="DoctorJeson.html">Dr.Jeson Depaul</a></center></h4>
                            <img src="images/doctor3.jpg" alt="">
                            <p>
                                Dr.Jeson's primary interests are in the role of how viral infections play in the development of allergic diseases, like asthma.<a href="DoctorJeson.html">Read More</a></p>
                        </div>
                    </div>

                    <div class="col-sm-4 col-lg-4 col-md-4">
                        <div class="thumbnail" style="padding: 12px;box-shadow: 1px 1px 5px #aaa;">
                            <h4><center><a href="DoctorTony.html">Dr.Tonny DiMichelle</a></center></h4>
                            <img src="images/doctor6.jpg" alt="">
                            <p>
                                Dr.Tony's primary interests are in the role of how viral infections play in the development of allergic diseases, like asthma.<a href="DoctorTony.html">Read More</a></p>
                        </div>
                    </div>
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
