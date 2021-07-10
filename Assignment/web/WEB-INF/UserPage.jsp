<%-- 
    Document   : UserPage
    Created on : Jul 4, 2021, 9:15:48 PM
    Author     : khang
--%>

<%@page import="java.text.DecimalFormat"%>
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
        <form action="UserViewProfileServlet">
            <input type="submit"  value="View Profile" name="btn" />
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
                        <font color="red">
                            ${requestScope.ErrorInput.nameError}
                        </font>
                        
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
                        <font color="red">
                            ${requestScope.ErrorInput.priceError}
                        </font>
                        
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
                        <font color="red">
                            ${requestScope.ErrorInput.yearError}
                        </font>
                        
                    </td>
                </tr>
            </table>                                                        
            <input type="submit" value="SearchAllLaptop" name="btn" />
            <input type="submit" value="Search" name="btn" /><br/>
        </form>
        <c:set var="txtlastname" value="${param.txtlaptopname}"/>
        <c:set var="txtlastminprice" value="${param.txtminprice}"/>
        <c:set var="txtlastmaxprice" value="${param.txtmaxprice}"/>
        <c:set var="txtlastminyear" value="${param.txtminyear}"/>
        <c:set var="txtlastmaxyear" value="${param.txtmaxyear}"/>
        <c:set var="btnlast" value="${param.btn}"/>
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
                                    <input type="hidden" name="lastname" value="${txtlastname}" />
                                    <input type="hidden" name="lastminprice" value="${txtlastminprice}" />
                                    <input type="hidden" name="lastmaxprice" value="${txtlastmaxprice}" />
                                    <input type="hidden" name="lastminyear" value="${txtlastminyear}" />
                                    <input type="hidden" name="lastmaxyear" value="${txtlastmaxyear}" />
                                    <input type="hidden" name="lastbtn" value="${btnlast}" />
                                    <input type="submit" value="Add To Cart" name="btnAdd" />
                                </td>
                                <td>
                                    <c:url var="urlRewriting" value="UserViewDetailServlet">
                                        <c:param name="id" value="${lap.id}"/>
                                        <c:param name="txtlastname" value="${param.txtlaptopname}"/>
                                        <c:param name="txtlastminprice" value="${param.txtminprice}"/>
                                        <c:param name="txtlastmaxprice" value="${param.txtmaxprice}"/>
                                        <c:param name="txtlastminyear" value="${param.txtminyear}"/>
                                        <c:param name="txtlastmaxyear" value="${param.txtmaxyear}"/>
                                        <c:param name="btn" value="${btnlast}"/>
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
    <form action="UserViewCartServlet" >
        <input type="hidden" name="txtlastname" value="${txtlastname}" />
        <input type="hidden" name="lastminprice" value="${txtlastminprice}" />
        <input type="hidden" name="lastmaxprice" value="${txtlastmaxprice}" />
        <input type="hidden" name="lastminyear" value="${txtlastminyear}" />
        <input type="hidden" name="lastmaxyear" value="${txtlastmaxyear}" />
        <input type="hidden" name="lastbtn" value="${btnlast}" />
        <input type="submit" value="View Your Cart" name="btn" />
    </form>

</body>
</html>
