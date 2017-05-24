<%--
  Created by IntelliJ IDEA.
  User: sbogdanschi
  Date: 11/04/2017
  Time: 3:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
<html>
<head>
    <title>Person Page</title>
    <style type="text/css">
        .tg {
            border-collapse: collapse;
            border-spacing: 0;
            border-color: #ccc;
        }

        .tg td {
            font-family: Arial, sans-serif;
            font-size: 14px;
            padding: 10px 5px;
            overflow: hidden;
            word-break: normal;
            border: 1px solid #ccc;
            color: #333;
            background-color: #fff;
        }

        .tg th {
            font-family: Arial, sans-serif;
            font-size: 14px;
            font-weight: normal;
            padding: 10px 5px;
            overflow: hidden;
            word-break: normal;
            border: 1px solid #ccc;
            color: #333;
            background-color: #f0f0f0;
        }
    </style>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
</head>
<body>
Dear <strong>${user}</strong>, Welcome to Page for Admin.
<h1>
    Add a Car Piece
</h1>

<c:url var="addAction" value="/carPiece"/>

<form:form action="${addAction}" commandName="carPiece">
    <div class="outer_table">
        <c:if test="${!empty carPiece.name}">
            <tr>
                <td>
                    <form:label path="id">
                        <spring:message text="ID"/>
                    </form:label>
                </td>
                <td>
                    <form:input path="id" readonly="true" size="8" disabled="true"/>
                    <form:hidden path="id"/>
                </td>
            </tr>
        </c:if>
        <br>
            <div class="inner_column" >
                <spring:bind path="name">
                    <div class="form-group ${status.error ? 'has-error' : ''}">
                        <form:input type="text" path="name" class="form-control" placeholder="Name" autofocus="true"/>
                        <form:errors path="name"/>
                    </div>
                </spring:bind>
            </div>
            <div class="inner_column" >
                <spring:bind path="car">
                    <div class="form-group ${status.error ? 'has-error' : ''}">
                        <form:input type="text" path="car" class="form-control" placeholder="Car mark" autofocus="true"/>
                        <form:errors path="car"/>
                    </div>
                </spring:bind>
            </div>
            <td width="150">
                <spring:bind path="carModel">
                    <div class="form-group ${status.error ? 'has-error' : ''}">
                        <form:input type="text" path="carModel" class="form-control" placeholder="Car Model" autofocus="true"/>
                        <form:errors path="carModel"/>
                    </div>
                </spring:bind>
            </td>
            <div class="inner_column" >
                <spring:bind path="carYear">
                    <div class="form-group ${status.error ? 'has-error' : ''}">
                        <form:input type="text" path="carYear" class="form-control" placeholder="Car Year" autofocus="true"/>
                        <form:errors path="carYear"/>
                    </div>
                </spring:bind>
            </div>
            <div class="inner_column" >
                <spring:bind path="height">
                    <div class="form-group ${status.error ? 'has-error' : ''}">
                        <form:input type="text" path="height" class="form-control" placeholder="Height" autofocus="true"/>
                    </div>
                </spring:bind>
            </div>
            <div class="inner_column" >
                <spring:bind path="width">
                    <div class="form-group ${status.error ? 'has-error' : ''}">
                        <form:input type="text" path="width" class="form-control" placeholder="Width" autofocus="true"/>
                    </div>
                </spring:bind>
            </div>
            <div class="inner_column" >
                <spring:bind path="thickness">
                    <div class="form-group ${status.error ? 'has-error' : ''}">
                        <form:input type="text" path="thickness" class="form-control" placeholder="Thickness" autofocus="true"/>
                    </div>
                </spring:bind>
            </div>
            <div class="inner_column" >
                <spring:bind path="originalNumber">
                    <div class="form-group ${status.error ? 'has-error' : ''}">
                        <form:input type="text" path="originalNumber" class="form-control" placeholder="Original Number" autofocus="true"/>
                        <form:errors path="originalNumber"/>
                    </div>
                </spring:bind>
            </div>
        </br>
        <br>
            <div class="inner_column" >
                <spring:bind path="airConditioner">
                    <div class="form-group ${status.error ? 'has-error' : ''}">
                        <form:input type="text" path="airConditioner" class="form-control" placeholder="Air Conditioner" autofocus="true"/>
                    </div>
                </spring:bind>
            </div>
            <div class="inner_column" >
                <spring:bind path="engineName">
                    <div class="form-group ${status.error ? 'has-error' : ''}">
                        <form:input type="text" path="engineName" class="form-control" placeholder="Engine Name" autofocus="true"/>
                        <form:errors path="engineName"/>
                    </div>
                </spring:bind>
            </div>
            <div class="inner_column">
                <spring:bind path="engineVolume">
                    <div class="form-group ${status.error ? 'has-error' : ''}">
                        <form:input type="text" path="engineVolume" class="form-control" placeholder="Engine Volume" autofocus="true"/>
                        <form:errors path="engineVolume"/>
                    </div>
                </spring:bind>
            </div>
            <div class="inner_column" >
                <spring:bind path="transmissionType">
                    <div class="form-group ${status.error ? 'has-error' : ''}">
                        <form:input type="text" path="transmissionType" class="form-control" placeholder="Transmission Type" autofocus="true"/>
                        <form:errors path="transmissionType"/>
                    </div>
                </spring:bind>
            </div>
            <div class="inner_column" >
                <spring:bind path="fuelType">
                    <div class="form-group ${status.error ? 'has-error' : ''}">
                        <form:input type="text" path="fuelType" class="form-control" placeholder="Fuel Type" autofocus="true"/>
                        <form:errors path="fuelType"/>
                    </div>
                </spring:bind>
            </div>
            <div class="inner_column" >
                <spring:bind path="inStock">
                    <div class="form-group ${status.error ? 'has-error' : ''}">
                        <form:input type="text" path="inStock" class="form-control" placeholder="In Stock" autofocus="true"/>
                        <form:errors path="inStock"/>
                    </div>
                </spring:bind>
            </div>
            <div class="inner_column" >
                <spring:bind path="price">
                    <div class="form-group ${status.error ? 'has-error' : ''}">
                        <form:input type="text" path="price" class="form-control" placeholder="Price" autofocus="true"/>
                        <form:errors path="price"/>
                    </div>
                </spring:bind>
            </div>
            <div class="inner_column" >
                <spring:bind path="photo">
                    <div class="form-group ${status.error ? 'has-error' : ''}">
                        <form:input type="text" path="photo" class="form-control" placeholder="Photo" autofocus="true"/>
                    </div>
                </spring:bind>
            </div>
        </br>
        <br>
            <td colspan="2">
                <c:if test="${!empty carPiece.name}">
                    <input type="submit"
                           value="<spring:message text="Edit CarPiece"/>"/>
                </c:if>
                <c:if test="${empty carPiece.name}">
                    <input type="submit"
                           value="<spring:message text="Add CarPiece"/>"/>
                </c:if>
            </td>
        </br>
    </div>
</form:form>
<br>
<h3>CarPiece List</h3>


<table class="table">
    <thead>
    <tr class="filters">
        <th>
            <input id="piece_name-filter" class="form-control"  placeholder="Enter piece name..">
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

    <c:if test="${!empty listCarPieces}">
        <table class="tg" id="myTable">
            <tr>
                <th width="30">Piece ID</th>
                <th width="200">Piece Name</th>
                <th width="30">Car Name</th>
                <th width="30">Car Model</th>
                <th width="60">Car Year</th>
                <th width="50">Height</th>
                <th width="50">Width</th>
                <th width="20">Thickness</th>
                <th width="120">Identity Number</th>
                <th width="50">Air Conditioner</th>
                <th width="60">Engine Name</th>
                <th width="60">Engine Volume</th>
                <th width="80">Transmission Type</th>
                <th width="80">Fuel Type</th>
                <th width="50">In Stock</th>
                <th width="70">Price</th>
                <th width="100">Photo</th>
                <th width="60">Edit</th>
                <th width="60">Delete</th>
            </tr>
            <c:forEach items="${listCarPieces}" var="carPiece">
                <tr class = "piece_row"
                    data-piece_name="${carPiece.name}"
                    data-car_name="${carPiece.car}"
                    data-car_model="${carPiece.carModel}"
                    data-car_year="${carPiece.carYear}"
                    data-id_num="${carPiece.originalNumber}">
                    <td>${carPiece.id}</td>
                    <td>${carPiece.name}</td>
                    <td>${carPiece.car}</td>
                    <td>${carPiece.carModel}</td>
                    <td>${carPiece.carYear}</td>
                    <td>${carPiece.height}</td>
                    <td>${carPiece.width}</td>
                    <td>${carPiece.thickness}</td>
                    <td>${carPiece.originalNumber}</td>
                    <td>${carPiece.airConditioner}</td>
                    <td>${carPiece.engineName}</td>
                    <td>${carPiece.engineVolume}</td>
                    <td>${carPiece.transmissionType}</td>
                    <td>${carPiece.fuelType}</td>
                    <td>${carPiece.inStock}</td>
                    <td>${carPiece.price}</td>
                    <td><img src="${carPiece.photo}" style="width:100px;height:100px"></td>
                    <td><a href="<c:url value='/edit/${carPiece.id}' />">Edit</a></td>
                    <td><a href="<c:url value='/remove/${carPiece.id}' />">Delete</a></td>
                </tr>
            </c:forEach>
        </table>
    </c:if>

<a href="<c:url value="/logout" />" style="margin-top: 20px">Logout</a>

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

</script>
</body>
</html>
