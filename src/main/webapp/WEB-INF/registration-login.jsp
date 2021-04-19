<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <!DOCTYPE html>
            <html>

            <head>

                <meta charset="UTF-8">
                <title>Login and Registration</title>
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
                    <div class="row">

                        <form:form method="POST" action="/registration" modelAttribute="user" class="col border m-4 p-2">
                            <h1 class="h3 mb-3 font-weight-normal">Register</h1>

                            <p>
                                <form:label path="name" placeholder="Name">Name:</form:label>
                                <form:input type="name" path="name" class="form-control" />
                                <form:errors path="name" class="text-danger" />
                            </p>
                            <p>
                                <form:label path="email" placeholder="Email">Email:</form:label>
                                <form:input type="email" path="email" class="form-control" />
                                <form:errors path="email" class="text-danger" />
                            </p>
                            <p>
                                <form:label path="password" placeholder="Password">Password:</form:label>
                                <form:password path="password" class="form-control" />
                                <form:errors path="password" class="text-danger" />
                            </p>
                            <p>
                                <form:label path="passwordConfirmation" placeholder="Password Confirmation">Password
                                    Confirmation:</form:label>
                                    <form:password path="passwordConfirmation" class="form-control" />
                                    <form:errors path="passwordConfirmation" class="text-danger" />
                            </p>
                            <input type="submit" value="Register" class="btn btn-lg btn-primary btn-block mt-4" />
                        </form:form>

                        <form method="post" action="/login" modelAttribute="user" class="col border m-4 p-2">
                            <h1 class="h3 mb-3 font-weight-normal">Login</h1>
                            <p class="text-danger">
                                <c:out value="${errorMessage}" />
                            </p>
                            
                            <p>
                                <label for="email">Email:</label>
                                <input type="text" id="email" class="form-control" name="email" />
                                <form:errors path="email" class="text-danger" />

                            </p>
                            <p>
                                <label for="password">Password:</label>
                                <input type="password" id="password" class="form-control" name="password" />
                                <form:errors path="password" class="text-danger" />
                            </p>
                            <input type="submit" class="btn btn-lg btn-primary btn-block mt-4" value="Login" />
                        </form>
                    </div>
                </div>
            </body>
            </html>