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
		<h3>Customer Directory</h3>
		<hr>

		<!-- Add a search form -->
		
		<form action="/CustomerRelationshipManagement/customer/search-customer" class="form-inline">
			<a href="/CustomerRelationshipManagement/customer/add-customer"
				class="btn btn-primary btn-sm mb-3"> Add Customer </a>
			<input type="search" name="firstName" placeholder="Customer's First Name" class="form-control-sm ml-5 mb-3">
			<button type="submit" class="btn btn-success btn-sm ml-2 mb-3">Search</button>
			<a href="/CustomerRelationshipManagement/customer/list-customer"
			class="btn btn-success btn-sm ml-2 mb-3">Clear</a>	
		</form>				

		<table class="table table-bordered table-striped">
			<thead class="thead-dark">
				<tr>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Email ID</th>
					<th>Action</th>
				</tr>
			</thead>

			<tbody>
				<c:forEach items="${cList}" var="temp">
					<tr>
						<td><c:out value="${temp.firstName}" /></td>
						<td><c:out value="${temp.lastName}" /></td>
						<td><c:out value="${temp.emailId}" /></td>
						<td>
							<a href="/CustomerRelationshipManagement/customer/update-customer?id=${temp.id}"
							class="btn btn-info btn-sm"> Update customer</a>
							<a href="/CustomerRelationshipManagement/customer/delete-customer?id=${temp.id}"
							class="btn btn-danger btn-sm"
							onclick="if (!(confirm('Are you sure you want to delete this employee?'))) return false"> Delete customer</a>	
						</td>
					</tr>
				</c:forEach>

			</tbody>
		</table>

	</div>

</body>
</html>



