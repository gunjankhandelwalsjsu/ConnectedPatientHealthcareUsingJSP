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
                     <li class="dropdown">
                      <a class="dropdown-toggle" data-toggle="dropdown" href="#">Topic
                      <span class="caret"></span></a>
                      <ul class="dropdown-menu">
                        <li><a href="#">Food Allergies</a></li>
                        <li><a href="#">Blood Pressure</a></li>
                        <li><a href="#">Sugar</a></li> 
                      </ul>
                    </li>
                    
                    <li><a href="Doctors.jsp">Doctors</a></li>
                    
                    <li><a href="#">Patient</a></li>
                    
                    <li><a href="aboutUs.jsp">About Us</a></li>
                    
                    <li><a href="contact.jsp">Contact Us</a></li>
                
                    <li><a href="chart.jsp">Pie Chart</a></li>
                </ul>
                  <ul class="navbar-brand navbar-right">
                   <li><a href="Profile.jsp">My Account</a></li>
                    <li><a href="MainSignUp.jsp">Sign Out</a></li>
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

        <div class="row">

            <div class="col-md-9">
                <h1 style="margin-top: 0">Doctors Graph</h1>
                <div class="clearfix" style="text-align: justify; padding: 20px; background: #eee; border: 2px solid #bbb; border-radius: 10px;">                    
                    <canvas id="canvas" height="250" width="250" style="margin: 0 auto;"></canvas>   
                    
                    <a class="btn btn-block btn-primary" href="topic.html" style="margin-top: 20px;">&leftarrow; Go Back</a>
                </div>
            </div>
            
            <!-- End main content -->
            
            <div class="col-md-3">
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
    <script src="js/Chart.min.js"></script>
    
    <script>

		var pieData = [
				{
					value: 30,
					color:"#F38630"
				},
				{
					value : 50,
					color : "#E0E4CC"
				},
				{
					value : 100,
					color : "#69D2E7"
				}
			
			];

	var myPie = new Chart(document.getElementById("canvas").getContext("2d")).Pie(pieData);
	
	</script>

</body>

</html>
