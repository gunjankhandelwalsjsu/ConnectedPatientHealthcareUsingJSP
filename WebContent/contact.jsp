<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

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
                    <h1 style="margin-top: 0"><center>Contact Us</center></h1>
                    <div class="clearfix" style="text-align: justify">
                        <form class="form-horizontal" style="padding: 30px 20px; background: #eee; border: 2px solid #bbb; border-radius: 10px;">
                                <div class="form-group">
                                    <label for="inputName" class="col-lg-2 control-label">Name</label>
                                    <div class="col-lg-10">
                                        <input type="text" class="form-control" id="inputName" placeholder="Your Good Name">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="inputEmail" class="col-lg-2 control-label">Email</label>
                                    <div class="col-lg-10">
                                        <input type="text" class="form-control" id="inputEmail" placeholder="Email">
                                    </div>
                                </div>
                                
                                <div class="form-group">
                                    <label for="message" class="col-lg-2 control-label">Message</label>
                                    <div class="col-lg-10">
                                        <textarea class="form-control" rows="3" id="message"></textarea>
                                        <span class="help-block">Message help text</span>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-lg-10 col-lg-offset-2">
                                        <button type="submit" class="btn btn-success">Submit</button>
                                    </div>
                                </div>
                        </form>                  
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
