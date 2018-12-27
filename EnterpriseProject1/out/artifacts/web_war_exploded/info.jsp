<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ page import = "com.mysql.jdbc.*" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<sql:query dataSource="jdbc/cosmetic" var="product">
    SELECT * FROM product WHERE id = ?
    <sql:param value="${param.id}"/>
</sql:query>

<html>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Oswald">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open Sans">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>
    h1,h2,h3,h4,h5,h6 {font-family: "Oswald"}
    body {font-family: "Open Sans"}

    .card {
        box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
        transition: 0.3s;
        width: 30%;
    }

    .card:hover {
        box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
    }

    .container {
        padding: 2px 16px;
    }

    .navbar {
        overflow: hidden;
        background-color: #333;
        position: fixed;
        top: 0;
        width: 100%;
    }

    .navbar a {
        float: left;
        display: block;
        color: #f2f2f2;
        text-align: center;
        padding: 14px 16px;
        text-decoration: none;
        font-size: 17px;
    }

    .navbar a:hover {
        background: #ddd;
        color: black;
    }
</style>

<head>
    <title>Product Information</title>
</head>
<body class="w3-light-grey">

<div class="navbar w3-bar w3-black w3-hide-small">
    <h6 class="w3-tag" onclick="window.location='index.jsp';">  Cosmetic</h6>
    <a href="#" class="w3-bar-item w3-button w3-right"><i class="fa fa-search"></i></a>
    <a href="#" class="w3-bar-item w3-button w3-right" onclick="window.location='admin.jsp';">For Admin</a>
</div>

<br>
<center>


    <div class="card container w3-padding-large">

        <c:forEach var="e" items="${product.rows}">

        <h1 class="w3-padding-large"><c:out value="${e.name}"/></h1>

        <img class="w3-padding-large" src="<c:out value="${e.image}"/>" style="width:300px;height:300px;">
        <div class="container">
            <h4><b><c:out value="${e.name}"/></b></h4>
            <p>$<c:out value="${e.price}"/></p>
            <p><c:out value="${e.description}"/></p>

            <div><button onclick="window.location='checkout.jsp?id=<c:out value="${e.id}"/>';">BUY</button></div>

            </c:forEach>

        </div>
</center>
</body>
</html>