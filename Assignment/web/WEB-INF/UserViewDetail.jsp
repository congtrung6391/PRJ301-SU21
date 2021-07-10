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
            <c:param name="txtlaptopname" value="${requestScope.lastSearchName}"/>
            <c:param name="txtminprice" value="${requestScope.lastSearchMinPrice}"/>
            <c:param name="txtmaxprice" value="${requestScope.lastSearchMaxPrice}"/>
            <c:param name="txtminyear" value="${requestScope.lastSearchMinYear}"/>
            <c:param name="txtmaxyear" value="${requestScope.lastSearchMaxYear}"/>
            <c:param name="btn" value="${requestScope.btn}"/>
        </c:url>
        <table>
            <tr>
                <td>
                    Id : ${dto.id}
                </td>
                
            </tr>
            <tr>
                <td>
                    Name : ${dto.name}
                </td>
                
            </tr>
            <tr>
                <td>
                    Price : ${dto.price}
                </td>
                
            </tr>
            <tr>
                <td>
                    CPU : ${dto.CPU}
                </td>
                
            </tr>
            <tr>
                <td>
                    Ram : ${dto.ram}
                </td>
                
            </tr>
            <tr>
                <td>
                    Screen : ${dto.screen}
                </td>
                
            </tr>
            <tr>
                <td>
                    Graphic : ${dto.graphic}
                </td>
                
            </tr>
            <tr>
                <td>
                    Disk : ${dto.disk}
                </td>
                
            </tr>
            <tr>
                <td>
                    OS : ${dto.oS}
                </td>
                
            </tr>
            <tr>
                <td>
                    Weight : ${dto.weight}
                </td>
                
            </tr>
            <tr>
                <td>
                    Region : ${dto.region}
                </td>
                
            </tr>
            <tr>
                <td>
                    Year : ${dto.year}
                </td>
                
            </tr>
        </table>
            <a href="${urlRewriting}">Click here to continue shopping</a>
            
                <input type="submit" value="Add To Cart" name="btn" />
            </form>
    </body>
</html>
