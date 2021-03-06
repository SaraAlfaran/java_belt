<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

            <!DOCTYPE html>
            <html>

            <head>
                <meta charset="UTF-8">
                <title>New Idea</title>
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
                    <h1>New Idea</h1>
                    <form:form method="POST" action="/ideas/new" modelAttribute="idea">
                    <p>
                        <form:label path="title">Title:</form:label>
                        <form:input type="title" path="title" class="form-control" />
                        <form:errors path="title" class="text-danger"/>
                    </p>
                        <input type="submit" value="Create" class="btn btn-lg btn-primary " />
                    </form:form>
                </div>
            </body>

            </html>