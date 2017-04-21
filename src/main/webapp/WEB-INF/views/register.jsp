<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!-- /container -->
<!DOCTYPE html>
<html class="full" lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <%--<link href="<c:url value='/static/css/bootstrap.css' />" rel="stylesheet"/>--%>
    <%--<link href="<c:url value='/static/css/login.css' />" rel="stylesheet"/>--%>
    <link rel="stylesheet" type="text/css"
          href="//cdnjs.cloudflare.com/ajax/libs/font-awesome/4.2.0/css/font-awesome.css"/>

    <title>Create an account</title>

    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/register.css" rel="stylesheet">
    <%--<link href="${contextPath}/resources/css/the-big-picture.css" rel="stylesheet">--%>
    <%--<link href="${contextPath}/resources/css/common.css" rel="stylesheet">--%>


    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>

    <title>Person Page</title>
    <style type="text/css">
        .tg {
            border-collapse: collapse;
            border-spacing: 0;
            border-color: #ccc;
        }


    </style>
</head>
<body>
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse"
                    data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="<c:url value="/index"/>">Main Page</a>
        </div>
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li>
                    <a href="<c:url value="/about" />">About</a>
                </li>
                <li>
                    <a href="<c:url value="/shop" />">Shop</a>
                </li>
                <li>
                    <a href="<c:url value="/contact" />">Contact</a>
                </li>
                <sec:authorize var="loggedIn" access="isAuthenticated()"/>
                <c:if test="${loggedIn}">
                    <li>
                        <a href="<c:url value="/logout" />">Logout</a>
                    </li>
                </c:if>
            </ul>
        </div>
        <!-- /.navbar-collapse -->
    </div>
    <!-- /.container -->
</nav>

<!-- Navigation -->
<nav class="navbar navbar-inverse navbar-fixed-bottom" role="navigation">
    <div class="container">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse"
                    data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="<c:url value="/index"/>">Main Page</a>
        </div>
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li>
                    <a href="<c:url value="/about" />">About</a>
                </li>
                <li>
                    <a href="<c:url value="/shop" />">Shop</a>
                </li>
                <li>
                    <a href="<c:url value="/contact" />">Contact</a>
                </li>
                <sec:authorize var="loggedIn" access="isAuthenticated()"/>
                <c:if test="${loggedIn}">
                    <li>
                        <a href="<c:url value="/logout" />">Logout</a>
                    </li>
                </c:if>
            </ul>
        </div>
        <!-- /.navbar-collapse -->
    </div>
    <!-- /.container -->
</nav>

<!-- Page Content -->
<div class="container">
    <div class="row">
        <div class="col-md-6 col-sm-12">
            <h1>Create your account</h1>
        </div>
    </div>
    <c:url var="addAction" value="/user/registration"/>
    <form:form action="${addAction}" commandName="user">
        <table class="outer_container">
            <tr>
                <td>
                    <spring:bind path="firstName">
                        <div class="form-group ${status.error ? 'has-error' : ''}">
                            <form:input type="text" path="firstName" class="form-control" placeholder="FirstName"
                                        autofocus="true"/>
                            <form:errors path="firstName"/>
                        </div>
                    </spring:bind>
                </td>
            </tr>
            <tr>
                <td>
                    <spring:bind path="lastName">
                        <div class="form-group ${status.error ? 'has-error' : ''}">
                            <form:input type="text" path="lastName" class="form-control" placeholder="LastName"
                                        autofocus="true"/>
                            <form:errors path="lastName"/>
                        </div>
                    </spring:bind>
                </td>
            </tr>
            <tr>
                <td>
                    <spring:bind path="email">
                        <div class="form-group ${status.error ? 'has-error' : ''}">
                            <form:input type="email" path="email" class="form-control" placeholder="Email"
                                        autofocus="true"/>
                            <form:errors path="email"/>
                        </div>
                    </spring:bind>
                </td>
            </tr>

            <tr>
                <td>
                    <spring:bind path="username">
                        <div class="form-group ${status.error ? 'has-error' : ''}">
                            <form:input type="text" path="username" class="form-control" placeholder="Username"
                                        autofocus="true"/>
                            <form:errors path="username"/>
                        </div>
                    </spring:bind>
                </td>
            </tr>

            <tr>
                <td>
                    <spring:bind path="password">
                        <div class="form-group ${status.error ? 'has-error' : ''}">
                            <form:input type="password" path="password" class="form-control" placeholder="Password"/>
                            <form:errors path="password"/>
                        </div>
                    </spring:bind>
                </td>
            </tr>

            <tr>
                <td>
                    <spring:bind path="confirmPassword">
                        <div class="form-group ${status.error ? 'has-error' : ''}">
                            <form:input type="password" path="confirmPassword" class="form-control"
                                        placeholder="Confirm your password"/>
                            <form:errors path="confirmPassword"/>
                        </div>
                    </spring:bind>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <button class="btn btn-lg btn-primary btn-block" type="submit">Submit</button>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <div class="form-actions">
                        <a href="<c:url value="/login" />" class="btn btn-block btn-primary btn-default">Back to login
                            page</a>
                    </div>
                </td>
            </tr>
        </table>
    </form:form>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>
