<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
    <link href="${contextPath}/resources/css/contact.css" rel="stylesheet">

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
                    <li>
                        <a href="<c:url value="/logout" />">Logout</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>

    <!-- Page Content -->
    <div class="container">
        <div class="row">
            <div class="col-md-11 col-sm-12">
                <h1>Welcome to Contact page, ${user}</h1>
                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d680.1540880191001!2d28.863656629214084!3d47.00850549869687!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x40c97c053df26553%3A0x69f12f71e465b651!2z0KHQutC70LDQtNGLINCQ0J4g0KLRgNCw0L3RgdGB0LXRgNCy0LjRgS3QnNCw0LrRgdC40LzRg9C8LCBNdW5jZXN0aSBId3kgMjkvMSwgQ2hpyJlpbsSDdSAyMDAxLCDQnNC-0LvQtNC-0LLQsA!5e0!3m2!1sru!2s!4v1492803632488"
                        width="400" height="400" frameborder="1" style="border:0" allowfullscreen></iframe>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Magni, iusto, unde, sunt incidunt id
                    sapiente rerum soluta voluptate harum veniam fuga odit ea pariatur vel eaque sint sequi tenetur
                    eligendi.</p>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Magni, iusto, unde, sunt incidunt id
                    sapiente rerum soluta voluptate harum veniam fuga odit ea pariatur vel eaque sint sequi tenetur
                    eligendi.</p>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Magni, iusto, unde, sunt incidunt id
                    sapiente rerum soluta voluptate harum veniam fuga odit ea pariatur vel eaque sint sequi tenetur
                    eligendi.</p>
            </div>
        </div>
        <!-- /.row -->
    </div>
    <!-- /.container -->

    <!-- jQuery -->
    <script src="${pageContext}/resources/js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="${pageContext}/resources/js/bootstrap.min.js"></script>
</c:if>
</body>
</html>