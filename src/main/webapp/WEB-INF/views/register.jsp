<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!-- /container -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <link href="<c:url value='/static/css/bootstrap.css' />" rel="stylesheet"/>
    <link href="<c:url value='/static/css/app.css' />" rel="stylesheet"/>
    <link rel="stylesheet" type="text/css"
          href="//cdnjs.cloudflare.com/ajax/libs/font-awesome/4.2.0/css/font-awesome.css"/>

    <title>Create an account</title>

    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/common.css" rel="stylesheet">


    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>

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

<c:url var="addAction" value="/user/registration"/>
<%--<form:form method="POST" modelAttribute="userForm" class="form-signin" action="/user/registration">--%>
<form:form action="${addAction}" commandName="user">
    <table>
        <%--<c:if test="${!empty user.username}">--%>

            <%--<tr>--%>
                <%--<td>--%>
                    <%--<form:label path="id">--%>
                        <%--<spring:message text="ID"/>--%>
                    <%--</form:label>--%>
                <%--</td>--%>
                <%--<td>--%>
                    <%--<form:input path="id" readonly="true" size="8" disabled="true"/>--%>
                    <%--<form:hidden path="id"/>--%>
                <%--</td>--%>
            <%--</tr>--%>
        <%--</c:if>--%>
        <tr>
            <td>
                <spring:bind path="firstName">
                    <div class="form-group ${status.error ? 'has-error' : ''}">
                        <form:input type="text" path="firstName" class="form-control" placeholder="FirstName" autofocus="true"/>
                        <form:errors path="firstName"/>
                    </div>
                </spring:bind>
                <%--<form:label path="firstName">--%>
                    <%--<spring:message text="FirstName"/>--%>
                <%--</form:label>--%>
            </td>
            <%--<td>--%>
                <%--<form:input path="firstName"/>--%>
            <%--</td>--%>
        </tr>
        <tr>
            <td>
                <spring:bind path="lastName">
                    <div class="form-group ${status.error ? 'has-error' : ''}">
                        <form:input type="text" path="lastName" class="form-control" placeholder="LastName" autofocus="true"/>
                        <form:errors path="lastName"/>
                    </div>
                </spring:bind>
                <%--<form:label path="lastName">--%>
                    <%--<spring:message text="LastName:"/>--%>
                <%--</form:label>--%>
            </td>
            <%--<td>--%>
                <%--<form:input path="lastName"/>--%>
            <%--</td>--%>
        </tr>
        <tr>
            <td>
                <spring:bind path="email">
                    <div class="form-group ${status.error ? 'has-error' : ''}">
                        <form:input type="email" path="email" class="form-control" placeholder="Email" autofocus="true"/>
                        <form:errors path="email"/>
                    </div>
                </spring:bind>
                <%--<form:label path="email">--%>
                    <%--<spring:message text="Email"/>--%>
                <%--</form:label>--%>
            </td>
            <%--<td>--%>
                <%--<form:input path="email"/>--%>
            <%--</td>--%>
        </tr>
        <%--<h2 class="form-signin-heading">Create your account</h2>--%>

        <tr>
            <td>
                <spring:bind path="username">
                    <div class="form-group ${status.error ? 'has-error' : ''}">
                        <form:input type="text" path="username" class="form-control" placeholder="Username" autofocus="true"/>
                        <form:errors path="username"/>
                    </div>
                </spring:bind>
                <%--<form:label path="username">--%>
                    <%--<spring:message text="Username"/>--%>
                <%--</form:label>--%>
            </td>
            <%--<td>--%>
                <%--<form:input path="username"/>--%>
            <%--</td>--%>
        </tr>

        <tr>
            <td>
                <spring:bind path="password">
                    <div class="form-group ${status.error ? 'has-error' : ''}">
                        <form:input type="password" path="password" class="form-control" placeholder="Password"/>
                        <form:errors path="password"/>
                    </div>
                </spring:bind>
                <%--<form:label path="password">--%>
                    <%--<spring:message text="Password"/>--%>
                <%--</form:label>--%>
            </td>
            <%--<td>--%>
                <%--<form:input path="password"/>--%>
            <%--</td>--%>
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
                <%--<form:label path="confirmPassword">--%>
                    <%--<spring:message text="ConfirmPassword"/>--%>
                <%--</form:label>--%>
            </td>
            <%--<td>--%>
                <%--<form:input path="confirmPassword"/>--%>
            <%--</td>--%>
        </tr>
        <tr>
            <td colspan="2">
                <button class="btn btn-lg btn-primary btn-block" type="submit">Submit</button>
            </td>
        </tr>
    </table>
</form:form>


<a href="<c:url value="/logout" />" style="margin-top: 20px">Logout</a>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>
