<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

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
    <link href="${contextPath}/resources/css/about.css" rel="stylesheet">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>
<body>
<sec:authorize access="isAnonymous()">
</sec:authorize>
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
                    <li class="li right">
                        <a href="<c:url value="/cart"/> "><span class="glyphicon glyphicon-shopping-cart"></span> Shopping Cart</a>
                    </li>
                    <li>
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
                <a class="navbar-brand" href="<c:url value="/index"/> ">Main Page</a>
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
                    <li>
                        <a href="<c:url value="/logout" />">Logout</a>
                    </li>
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
                <h1>About Us</h1>
                <div class="innerWrapper">
                    <br>
                    Our company was founded in 2005 year. We are 12 years on the Moldova market!
                    Each client remained happy about his purchase.
                    <br>
                    <br>
                    We provide the spare parts for the majority of the cars.
                    In assortment there is a wide choice of spare parts, such as:<br>
                    <ul>
                        <li>Body parts</li>
                        <li>Optics</li>
                        <li>Radiators</li>
                        <li>Engine parts</li>
                        etc.
                    </ul>


                <!--TODO finish the text!-->
                </div>
            </div>
        </div>
        <!-- /.row -->
    </div>
    <!-- /.container -->

    <!-- jQuery -->
    <script src="${contextPath}/resources/js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="${contextPath}/resources/js/bootstrap.js"></script>
</c:if>
</body>
</html>