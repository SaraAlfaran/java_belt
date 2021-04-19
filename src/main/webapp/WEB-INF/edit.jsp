<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ page isErrorPage="true" %>
            <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

                <!DOCTYPE html>
                <html>

                <head>
                    <meta charset="UTF-8">
                    <title>Edit
                        <c:out value="${idea.title}" />
                    </title>
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
					<a href="/ideas/${idea.id}" class="btn btn-outline-primary float-right">Back</a>
                        <h1 class="h3 mb-3 font-weight-normal"> Edit
                            <c:out value="${idea.title}" />
                        </h1>
                        <form:form method="POST" action="/ideas/${idea.id}/edit" modelAttribute="idea">
                            <p>
                                <form:label path="title">Content:</form:label>
                                <form:input type="title" path="title" class="form-control" />
                                <form:errors path="title" class="text-danger" />
                            </p>

                            <input type="submit" value="Update" class="btn btn-sm btn-warning " /> <br><br>
                        </form:form>
                        <form:form method="POST" action="/ideas/${idea.id}/delete">
                            <input type="submit" value="Delete" class="btn btn-sm btn-danger " />
                        </form:form>

                    </div>
                </body>

                </html>