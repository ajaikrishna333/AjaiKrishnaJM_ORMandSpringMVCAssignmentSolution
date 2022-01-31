<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">

<title>Ajai's CRM</title>
</head>

<body>

	<div class="container">
		<hr>	
		<h3>New Customer Form</h3>
		<hr>

		<form action="/CustomerRelationshipManagement/customer/save-customer" method="POST">
			
			<!-- Add hidden form field to handle update -->
			<input type="hidden" name="id" value="${customer.id}" />

			<div class="form-inline">
				<input type="text" name="firstName" value="${customer.firstName}"
					class="form-control mb-4 col-4" placeholder="First Name">
			</div>

			<div class="form-inline">
				<input type="text" name="lastName" value="${customer.lastName}"
					class="form-control mb-4 col-4" placeholder="Last Name">
			</div>

			<div class="form-inline">
				<input type="text" name="emailId" value="${customer.emailId}"
					class="form-control mb-4 col-4" placeholder="Email ID">
			</div>

			<button type="submit" class="btn btn-info col-2">Save</button>

		</form>

		<hr>
		<a href="/CustomerRelationshipManagement/customer/list-customer"
		class="btn btn-info btn-sm">Back to Books List</a>

	</div>
</body>

</html>










