<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://kwonnam.pe.kr/jsp/template-inheritance" prefix="layout" %>
<html>
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>
        <layout:block name="titlePage">
            Page Title
        </layout:block>
    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet"
          id="bootstrap-css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.0.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" media="screen" href="<c:url value='/style.css'/>"/>
    <layout:block name="styleLinks">

    </layout:block>
</head>
<body>
<header>
    <layout:block name="header">
        <div>
            <a href='<c:url value="/"/>'>
                <img src="/logo.png" alt="icon-EABlog" height="120"/>
                <h1>MUM News - EA Blog</h1>
            </a>
            <c:choose>
                <c:when test="${currentUser != null}">
                    <span><a href="<c:url value="/logout"/>">Logout</a></span>
                </c:when>
                <c:otherwise>
                    <span><a href="<c:url value="/login"/>">Login</a></span>
                </c:otherwise>
            </c:choose>
        </div>
        <div class="userHeader">
            <c:if test="${currentUser != null}">
                <span> Welcome <c:out value="${currentUser.firstname}"/> </span>
            </c:if>
        </div>
    </layout:block>
</header>

<div id="container">
    <layout:block name="content">

    </layout:block>
</div>

<footer>
    <layout:block name="footer">
        Copyright &copy;
        <br/>
        Theodros Mebratu
        <br/>
        Francisco Mosquera
        <br/>
        Edwin Alejandro Cobos Fonseca
        <br/>
        Maharishi University of Management
        <br/>
        Jai Guru Dev
    </layout:block>
</footer>
</body>
</html>