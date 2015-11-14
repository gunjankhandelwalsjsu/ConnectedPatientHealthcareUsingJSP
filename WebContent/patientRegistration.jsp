<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en-us">
<meta charset="utf-8" />
<head>
<title>Free HTML5 CSS3 Responsive Login Signup Form</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
@import url("http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css");
@import url("http://fonts.googleapis.com/css?family=Source+Sans+Pro:400,700");
*{margin:0; padding:0}
body{background:#294072; font-family: 'Source Sans Pro', sans-serif}
.form{width:400px; margin:0 auto; background:#1C2B4A; margin-top:150px}
.header{height:44px; background:#17233B}
.header h2{height:44px; line-height:44px; color:#fff; text-align:center}
.login{padding:0 20px}
.login span.un{width:10%; text-align:center; color:#0C6; border-radius:3px 0 0 3px}
.text{background:#12192C; width:90%; border-radius:0 3px 3px 0; border:none; outline:none; color:#999; font-family: 'Source Sans Pro', sans-serif} 
.text,.login span.un{display:inline-block; vertical-align:top; height:40px; line-height:40px; background:#12192C;}

.btn{height:40px; border:none; background:#0C6; width:100%; outline:none; font-family: 'Source Sans Pro', sans-serif; font-size:20px; font-weight:bold; color:#eee; border-bottom:solid 3px #093; border-radius:3px; cursor:pointer}
ul li{height:40px; margin:15px 0; list-style:none}
.span{display:table; width:100%; font-size:14px;}
.ch{display:inline-block; width:50%; color:#CCC}
.ch a{color:#CCC; text-decoration:none}
.ch:nth-child(2){text-align:right}
/*social*/
.social{height:30px; line-height:30px; display:table; width:100%}
.social div{display:inline-block; width:42%; color:#eee; font-size:12px; text-align:center; border-radius:3px}
.social div i.fa{font-size:16px; line-height:30px}
.fb{background:#3B5A9A; border-bottom:solid 3px #036} .tw{background:#2CA8D2; margin-left:16%; border-bottom:solid 3px #3399CC}
/*bottom*/
.sign{width:90%; padding:0 5%; height:50px; display:table; background:#17233B}
.sign div{display:inline-block; width:50%; line-height:50px; color:#ccc; font-size:14px}
.up{text-align:right}
.up a{display:block; background:#096; text-align:center; height:35px; line-height:35px; width:50%; font-size:16px; text-decoration:none; color:#eee; border-bottom:solid 3px #006633; border-radius:3px; font-weight:bold; margin-left:50%}
@media(max-width:480px){ .form{width:100%}}
</style>
</head>
<body>

	<%-- patient Add/Edit logic --%>
	<c:if test="${requestScope.error ne null}">
		<strong style="color: red;"><c:out
				value="${requestScope.error}"></c:out></strong>
	</c:if>
	<c:if test="${requestScope.success ne null}">
		<strong style="color: green;"><c:out
				value="${requestScope.success}"></c:out></strong>
	</c:if>
	<c:url value="/registerPatient" var="addURL"></c:url>
	<c:url value="/editPerson" var="editURL"></c:url>
	<%-- Add Request --%>
	<div class="form">
<div class="header"><h2>Patient SignUp</h2></div>
     <div class="login">
    <c:if test="${requestScope.patient eq null}">
        <form action='<c:out value="${addURL}"></c:out>' method="post">
           <ul>
        
              <li>
                <span class="un"><i class="fa fa-user"></i></span><input type="text" name="firstName" required class="text" placeholder="First Name"/></li>

              <li>
                <span class="un"><i class="fa fa-user"></i></span><input type="text" name="lastName" required class="text" placeholder="Last Name"/></li>
   			 
   			       <li>
                 <span class="un"><i class="fa fa-user"></i></span><input type="text" name="email" required class="text" placeholder="Email"/></li>
              <li>
                 <span class="un"><i class="fa fa-lock"></i></span><input type="password" name="password" required class="text" placeholder="User Password"/></li>
              <li>
             
				<span class="un"><i class="fa fa-lock"></i></span><input type="text" name="phone" required class="text" placeholder="phone"/></li>

             <li>
                <span class="un"><i class="fa fa-user"></i></span><input type="text" name ="streetAddress" required class="text" placeholder="Street Address"/></li>

             <li>
                <span class="un"><i class="fa fa-user"></i></span><input type="text" name="state" required class="text" placeholder="State"/></li>

             <li>
                <span class="un"><i class="fa fa-user"></i></span><input type="text" name="city" required class="text" placeholder="City"/></li>

             <li>
                <span class="un"><i class="fa fa-user"></i></span><input type="text" name="zipcode" required class="text" placeholder="Zip Code"/></li>

<label>FoodAllergies:</label><br/>

                 <input type="checkbox" name="Allergy" value="soybean"   /><span>soybean</span> <br/> 
   				 <input type="checkbox" name="Allergy" value="milk"   /><span>milk</span> <br/> 
   				<input type="checkbox" name="Allergy" value="gluten"   /><span>gluten</span> <br/> 
   				 <input type="checkbox" name="Allergy" value="egg"   /><span>egg</span> <br/> 
   				 	<input type="checkbox" name="Allergy" value="mustard"   /><span>mustard</span> <br/> 
   				 <input type="checkbox" name="Allergy" value="peanuts"   /><span>peanuts</span> <br/> 
   				<input type="checkbox" name="Allergy" value="nuts"   /><span>nuts</span> <br/> 
   				 <input type="checkbox" name="Allergy" value="fish"   /><span>fish</span> <br/> 		 
   				 <input type="checkbox" name="Allergy" value="coconut"   /><span>coconut</span> <br/> 
   				 <input type="checkbox" name="Allergy" value="seasme seeds"   /><span>seasmeSeeds</span> <br/> 
   				<input type="checkbox" name="Allergy" value="corn"   /><span>corn</span> <br/> 
   				 <input type="checkbox" name="Allergy" value="Flour"   /><span>flour</span> <br/> 
   				 	<input type="checkbox" name="Allergy" value="Whey-powder"   /><span>wheyPowder</span> <br/> 
   				 <input type="checkbox" name="Allergy" value="Cornstarch"   /><span>cornstarch</span> <br/> 
   				<input type="checkbox" name="Allergy" value="Celery"   /><span>celery</span> <br/> 
   				 <input type="checkbox" name="Allergy" value="Candlenut"   /><span>candlenut</span> <br/> 
<label>Disease and history:</label><br/>		 
<input type="checkbox" name="Disease" value="diabetics" /><span>Diabetics</span> <br/>
<input type="checkbox" name="Disease" value="bloodpressure" /><span>Blood Pressure</span>                     
                            
<li>
<input type="submit" value="Sign up" class="btn">
</li>
</ul>





</form>
    </c:if>

</div>
<div class="sign">
<div class="need">Need new account ?</div>
<div class="up"><a href="login.jsp">Login</a></div>

</div>
</div>
<%-- patients List Logic --%>
	<c:if test="${not empty requestScope.patients}">
		<table>
			<tbody>
				<tr>
					<th>ID</th>
					<th>First Name</th>
					<th>Last Name</th>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Email</th>
					<th>Phone</th>
					<th>Street Address</th>
					<th>City</th>
					<th>State</th>
					<th>Zip Code</th>
					<th>Edit</th>			
					<th>Delete</th>
				</tr>
				<c:forEach items="${requestScope.patients}" var="patient">
					<c:url value="/editPerson" var="editURL">
						<c:param name="id" value="${person.id}"></c:param>
					</c:url>
					<c:url value="/deletePerson" var="deleteURL">
						<c:param name="id" value="${patient.id}"></c:param>
					</c:url>
					<tr>
						<td><c:out value="${patient.id}"></c:out></td>
						<td><c:out value="${patient.firstName}"></c:out></td>
						<td><c:out value="${patient.lastName}"></c:out></td>				
						<td><c:out value="${patient.email}"></c:out></td>
						<td><c:out value="${patient.phone}"></c:out></td>
						<td><c:out value="${patient.streetAddress}"></c:out></td>
						<td><c:out value="${patient.state}"></c:out></td>
						<td><c:out value="${patient.city}"></c:out></td>
						<td><c:out value="${patient.zipCode}"></c:out></td>
						
						<td><a
							href='<c:out value="${editURL}" escapeXml="true"></c:out>'>Edit</a></td>
						<td><a
							href='<c:out value="${deleteURL}" escapeXml="true"></c:out>'>Delete</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</c:if>
</body>
</html>