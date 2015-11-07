<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
	<c:url value="/login" var="loginURL"></c:url>	
	<c:url value="/addPerson" var="addURL"></c:url>
	<c:url value="/editPerson" var="editURL"></c:url>
	<c:url value="/foodPatient" var="foodPatient">
					</c:url>

	<%-- Edit Request --%>
		<form action='<c:out value="${foodPatient}"></c:out>' method="get">
			ID: <input type="text" value="${requestScope.person.id}"
				readonly="readonly" name="id"><br>
		 Name: <input type="text" value="${requestScope.person.name}" name="name"><br>
			Country: <input type="text" value="${requestScope.person.country}"
				name="country"><br>
			   <input type="submit"
				value="get food">
		</form>


	<%-- Add Request --%>

   

	<%-- Persons List Logic --%>
	<c:if test="${not empty requestScope.persons}">
		<table>
			<tbody>
					<c:url value="/foodPatient" var="foodPatient">
					</c:url>
					
					
						
						<td><a
							href='<c:out value="${editURL}" escapeXml="true"></c:out>'>Edit</a></td>
					
			</tbody>
		</table>
	</c:if>
</body>
</html>
</html>