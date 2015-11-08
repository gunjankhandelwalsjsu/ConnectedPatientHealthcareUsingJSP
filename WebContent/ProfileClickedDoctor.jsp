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
                        <li><a href="#">Allergy</a></li>
                        <li><a href="#">Blood Pressure</a></li>
                        <li><a href="#">Sugar</a></li> 
                      </ul>
                    </li>
                    
                    <li><a href="Doctors.jsp">Doctors</a></li>
                    
                    <li><a href="#">Patient</a></li>
                    
                    <li><a href="aboutUs.jsp">About Us</a></li>
                    
                    <li><a href="contact.jsp">Contact Us</a></li>
                              
                    <li><a href="chart.jsp">Pie Chart</a></li>
                    
                    <li><a href="ProfileDoctor.jsp">My profile</a></li>
                    
                </ul>
                
                  <ul class="navbar-brand navbar-right">
                    <li><a href="ProfileDoctor.jsp">My Account</a></li>
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
            <c:if test="${requestScope.error ne null}">
        <strong style="color: red;"><c:out
                value="${requestScope.error}"></c:out></strong>
    </c:if>
    <c:if test="${requestScope.success ne null}">
        <strong style="color: green;"><c:out
                value="${requestScope.success}"></c:out></strong>
    </c:if>
<c:url value="/editPerson" var="editURL"></c:url>
<c:url value="/clickedProfileDoctor" var="clickedProfile"></c:url>


	
	<h3>Your Account</h3>

<p>Hello Doctor, <c:out value="${doctor.firstName}"/>!</p>
<center><h3>	First Name: <input type="text" value="${patient.firstName}" name="firstName"><br></h3></center>
<center><h3>	Last Name: <input type="text" value="${patient.lastName}"   name="lastName"><br></h3></center>
<center><h3>	Email: <input type="text" value="${patient.email}" name="email"><br></h3></center>
<center><h3>	Phone: <input type="text" value="${patient.phone}"   name="phone"><br></h3></center>
<center><h3>	Street Address: <input type="text" value="${patient.streetAddress}" name="streetAddress"><br></h3></center>
<center><h3>	City: <input type="text" value="${patient.city}"   name="city"><br></h3></center>
<center><h3>	Zip code: <input type="text" value="${patient.zipCode}"   name="zipCode"><br></h3></center> 
         
         
		
		  
	</div>	       
				    
		     <div class="col-md-3">
                <p class="lead">Side Bar Links</p>
                <div class="list-group">
                    <a href="#" class="list-group-item active">
                        <h4 class="list-group-item-heading">List Of Doctors</h4>
                      </a>  
                 <c:if test="${not empty patientList}">
                 <c:forEach items="${patientList}" var="patient">
                  <c:url value="/clickedProfileDoctor" var="clickedProfile">
                   <c:param name="id" value="${patient.id}"></c:param>
                  </c:url>
		               
                    <a href="${clickedProfile}" class="list-group-item"><c:out value="${patient.firstName}"></c:out></a>                            
                 
                            
                 </c:forEach>
                </c:if>
				
                				
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