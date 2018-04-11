<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Welcome to home page.</title>
</head>

<body bgcolor="#FFEAF4" >
	<h1>List of students</h1>
	<form action="studentList" method="post">
    	<input type="submit" name="button" value="Add New"></input>
    </form>
	<table border="1" cellpadding="5">
            <tr bgcolor="#FBFBFB">
				<th>Id</th><th>Name</th><th>Email</th><th>Phone</th><th>DOB</th><th>Age</th><th>City</th><th>Edit</th><th>Delete</th>
            </tr>

            <c:forEach var="u" items="${user}">
            <tr bgcolor="#FBFBFB">
					<td><c:out value="${u.id}" /></td>
                    <td><c:out value="${u.name}" /></td>
                    <td><c:out value="${u.email}" /></td>
                    <td><c:out value="${u.phone}" /></td>
<%-- 					<td><c:out value="<fmt:formatDate value="${dob}" pattern="MM-dd-yyyy" />"/></td> --%>
					<td><c:out value="${u.dob}" /></td>
					<td><c:out value="" /></td>
					<td><c:out value="${u.city}" /></td>
					<td><a href="register.jsp?studentData=${u.id},${u.name},${u.email},${u.phone},${u.dob},${u.city},edit">Edit</a></td>
					<td><a href="register.jsp?studentData=${u.id},${u.name},${u.email},${u.phone},${u.dob},${u.city},delete">Delete</a></td>
                </tr>
            </c:forEach>
	</table>

	<form action="studentList" method="post">
    	<input type="submit" name="button" value="Add New"></input>
	</form>

</body>
</html>