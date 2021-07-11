<%-- 
    Document   : ListLaptopEmp
    Created on : Jul 8, 2021, 10:38:47 PM
    Author     : SE140866
--%>

<%@page import="DAO.LaptopDAO"%>
<%@page import="java.text.DecimalFormat"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Laptop Manager</title>
    </head>
    <body>
        <h1>Laptop Manager</h1>
        <form action = "LoadListServlet" method = "POST">
            Hello
            <a href='SignOutServlet'>Sign Out</a>
            ||<a href='EditProfileServlet'>Edit Profile</a></br></br>
            Search by ID: <input type="text" name="searchID" value="${param.searchID}">
            Search by Name: <input type="text" name="searchName" value="${param.searchName}">
            <input type="submit" name="search" value="Search">
        </form>
        </br>
        <table border="1">
            <thead>
                <tr>
                    <th>ID </th>
                    <th>Name </th>
                    <th>Price </th>
                    <th>CPU </th>
                    <th>Ram </th>
                    <th>Screen </th>
                    <th>Graphic </th>
                    <th>Disk </th>
                    <th>OS </th>
                    <th>Weight </th>
                    <th>Region </th>
                    <th>Year </th>
                </tr>
                <c:forEach items="${listLaptop}" var="obj">
                    <tr>
                        <td>${obj.id}</td>
                        <td>${obj.name}</td>
                        <td>${obj.price}</td>
                        <td>${obj.cpu}</td>
                        <td>${obj.ram}</td>
                        <td>${obj.screen}</td>
                        <td>${obj.graphic}</td>
                        <td>${obj.disk}</td>
                        <td>${obj.os}</td>
                        <td>${obj.weight}</td>
                        <td>${obj.region}</td>
                        <td>${obj.year}</td>
                        <td><a href='EditServlet?elid=${obj.id}'>Edit</a></td>
                        <td><a href='DeleteServlet?dlid=${obj.id}'>Delete</a></td>
                    </tr>
                </c:forEach>
            </thead>
        </table>
        </br>
        <a href='EditServlet?elid=0'>Add New Laptop</a>
    </body>
</html>
