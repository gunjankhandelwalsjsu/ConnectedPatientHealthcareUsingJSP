<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<%-- Person Add/Edit logic --%>
	<c:if test="${requestScope.error ne null}">
		<strong style="color: red;"><c:out
				value="${requestScope.error}"></c:out></strong>
	</c:if>
	<c:if test="${requestScope.success ne null}">
		<strong style="color: green;"><c:out
				value="${requestScope.success}"></c:out></strong>
	</c:if>
	<c:url value="/" var="home"></c:url>
        
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
                    <li class="active"><a href="home.html">Home</a>
                    </li>
                    
                    <li class="dropdown">
                      <a class="dropdown-toggle" data-toggle="dropdown" href="#">Topic
                      <span class="caret"></span></a>
                      <ul class="dropdown-menu">
                        <li><a href="#">Food Allergy</a></li>
                        <li><a href="#">Blood Pressure</a></li>
                        <li><a href="#">Sugar</a></li> 
                      </ul>
                    </li>
                    
                    <li><a href="Doctors.jsp">Doctors</a></li>
                    
                    <li><a href="topic.html">Patient</a></li>
                    
                    <li><a href="aboutUs.jsp">About Us</a></li>
                    
                    <li><a href="contact.jsp">Contact Us</a></li>
                    
                    
                    
                    <li><a href="chart.jsp">Pie Chart</a></li>
                </ul>
                <ul class="navbar-brand navbar-right">
                    <li><a href="login.jsp">Login</a></li>
                    <li><a href="MainSignUp.jsp">SignUp</a></li>          
                </ul>
            </div>
            
           
           
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>

    <div class="container">
        
        <div class="page-header" id="site-header">
            <h1>Connected Patient Health Analytics Using Wearables</h1>
        </div>

       <!-- <div class="row">-->

            <div class="col-md-9">
                <!-- Begin Slider -->
                <!--<div class="row carousel-holder">

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
                                    <img class="slide-image" src="images/top.jpg" alt="">
                                </div>
                                <div class="item">
                                    <img class="slide-image" src="images/top2.jpg" alt="">
                                </div>
                                <div class="item">
                                    <img class="slide-image" src="images/top3.jpg" alt="">
                                </div>
                                <div class="item">
                                    <img class="slide-image" src="images/top4.jpg" alt="">
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

                </div>-->
                <!-- end slider -->
                
                <!-- Main Content -->
                <!--<div class="row" style="margin-top: 40px;">

                    <div class="col-sm-4 col-lg-4 col-md-4">
                        <div class="thumbnail" style="padding: 12px;box-shadow: 1px 1px 5px #aaa;">
                            <h4>Hands up if retargeting advertisements ever caused you to buy anything</h4>
                            <img src="images/img1.jpg" alt="">
                            <p>
                                Donec ornare, dui nec faucibus mattis.
                                Velit felis eleifend nfgfhfgim eget leo. Ut luctus volutpat libero in auctor. Praesent tincidunt placerat. Eu luctus purus enim eget leo...
                                <a href="#">Read More</a></p>
                        </div>
                    </div>

                    <div class="col-sm-4 col-lg-4 col-md-4">
                        <div class="thumbnail"  style="padding: 12px;box-shadow: 1px 1px 5px #aaa;">
                            <h4>Hands up if retargeting advertisements ever caused you to buy anything</h4>
                            <img src="images/img2.jpg" alt="">
                            <p>
                                Donec ornare, dui nec faucibus mattis.
                                Velit felis eleifend nisi eget leo. Ut luctus volutpat libero in auctor. Praesent tincidunt placerat. Eu luctus purus enim eget leo...
                                <a href="#">Read More</a></p>
                        </div>
                    </div>

                    <div class="col-sm-4 col-lg-4 col-md-4">
                        <div class="thumbnail" style="padding: 12px;box-shadow: 1px 1px 5px #aaa;">
                            <h4>Hands up if retargeting advertisements ever caused you to buy anything</h4>
                            <img src="images/img1.jpg" alt="">
                            <p>
                                Donec ornare, dui nec faucibus mattis.
                                Velit felis eleifend nisi, eu luctus purus enim eget leo. Ut luctus volutpat libero in auctor. Praesent tincidunt placerat. Eu luctus purus enim eget leo...
                                <a href="#">Read More</a></p>
                        </div>
                    </div>

                    <div class="col-sm-4 col-lg-4 col-md-4">
                        <div class="thumbnail" style="padding: 12px;box-shadow: 1px 1px 5px #aaa;">
                            <h4>Hands up if retargeting advertisements ever caused you to buy anything</h4>
                            <img src="images/img2.jpg" alt="">
                            <p>
                                Donec ornare, dui nec faucibus mattis.
                                Velit felis eleifend nisi, eu luctus purus enim eget leo. Ut luctus volutpat libero in auctor. Praesent tincidunt placerat. Eu luctus purus enim eget leo...
                                <a href="#">Read More</a></p>
                        </div>
                    </div>

                    <div class="col-sm-4 col-lg-4 col-md-4">
                        <div class="thumbnail" style="padding: 12px;box-shadow: 1px 1px 5px #aaa;">
                            <h4>Hands up if retargeting advertisements ever caused you to buy anything</h4>
                            <img src="images/img1.jpg" alt="">
                            <p>
                                Donec ornare, dui nec faucibus mattis.
                                Velit felis eleifend nisi, eu luctus purus enim eget leo. Ut luctus volutpat libero in auctor. Praesent tincidunt placerat. Eu luctus purus enim eget leo...
                                <a href="#">Read More</a></p>
                        </div>
                    </div>

                    <div class="col-sm-4 col-lg-4 col-md-4">
                        <div class="thumbnail" style="padding: 12px;box-shadow: 1px 1px 5px #aaa;">
                            <h4>Hands up if retargeting advertisements ever caused you to buy anything</h4>
                            <img src="images/img2.jpg" alt="">
                            <p>
                                Donec ornare, dui nec faucibus mattis.
                                Velit felis eleifend nisi, eu luctus purus enim eget leo. Ut luctus volutpat libero in auctor. Praesent tincidunt placerat. Eu luctus purus enim eget leo...
                                <a href="#">Read More</a></p>
                        </div>
                    </div>
                </div>
            </div>-->
            
            <!-- End main content -->
            
            <!--<div class="col-md-3">
                <p class="lead">Side Bar Links</p>
                <div class="list-group">
                    <a href="#" class="list-group-item active">
                        <h4 class="list-group-item-heading">Side Bar Link 1</h4>
                        <p class="list-group-item-text">This is content you can add your text here</p>
                      </a>
                    <a href="#" class="list-group-item">Side Bar Link 2</a>
                    <a href="#" class="list-group-item">Side Bar Link 3</a>
                    <a href="#" class="list-group-item">Side Bar Link 4</a>
                    <a href="#" class="list-group-item">Side Bar Link 5</a>
                    <a href="#" class="list-group-item active">Side Bar Link 6</a>                    
                </div>
                
                <button class="btn btn-danger btn-block btn-lg">Button</button>
            </div>

        </div>

    </div>-->
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
