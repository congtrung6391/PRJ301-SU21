<%-- 
    Document   : UserViewDetail
    Created on : Jul 5, 2021, 11:46:49 PM
    Author     : khang
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Detail Information</title>
    </head>
    <body>
        <h1>Laptop Detail Information</h1>
        <c:set var="dto" value="${requestScope.Laptop}"/>
        <c:url var="urlRewriting" value="UserListServlet">
        <c:param name="txtlaptopname" value="${lastSearchName}"/>
        <c:param name="txtminprice" value="${lastSearchMinPrice}"/>
        <c:param name="txtmaxprice" value="${lastSearchMaxPrice}"/>
        <c:param name="txtminyear" value="${lastSearchMinYear}"/>
        <c:param name="txtmaxyear" value="${lastSearchMaxYear}"/>
        </c:url>
        <table>
            <tr>
                Id : ${dto.id}
            </tr>
            <tr>
                Name : ${dto.name}
            </tr>
            <tr>
                Price : ${dto.price}
            </tr>
            <tr>
                CPU : ${dto.CPU}
            </tr>
            <tr>
                Ram : ${dto.ram}
            </tr>
            <tr>
                Screen : ${dto.screen}
            </tr>
            <tr>
                Graphic : ${dto.graphic}
            </tr>
            <tr>
                Disk : ${dto.disk}
            </tr>
            <tr>
                OS : ${dto.oS}
            </tr>
            <tr>
                Weight : ${dto.weight}
            </tr>
            <tr>
                Region : ${dto.region}
            </tr>
            <tr>
                Year : ${dto.year}
            </tr>
        </table>
            <a href="${urlRewriting}">Click here to continue shopping</a>
    </body>
</html>
