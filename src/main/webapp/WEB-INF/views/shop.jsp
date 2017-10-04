<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %><%--
  Created by IntelliJ IDEA.
  User: sbogdanschi
  Date: 11/04/2017
  Time: 3:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ page session="false" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<html class="full">
<head>
    <title>Edit Car Piece Page</title>

    <link href="<c:url value='/resources/css/bootstrap.css' />" rel="stylesheet"/>
    <link href="<c:url value='/resources/css/the-big-picture.css' />" rel="stylesheet"/>
    <link href="<c:url value='/resources/css/shop.css' />" rel="stylesheet"/>
    <link href="https://cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css" rel="stylesheet"/>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/list.js/1.5.0/list.min.js"></script>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
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
                    <sec:authorize access="isAuthenticated()">
                        <li>
                            <a href="<c:url value="/logout" />">Logout</a>
                        </li>
                    </sec:authorize>
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
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>

    <div class="bgimg"></div>

    <div class="wrapper">
        <div class="filters">
            <table class="table table-hover">
                <thead>
                <tr class="filters">
                    <th>
                        <input id="piece_name-filter" class="form-control" placeholder="Enter piece name..">
                    </th>
                    <th>
                        <input id="car_name-filter" class="form-control" placeholder="Enter car name ..">
                    </th>
                    <th>
                        <input id="car_model-filter" class="form-control" placeholder="Enter car model..">
                    </th>
                    <th>
                        <input id="car_year-filter" class="form-control" placeholder="Enter car year..">

                    </th>
                    <th>
                        <input id="id_num-filter" class="form-control" placeholder="Enter identity number..">
                    </th>
                </tr>
                </thead>
            </table>
        </div>
        <div class="content-wrapper">
            <c:url var="addAction" value="/shop"/>
            <form:form action="${addAction}" commandName="listCarPieces">

                <c:if test="${!empty listCarPieces}">
                    <table id="myTable" class="display">
                        <tbody>
                        <c:forEach items="${listCarPieces}" var="carPiece">
                            <tr class="piece_row"
                                data-piece_name="${carPiece.name}"
                                data-car_name="${carPiece.car}"
                                data-car_model="${carPiece.carModel}"
                                data-car_year="${carPiece.carYear}"
                                data-id_num="${carPiece.originalNumber}">
                                <th>
                                    <img src="${carPiece.photo}" style="width:100px;height:100px">
                                <p>${carPiece.name}, suitable for ${carPiece.car} ${carPiece.carModel}(${carPiece.carYear})
                                    costs ${carPiece.price} MDL</p>
                                    <div class="form-actions">
                                        <button class="btn btn-block btn-primary btn-default" type="submit"
                                                value="${carPiece.id}" name="carPieceId">Add to cart</button>
                                        <%--<input type="submit" class="btn btn-block btn-primary btn-default"--%>
                                                    <%--value="${carPiece.id}" name="carPieceId"/>--%>
                                        <%--<input type="submit"--%>
                                               <%--value="${carPiece.id}" name="carPieceId">Add to cart</input>--%>
                                    </div>
                                </th>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </c:if>
            </form:form>
        </div>
    </div>
    <script>

        (function () {
            var
                filters = {
                    piece_name: null,
                    car_name: null,
                    car_model: null,
                    car_year: null,
                    id_num: null
                };

            function updateFilters() {
                $('.piece_row').hide().filter(function () {
                    var
                        self = $(this),
                        result = true; // not guilty until proven guilty

                    Object.keys(filters).forEach(function (filter) {
                        if (filters[filter] && (filters[filter] != 'None') && (filters[filter] != 'Any')) {
                            result = result && filters[filter] === self.data(filter);
                        }
                    });

                    return result;
                }).show();
            }

            function bindFilters() {
                Object.keys(filters).forEach(function (filterName) {
                    $('#' + filterName + '-filter').on('change', function () {
                        filters[filterName] = this.value;
                        updateFilters();
                    });
                });
            }

            bindFilters();
        })();


        $(document).ready(function () {
            $('#myTable').DataTable({
                "pagingType": "full_numbers"
            });
        });
    </script>
</c:if>
</body>
</html>
