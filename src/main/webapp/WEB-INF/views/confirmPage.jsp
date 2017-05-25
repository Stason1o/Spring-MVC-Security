<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html class="full" lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Welcome page</title>

    <!-- Bootstrap Core CSS -->
    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="${contextPath}/resources/css/the-big-picture.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/confirmPage.css" rel="stylesheet">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>
<body>
<c:if test="<%=SecurityContextHolder.getContext().getAuthentication() != null%>">
    <!-- Navigation -->
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
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-3">
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
                    <c:if test="<%=SecurityContextHolder.getContext().getAuthentication() != null%>">
                        <li>
                            <a href="<c:url value="/logout" />">Logout</a>
                        </li>
                    </c:if>
                    <sec:authorize var="adminRole" access="hasRole('ROLE_ADMIN')"/>
                    <c:if test="${adminRole}">
                        <li>
                            <a href="<c:url value="/carPiece" />">Edit database list</a>
                        </li>
                    </c:if>
                    <li class="li right">
                        <a href="<c:url value="/cart"/> "><span class="glyphicon glyphicon-shopping-cart"></span> Shopping Cart</a>
                    </li>
                    <li class="li right">
                        <a href="<c:url value="/history"/>"><span class="glyphicon glyphicon-list-alt"></span>History of purchases </a>
                    </li>
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
                    <c:if test="<%=SecurityContextHolder.getContext().getAuthentication() != null%>">
                        <li>
                            <a href="<c:url value="/logout" />">Logout</a>
                        </li>
                    </c:if>
                    <sec:authorize var="adminRole" access="hasRole('ROLE_ADMIN')"/>
                    <c:if test="${adminRole}">
                        <li>
                            <a href="<c:url value="/carPiece" />">Edit database list</a>
                        </li>
                    </c:if>

                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>

    <div class="bgimg"></div>
    <!-- Page Content -->
    <div class="container">
        <div class="row">
            <div class="col-md-12 col-sm-12">
                <h1>Welcome to Main page, ${loggedUser.username}</h1>
                <div class="wrapper">
                    <table class="outer_container">
                        <tr>
                            <td>
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="Enter location | Moldova, Chisinau"/>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="Enter street | Decebal 72/5"/>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="Enter apartment | ap.23 floor 6"/>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="Enter mobile phone | +373 69 000 000"/>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <form:form method="POST" action="/confirmPage/${totalPrice}">
                                <td colspan="1">
                                    <div class="form-actions">
                                        <input type="submit" class="btn btn-block btn-primary btn-default"
                                                name="Confirm order"/>
                                    </div>
                                </td>
                            </form:form>
                                <td>
                                    <div class="form-actions">
                                        <a href="<c:url value="/cart" />" class="btn btn-block btn-primary btn-default">Back to Cart
                                            page</a>
                                    </div>
                                </td>

                        </tr>
                    </table>
                </div>
            </div>
        </div>
        <!-- /.row -->
    </div>
    <!-- /.container -->

    <!-- jQuery -->
    <script src="${pageContext}/resources/js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="${pageContext}/resources/js/bootstrap.js"></script>
</c:if>
</body>
</html>