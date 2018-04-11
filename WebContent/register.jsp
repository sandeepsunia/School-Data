<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page import = "java.lang.String"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<SCRIPT language="JavaScript" src="calendar.js"></SCRIPT>
<title>Enter student details</title>
<script src="http://code.jquery.com/ui/1.10.1/jquery-ui.js"></script>

<script>   
    $(function() {
         $( "#dob" ).datepicker();   
    }); 
</script>
</head>
<body bgcolor="#FFEAF4" >
	<h1>Enter student details</h1>
	<form action="studentList" method="post">
	<div align = "center">
      </div>
      
        <c:set var="newarray" value="${param.studentData}"/>  
    	<c:set var="data" value="${fn:split(newarray, ',')}" />
        <c:set var="action" value="${data[6]}"/>
        
		<table cellpadding="3pt">
			<tr bgcolor="#FBFBFB">
				<td>Id :</td>
				<td><input type="text" name="id" size="30" value="${data[0]}" /></td>
			</tr>
			<tr bgcolor="#FBFBFB">
				<td>Name :</td>
				<td><input type="text" name="name" size="30" value="${data[1]}"/></td>
			</tr>
			<tr bgcolor="#FBFBFB">
				<td>email :</td>
				<td><input type="text" name="email" size="30" value="${data[2]}"/></td>
			</tr>
			<tr bgcolor="#FBFBFB">
				<td>Phone :</td>
				<td><input type="text" name="phone" size="30" value="${data[3]}"/></td>
			</tr>
			<tr bgcolor="#FBFBFB">
				<td>DOB :</td>
				<td><input type="date" name="dob" id="dob" size="30"  value="${data[4]}"/>
			</tr>
			<tr bgcolor="#FBFBFB">
				<td>City :</td>
				<td><input type="text" name="city" size="30" value="${data[5]}"/></td>
			</tr>
			<tr bgcolor="#FBFBFB">
				<td>
					<c:choose>
					    <c:when test="${empty action}">
					  				<input type="submit" value="Register" />
					    </c:when>
					    <c:otherwise>
					        <c:if test = "${action == 'edit'}">   
	       						<input type="submit" name="button" value="${action}" />
							</c:if>
							<c:if test = "${action == 'delete'}">   
	       						<input type="submit" name="button" value="${action}" onClick="alert('You are about to delete record for student named : ${data[1]} id: ${data[0]}')" />
							</c:if>
					    </c:otherwise>
					</c:choose>
				</td>
				<td>
					<input type="submit" name="button" value="Cancel"/>
		  		</td>
			</tr>
		</table>
	</form>
</body>
</html>