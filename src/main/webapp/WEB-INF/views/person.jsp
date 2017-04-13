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
</head>
<body>
<h1>
    Add a Person
</h1>

<c:url var="addAction" value="/person/add"/>

<form:form action="${addAction}" commandName="person">
    <table>
        <c:if test="${!empty person.name}">
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
        <tr>
            <td>
                <form:label path="name">
                    <spring:message text="Name"/>
                </form:label>
            </td>
            <td>
                <form:input path="name"/>
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="car">
                    <spring:message text="Car mark:"/>
                </form:label>
            </td>
            <td>
                <form:input path="car"/>
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="carModel">
                    <spring:message text="Car Model"/>
                </form:label>
            </td>
            <td>
                <form:input path="carModel"/>
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="carYear">
                    <spring:message text="Car Year"/>
                </form:label>
            </td>
            <td>
                <form:input path="carYear"/>
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="height">
                    <spring:message text="Height"/>
                </form:label>
            </td>
            <td>
                <form:input path="height"/>
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="width">
                    <spring:message text="Width"/>
                </form:label>
            </td>
            <td>
                <form:input path="width"/>
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="thickness">
                    <spring:message text="Thickness"/>
                </form:label>
            </td>
            <td>
                <form:input path="thickness"/>
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="originalNumber">
                    <spring:message text="IndentityNumber"/>
                </form:label>
            </td>
            <td>
                <form:input path="originalNumber"/>
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="airConditioner">
                    <spring:message text="AirConditioner"/>
                </form:label>
            </td>
            <td>
                <form:input path="airConditioner"/>
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="engineName">
                    <spring:message text="EngineName"/>
                </form:label>
            </td>
            <td>
                <form:input path="engineName"/>
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="engineVolume">
                    <spring:message text="EngineVolume"/>
                </form:label>
            </td>
            <td>
                <form:input path="engineVolume"/>
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="transmissionType">
                    <spring:message text="TransmissionType"/>
                </form:label>
            </td>
            <td>
                <form:input path="transmissionType"/>
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="fuelType">
                    <spring:message text="FuelType"/>
                </form:label>
            </td>
            <td>
                <form:input path="fuelType"/>
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="inStock">
                    <spring:message text="InStock"/>
                </form:label>
            </td>
            <td>
                <form:input path="inStock"/>
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="price">
                    <spring:message text="Price"/>
                </form:label>
            </td>
            <td>
                <form:input path="price"/>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <c:if test="${!empty person.name}">
                    <input type="submit"
                           value="<spring:message text="Edit Person"/>"/>
                </c:if>
                <c:if test="${empty person.name}">
                    <input type="submit"
                           value="<spring:message text="Add Person"/>"/>
                </c:if>
            </td>
        </tr>
    </table>
</form:form>
<br>
<h3>Persons List</h3>
<c:if test="${!empty listPersons}">
    <table class="tg">
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
            <th width="60">Edit</th>
            <th width="60">Delete</th>
        </tr>
        <c:forEach items="${listPersons}" var="person">
            <tr>
                <td>${person.id}</td>
                <td>${person.name}</td>
                <td>${person.car}</td>
                <td>${person.carModel}</td>
                <td>${person.carYear}</td>
                <td>${person.height}</td>
                <td>${person.width}</td>
                <td>${person.thickness}</td>
                <td>${person.originalNumber}</td>
                <td>${person.airConditioner}</td>
                <td>${person.engineName}</td>
                <td>${person.engineVolume}</td>
                <td>${person.transmissionType}</td>
                <td>${person.fuelType}</td>
                <td>${person.inStock}</td>
                <td>${person.price}</td>
                <td><a href="<c:url value='/edit/${person.id}' />">Edit</a></td>
                <td><a href="<c:url value='/remove/${person.id}' />">Delete</a></td>
            </tr>
        </c:forEach>
    </table>
</c:if>

<a href="<c:url value="/logout" />" style="margin-top: 20px">Logout</a>
</body>
</html>
