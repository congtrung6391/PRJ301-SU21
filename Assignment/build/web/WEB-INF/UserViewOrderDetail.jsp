<%-- 
    Document   : UserViewCartDetail
    Created on : Jul 10, 2021, 11:09:09 PM
    Author     : khang
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Cart Detail Page</title>
    </head>
    <body>
        
        <h1>${sessionScope.USER.name} 's Detail Cart</h1>
        <c:set var="orderDetail" value="${requestScope.OrderDetailList}"/>
        <c:if test="${not empty orderDetail}">
            <table border="1">
                <thead>
                    <tr>
                        <th>Order Detail Id</th>
                        <th>Full Name</th>
                        <th>Phone</th>
                        <th>Delivery Address</th>
                        <th>Laptop Name</th>
                        <th>Quantity</th>
                        <th>Price</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="orderDetails" items="${requestScope.OrderDetailList}">
                    <tr>
                        <td>
                            ${orderDetails.orderDetailId}
                        </td>
                        <td>
                            ${sessionScope.USER.name}
                        </td>
                        <td>
                            ${sessionScope.USER.phone}
                        </td>
                        <td>
                            ${orderDetails.order.address}
                        </td>
                        <td>
                            ${orderDetails.laptop.name}
                        </td>
                        <td>
                            ${orderDetails.quantity}
                        </td>
                        <td>
                            ${orderDetails.laptop.price}
                        </td>
                    </tr>
                    </c:forEach>
                    <tr>
                            <td>
                                Total Price :
                            </td>
                            <td>
                                
                                ${requestScope.totalprice}
                            </td>
                        </tr>
                </tbody>
            </table>

        </c:if>
        <a href="UserListServlet">Continue Shopping</a>
    </body>
</html>
