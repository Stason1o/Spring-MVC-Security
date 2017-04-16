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

<c:url var="addAction" value="/user/registration/add"/>

<form:form action="${addAction}" commandName="user">
    <table>
        <c:if test="${!empty user.ssoId}">
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
                <form:label path="firstName">
                    <spring:message text="FirstName"/>
                </form:label>
            </td>
            <td>
                <form:input path="firstName"/>
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="lastName">
                    <spring:message text="LastName:"/>
                </form:label>
            </td>
            <td>
                <form:input path="lastName"/>
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="email">
                    <spring:message text="Email"/>
                </form:label>
            </td>
            <td>
                <form:input path="email"/>
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="ssoId">
                    <spring:message text="SsoId"/>
                </form:label>
            </td>
            <td>
                <form:input path="ssoId"/>
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="password">
                    <spring:message text="Password"/>
                </form:label>
            </td>
            <td>
                <form:input path="password"/>
            </td>
        </tr>
        <%--<tr>--%>
            <%--<td>--%>
                <%--<form:label path="confirmPassword">--%>
                    <%--<spring:message text="ConfirmPassword"/>--%>
                <%--</form:label>--%>
            <%--</td>--%>
            <%--<td>--%>
                <%--<form:input path="confirmPassword"/>--%>
            <%--</td>--%>
        <%--</tr>--%>
        <tr>
            <td colspan="2">
                <c:if test="${empty user.ssoId}">
                    <input type="submit" value="<spring:message text="Add User"/>"/>
                </c:if>
            </td>
        </tr>
    </table>
</form:form>

<a href="<c:url value="/logout" />" style="margin-top: 20px">Logout</a>
</body>
</html>
