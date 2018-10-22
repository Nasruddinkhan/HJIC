<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">

th{
color: #fd2828;
}
td{
color: green;
}
</style>
</head>
<body>
<h2>View Student</h2>
	<form:form commandName="student">
		<div class="table-responsive col-lg-12">
			<table class="table table-bordered table-striped table-highlight">
			   <tr>
					<th>GR No</th>
					<td>${ student.grno} </td>
					<th>Standard</th>
					<td> ${ student.division.classname}</td>
				</tr>
				<tr>
					<th>First Name</th>
					<td>${ student.firstname} </td>
					<th>Last Name</th>
					<td> ${ student.lastname}</td>
				</tr>
				  <tr>
					<th>Father's Name </th>
					<td>${ student.fathername} </td>
					<th>Mother's Name :</th>
					<td> ${ student.mothername}</td>
				</tr>
				<tr>
					<th>Mobile No :</th>
					<td>${ student.mobileno} </td>
					<th>Tell No :</th>
					<td> ${ student.tellphno}</td>
				</tr>
					<tr>
					<th>Email :</th>
					<td>${ student.email} </td>
					<th>Aadhaar No :</th>
					<td> ${ student.aadharno}</td>
				</tr>
				<tr>
					<th>Local Address :</th>
					<td>${ student.local_addr} </td>
					<th>Parmanent Address :</th>
					<td> ${ student.parmanent_addr}</td>
				</tr>
				
				<tr>
					<td colspan="4" style="text-align: center;"><a class="btn btn-info"
						href="${pageContext.request.contextPath}/student/students.do">Back</a></td>
				</tr>
			</table>
		</div>
	</form:form>
</body>
</html>