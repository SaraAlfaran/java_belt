<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

            <!DOCTYPE html>
            <html>

            <head>
                <meta charset="UTF-8">
                <title>All Ideas</title>
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
                <div class="container my-5">
                    <div class="row">
                        <div class="col">
                            <h1> Welcome,
                                <c:out value="${user.name}" />
                            </h1>
                        </div>
                        <div class="col">
                            <a href="/logout" class="btn btn-outline-danger float-right">Logout</a>
                        </div>
                    </div>

                    <div class="row mt-5">
                        <div class="col-9">
                            <h1 class="">Ideas</h1>
                        </div>
                        <div class="col">
                            <a href="/ideas/lowest" class="mr-3">Low Likes</a>
                            <a href="/ideas/highest">High Likes</a>
                        </div>
                    </div>

                    <table class="table table-hover">
                        <thead class="thead-dark">
                            <tr>
                                <th scope="col">Idea</th>
                                <th scope="col">Created By:</th>
                                <th scope="col">Likes</th>
                                <th scope="col">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${ideas}" var="idea">
                                <tr scope="row">
                                    <td><a href="/ideas/${idea.id}">
                                            <c:out value="${idea.title}" />
                                        </a></td>
                                    <td>
                                        <c:out value="${idea.createdBy}" />
                                    </td>
                                    <td>
                                        <c:out value="${idea.likes}" />
                                    </td>

                                    <c:if test="${! idea.users.contains(user)}">
                                        <td><a href="/ideas/${idea.id}/like"> Like</a></td>
                                    </c:if>
                                    <c:if test="${idea.users.contains(user)}">
                                        <td><a href="/ideas/${idea.id}/Unlike">Unlike</a></td>
                                    </c:if>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <a href="/ideas/new" class="btn btn-lg btn-outline-primary col-3">New Idea</a>
                </div>
            </body>

            </html>