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
                    <li><a href="home.jsp">Home</a>
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
                    
                    
                    <li><a href="aboutUs.jsp">About Us</a></li>
                    
                    <li><a href="contact.jsp">Contact Us</a></li>
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
                <h1 style="margin-top: 0"><center>About Us</center></h1>
                <div class="clearfix" style="text-align: justify; padding: 30px 20px; background: #eee; border: 2px solid #bbb; border-radius: 10px;">
                    <p>
                        I am planning to take an initiative to get the library hours of our university extended. I have always wanted to stay longer in the university during night and study in its silent and calm environment. I believe night is the best time we can finish all our assignments and study with some concentration during this month of exam. We students who are living an independent life out here will certainly have to manage our time with all other daily work through the day as well and hence night is the best time I personally can spend on studies. I would like to gather opinions from students from different discipline and hence decided to blog this post. I could only think of advantages from this change. Isn't this going to help all the students who would like to have extended hours of peaceful studies at the library?
                    </p>
                    <p>
                        I am planning to take an initiative to get the library hours of our university extended. I have always wanted to stay longer in the university during night and study in its silent and calm environment. I believe night is the best time we can finish all our assignments and study with some concentration during this month of exam. We students who are living an independent life out here will certainly have to manage our time with all other daily work through the day as well and hence night is the best time I personally can spend on studies. I would like to gather opinions from students from different discipline and hence decided to blog this post. I could only think of advantages from this change. Isn't this going to help all the students who would like to have extended hours of peaceful studies at the library?
                    </p>
                    <p>
                        I am planning to take an initiative to get the library hours of our university extended. I have always wanted to stay longer in the university during night and study in its silent and calm environment. I believe night is the best time we can finish all our assignments and study with some concentration during this month of exam. We students who are living an independent life out here will certainly have to manage our time with all other daily work through the day as well and hence night is the best time I personally can spend on studies. I would like to gather opinions from students from different discipline and hence decided to blog this post. I could only think of advantages from this change. Isn't this going to help all the students who would like to have extended hours of peaceful studies at the library?
                    </p>
                    <p>
                        I am planning to take an initiative to get the library hours of our university extended. I have always wanted to stay longer in the university during night and study in its silent and calm environment. I believe night is the best time we can finish all our assignments and study with some concentration during this month of exam. We students who are living an independent life out here will certainly have to manage our time with all other daily work through the day as well and hence night is the best time I personally can spend on studies. I would like to gather opinions from students from different discipline and hence decided to blog this post. I could only think of advantages from this change. Isn't this going to help all the students who would like to have extended hours of peaceful studies at the library?
                    </p>
                    <p>
                        I am planning to take an initiative to get the library hours of our university extended. I have always wanted to stay longer in the university during night and study in its silent and calm environment. I believe night is the best time we can finish all our assignments and study with some concentration during this month of exam. We students who are living an independent life out here will certainly have to manage our time with all other daily work through the day as well and hence night is the best time I personally can spend on studies. I would like to gather opinions from students from different discipline and hence decided to blog this post. I could only think of advantages from this change. Isn't this going to help all the students who would like to have extended hours of peaceful studies at the library?
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
