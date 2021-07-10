<%-- 
    Document   : ViewCart
    Created on : Jul 7, 2021, 12:47:44 PM
    Author     : khang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Cart Page</title>
    </head>
    <body>
        <c:set var="user" value="${sessionScope.USER}"/>
        <c:set var="laptops" value="${sessionScope.cart}"/>
        <h1>
            ${user.name}
        </h1>
        <h2>Your Cart</h2>
        
        <c:url var="urlRewriting" value="UserListServlet">
        <c:param name="txtlaptopname" value="${requestScope.txtlastname}"/>
        <c:param name="txtminprice" value="${requestScope.txtlastminprice}"/>
        <c:param name="txtmaxprice" value="${requestScope.txtlastmaxprice}"/>
        <c:param name="txtminyear" value="${requestScope.txtlastminyear}"/>
        <c:param name="txtmaxyear" value="${requestScope.txtlastmaxyear}"/>
        <c:param name="btn" value="${requestScope.lastbtn}"/>
        </c:url>
        <form action="UserBuyServlet">
        <c:if test="${not empty laptops}">                            
                <table border="1">
                    <thead>
                        <tr>
                            <th>Name</th>
                            <th>CPU</th>
                            <th>Weight</th>
                            <th>Region</th>
                            <th>Year</th>
                            <th>Quantity</th>
                            <th>Price</th>
                            <th>Delete</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="lap" items="${sessionScope.cart}">                            
                            
                        <tr>
                            <td>
                                ${lap.laptop.name}
                            </td>
                            <td>
                                ${lap.laptop.CPU}
                            </td>
                            <td>
                                ${lap.laptop.weight}
                            </td>
                            <td>
                                ${lap.laptop.region}
                            </td>
                            <td>
                                ${lap.laptop.year}
                            </td>
                            <td>
                                <input type="number" name="txtquantity${lap.laptop.id}" value="${lap.quantity}" />
                                ${requestScope.Errorquantity}
                                
                            </td>
                            <td>
                                <input step="0.01" type="number" name="txtPrice" value="${lap.laptop.price}" readonly/>
                                
                            </td>
                            <td>
                                <a href="UserDeleteLaptopServlet?id=${lap.laptop.id}&totalprice=${requestScope.totalprice}">Delete</a>
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
           
            <input type="hidden" name="txttotalprice" value="${requestScope.totalprice}" /> 
            <font color="red">
            ${requestScope.ErrorQuantity}
                ${requestScope.AddressNull}
            </font>     
            Address : <input type="text" name="txtaddress" value="" />
            <input type="submit" value="Buy" name="btn" />
        </c:if>
        <c:if test="${empty laptops}">
            <h3>
                Your Cart is empty
            </h3>
        </c:if>
            
        </form>
        
        <a href="${urlRewriting}">Continue Shopping</a>
        
    </body>
</html>
