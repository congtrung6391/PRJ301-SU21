<%-- 
    Document   : UserPage
    Created on : Jul 4, 2021, 9:15:48 PM
    Author     : khang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello ${sessionScope.USER.name}</h1>
        <form action="SignOutServlet" method="POST">
            <input type="submit" value="Sign Out" name="btn" />
        </form>
        
        <form action="UserListServlet" method="POST">
            <table>
                <tr>
                    <td>
                        Name :
                    </td>
                    <td>
                        <input type="text" name="txtlaptopname" value="${param.txtlaptopname}" />
                    </td>
                    <td>
                        ${requestScope.ErrorInput.nameError}
                    </td>
                    
                </tr>
                <tr>
                    <td>
                        Price :
                    </td>
                    <td>
                        Min : <input type="text" name="txtminprice" value="${param.txtminprice}" />
                    </td>
                    <td>
                        Max : <input type="text" name="txtmaxprice" value="${param.txtmaxprice}" />
                    </td>
                    <td>
                        ${requestScope.ErrorInput.priceError}
                    </td>
                    
                </tr>
                <tr>
                    <td>
                        Year :
                    </td>
                    <td>
                        Min year : <input type="text" name="txtminyear" value="${param.txtminyear}" />
                    </td>
                    <td>
                        Max year : <input type="text" name="txtmaxyear" value="${param.txtmaxyear}" />
                    </td>
                    <td>
                        ${requestScope.ErrorInput.yearError}
                    </td>
                </tr>
            </table>
                    <input type="submit" value="SearchAllLaptop" name="btn" />
            <input type="submit" value="Search" name="btn" /><br/>
        </form>
                    <c:if test="${empty requestScope.ErrorInput}">
                        <c:if test="${not empty requestScope.LapList}">
                            <table border="1">
                                <thead>
                                    <tr>
                                        <th>Id</th>
                                        <th>Name</th>
                                        <th>Price</th>
                                        <th>CPU</th>
                                        <th>Ram</th>
                                        <th>Screen</th>
                                        <th>Year</th>
                                        <th>Add To Cart</th>
                                        <th>View Detail</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="lap" items="${requestScope.LapList}">
                                        <form action="UserAddItemToCart">
                                            <tr>
                                                <td>
                                                    ${lap.id}
                                                    <input type="hidden" name="txtLaptopId" value="${lap.id}" />
                                                </td>
                                                <td>
                                                    ${lap.name}
                                                </td>
                                                <td>
                                                    ${lap.price}
                                                </td>
                                                <td>
                                                    ${lap.CPU}
                                                </td>
                                                <td>
                                                    ${lap.ram}
                                                </td>
                                                <td>
                                                    ${lap.screen}
                                                </td>
                                                <td>
                                                    ${lap.year}
                                                </td>
                                                <td>
                                                    <input type="submit" value="Add To Cart" name="btn" />
                                                </td>
                                                <td>
                                                <c:url var="urlRewriting" value="UserViewDetailServlet">
                                                <c:param name="id" value="${lap.id}"/>
                                                <c:param name="txtlastname" value="${txtlaptopname}"/>
                                                <c:param name="txtlastminprice" value="${txtminprice}"/>
                                                <c:param name="txtlastmaxprice" value="${txtmaxprice}"/>
                                                <c:param name="txtlastminyear" value="${txtminyear}"/>
                                                <c:param name="txtlastmaxyear" value="${txtmaxyear}"/>
                                                </c:url>
                                                    <a href="${urlRewriting}">Click here to View Detail</a>
                                                </td>
                                            </tr>
                                        </form>
                                    </c:forEach>
                                                 
                                </tbody>
                            </table>

                        </c:if>
                        <c:if test="${empty requestScope.LapList }">
                            <h2>
                                No record is search
                            </h2>
                        </c:if>
                    </c:if>
                    
    </body>
</html>
