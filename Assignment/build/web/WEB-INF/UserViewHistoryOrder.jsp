<%-- 
    Document   : UserViewHistoryOrder
    Created on : Jul 10, 2021, 8:10:30 PM
    Author     : khang
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Order Page</title>
    </head>
    <body>
        ${sessionScope.USER.name}
        <h1>Your History Order</h1>
        <c:set var="listorder" value="${requestScope.OrderList}"/>
        <c:if test="${not empty listorder}">
            
                <table border="1">
                    <thead>
                        <tr>
                            <th>Order Id</th>
                            <th>User Id</th>
                            <th>Full Name</th>
                            <th>Address</th>
                            <th>Total Price</th>
                            <th>View Detail</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="order" items="${listorder}">
                        <tr>
                            <td>
                                ${order.orderid}
                            </td>
                            <td>
                                ${order.user.userId}
                                
                            </td>
                            <td>
                                ${order.user.name}
                            </td>
                            <td>
                                ${order.address}
                            </td>
                            <td>
                                ${order.totalprice}
                            </td>
                            <td>
                                <a href="UserViewDetailCartServlet?id=${order.orderid}">View Detail</a>
                            </td>
                        </tr>
                        </c:forEach>
                    </tbody>
                </table>        
        </c:if>
                <c:if test="${empty listorder}">
                    <h2>
                        You Haven't Maked Any Order
                    </h2>
                </c:if>
        <a href="UserListServlet">Continue Shopping</a>
    </body>
</html>
