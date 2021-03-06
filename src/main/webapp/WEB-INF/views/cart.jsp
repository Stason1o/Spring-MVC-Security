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
    <link href="${contextPath}/resources/css/cart.css" rel="stylesheet">

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
                    <sec:authorize access="isAuthenticated()">
                        <li>
                            <a href="<c:url value="/logout" />">Logout</a>
                        </li>
                    </sec:authorize>
                    <sec:authorize var="adminRole" access="hasRole('ROLE_ADMIN')"/>
                    <c:if test="${adminRole}">
                        <li>
                            <a href="<c:url value="/carPiece" />">Edit database list</a>
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
                    <sec:authorize access="isAuthenticated()">
                        <li>
                            <a href="<c:url value="/logout" />">Logout</a>
                        </li>
                    </sec:authorize>
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
    <c:set var="total" value="0"/>
    <div class="container">
        <div class="row">
            <div class="col-md-12 col-sm-12">
                <c:url var="addAction" value="/cart"/>
                <form:form action="${addAction}" commandName="listCartContent">
                <h1>Welcome to Main page, ${loggedUser.username}</h1>
                    <c:choose>
                    <c:when test="${not empty listCartContent}">
                        <div class="wrapper">
                        <c:forEach var="piece" items="${listCartContent}">
                            <div class="cartList">
                                <img src="${piece.product.photo}" style="width:100px;height:100px">
                                <div>
                                    <br>
                                    ${piece.product.name}, suitable for ${piece.product.car} ${piece.product.carModel}(${piece.product.carYear})
                                costs ${piece.product.price} MDL
                                </div>

                                    <button class="btn btn-block btn-primary btn-default" type="submit"
                                        value="${piece.product.id}" name="carPieceIdToDelete">Delete from cart</button>
                                <c:set var="total" value="${total + piece.product.price}"/>
                            </div>
                        </c:forEach>
                        </div>
                            <a class="btn btn-block btn-primary btn-default" type="submit" href="<c:url value="/confirmPage/${total}"/> "
                               name="totalPrice">Order</a>
                            <p class="moneyAmount">Total amount: ${total} MDL</p>


                    </c:when>
                    <c:otherwise>
                        <div class="noscroll">
                            <h1>You don't have any items in your cart to buy</h1>
                        </div>

                    </c:otherwise>
                    </c:choose>
                </div>

                </form:form>

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