<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ page import = "com.mysql.jdbc.*" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<sql:query dataSource="jdbc/cosmetic" var="result">
    SELECT * FROM category
</sql:query>

<!DOCTYPE html>
<html lang="en">

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

</style>

<head>
    <meta charset="UTF-8">
    <title>Create Product</title>
</head>
<body class="w3-light-grey">

<form action="cosmetic-controller">

    <div class="w3-bar w3-black w3-hide-small">
        <h6 class="w3-tag" onclick="window.location='index.jsp';">  Cosmetic</h6>
    </div>

    <center>

        <h1 class="w3-padding-large">Create Product</h1>

        <div class="card container w3-black w3-padding-large">

            <table>
                <tr>
                    <td>Image</td>
                    <td><input type="text" name="image"></td>
                </tr>
                <tr>
                    <td>Name</td>
                    <td><input type="text" name="name"></td>
                </tr>
                <tr>
                    <td>Description</td>
                    <td><input type="text" name="description"></td>
                </tr>
                <tr>
                    <td>Price</td>
                    <td><input type="number" name="price"></td>
                </tr>
                <tr>
                    <td>Category</td>
                    <td>
                        <select name="category_id">
                            <c:forEach var="row" items="${result.rows}">
                                <option value='<c:out value="${row.id}"/>'>
                                    <c:out value="${row.name}"/>
                                </option>
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input class="w3-right" type="submit" value="Create">
                    </td>
                </tr>
            </table>

        </div>
    </center>

</form>

</body>
</html>
