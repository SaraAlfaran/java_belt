<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

			<!DOCTYPE html>
			<html>

			<head>
				<meta charset="UTF-8">
				<title>Show one Idea</title>
				<link rel="stylesheet" href="/webjars/bootstrap/4.5.0/css/bootstrap.min.css" />
				<script src="/webjars/jquery/3.5.1/jquery.min.js"></script>
				<script src="/webjars/bootstrap/4.5.0/js/bootstrap.min.js"></script>
				<link rel="stylesheet" href="css/main.css" />
				<style>
					body {
					background-color: lightblue;
				  }
				</style>
			</head>

			<body>

				<div class="container mt-5">
					<a href="/ideas" class="btn btn-outline-primary float-right">Back</a>
					<h1> <c:out value="${idea.title}" /> </h1>
					<br>
					<h3> Created By: <c:out value="${idea.createdBy}" /> </h3><br><br>
					<h1>Users who liked this idea:</h1>
					<table class="table table-hover ">
						<thead class="thead-dark">
							<tr>
								<th>Name</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${idea.users}" var="u">
								<tr>
									<td>
										<c:out value="${u.name}" />
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>

					<c:if test="${ idea.createdBy.equals(user.name)}">
						<a href="/ideas/${idea.id}/edit" class="btn btn-dark col-2">Edit</a>
					</c:if>
				</div>
			</body>

			</html>