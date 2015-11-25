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
                <h1 style="margin-top: 0">Diabetics</h1>
                <div class="clearfix" style="text-align: justify; padding: 30px 20px; background: #eee; border: 2px solid #bbb; border-radius: 10px;">
                    <p>
                    	Diabetes, often referred to by doctors as diabetes mellitus, describes a group of metabolic diseases in which the person has high blood glucose (blood sugar), either because insulin production is inadequate, or because the body's cells do not respond properly to insulin, or both. Patients with high blood sugar will typically experience polyuria (frequent urination), they will become increasingly thirsty (polydipsia) and hungry (polyphagia).
                    </p>
                    
                    <h1>Types of Diabetics</h1>
                    <h4>Type 1 diabetes</h4>
                    <p>
                    	

The body does not produce insulin. Some people may refer to this type as insulin-dependent diabetes, juvenile diabetes, or early-onset diabetes. People usually develop type 1 diabetes before their 40th year, often in early adulthood or teenage years.

Type 1 diabetes is nowhere near as common as type 2 diabetes. Approximately 10% of all diabetes cases are type 1.

Patients with type 1 diabetes will need to take insulin injections for the rest of their life. They must also ensure proper blood-glucose levels by carrying out regular blood tests and following a special diet.
                    </p>
                    
                   <h4><b>Type 2 diabetics</b></h4>
                    <p>
                    	

The body does not produce enough insulin for proper function, or the cells in the body do not react to insulin (insulin resistance).

Approximately 90% of all cases of diabetes worldwide are type 2.

Diabetes patient measuring glucose level in bloodMeasuring the glucose level in blood
Some people may be able to control their type 2 diabetes symptoms by losing weight, following a healthy diet, doing plenty of exercise, and monitoring their blood glucose levels. However, type 2 diabetes is typically a progressive disease - it gradually gets worse - and the patient will probably end up have to take insulin, usually in tablet form.

Overweight and obese people have a much higher risk of developing type 2 diabetes compared to those with a healthy body weight. People with a lot of visceral fat, also known as central obesity, belly fat, or abdominal obesity, are especially at risk. Being overweight/obese causes the body to release chemicals that can destabilize the body's cardiovascular and metabolic systems.

Being overweight, physically inactive and eating the wrong foods all contribute to our risk of developing type 2 diabetes. Drinking just one can of (non-diet) soda per day can raise our risk of developing type 2 diabetes by 22%, researchers from Imperial College London reported in the journal Diabetologia. The scientists believe that the impact of sugary soft drinks on diabetes risk may be a direct one, rather than simply an influence on body weight.

The risk of developing type 2 diabetes is also greater as we get older. Experts are not completely sure why, but say that as we age we tend to put on weight and become less physically active. Those with a close relative who had/had type 2 diabetes, people of Middle Eastern, African, or South Asian descent also have a higher risk of developing the disease.
                    </p>
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
