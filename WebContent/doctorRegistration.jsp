<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
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

	<%-- Person Add/Edit logic --%>
	<c:if test="${requestScope.error ne null}">
		<strong style="color: red;"><c:out
				value="${requestScope.error}"></c:out></strong>
	</c:if>
	<c:if test="${requestScope.success ne null}">
		<strong style="color: green;"><c:out
				value="${requestScope.success}"></c:out></strong>
	</c:if>
	<c:url value="/addPerson" var="addURL"></c:url>
	<c:url value="/editPerson" var="editURL"></c:url>

	

	<%-- Add Request --%>
<div class="header"><h2>Doctor SignUp</h2></div>
<div class="login">
    <c:if test="${requestScope.person eq null}">
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
                <span class="un"><i class="fa fa-user"></i></span><input type="text" name="Zipcode" required class="text" placeholder="Zip Code"/></li>

                <label>Speciality:</label><br/>

   				<input type="checkbox" name="Allergy" value="Allergy"  checked /><span>Allergy</span> <br/> 			
                <input type="checkbox" name="diabetics" value="diabetics" /><span>Diabetics</span> <br/>
                <input type="checkbox" name="bloodpressure" value="bloodpressure" /><span>Blood Pressure</span>                
                 
              <li>
                  <input type="submit" value="Sign Up" class="btn"></li>
            </ul>         
        </form>
        <div class="sign">
         <div class="need">Need new account ?</div>
         <div class="up"><a href="login.jsp">Login</a></div>
       </div>
    </c:if>
    </div>
    


	
	
</body>
</html>