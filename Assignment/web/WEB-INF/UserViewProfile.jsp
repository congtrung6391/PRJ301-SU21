<%-- 
    Document   : UserViewProfile
    Created on : Jul 10, 2021, 2:29:40 AM
    Author     : khang
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Profile Page</title>
    </head>
    <body>
        <h1>Your Profile</h1>
        
        <form action="UserUpdateServlet">
            <font color="red">
                ${requestScope.Updatesuccess}
                ${requestScope.Fail}
            </font>
        <table>
            <tr>
                <td>Username:</td>
                <td>
                    <input type="text" name="txtusername" value="${sessionScope.USER.username}" readonly />
                </td>
            </tr>
            <tr>
                <td>Password:</td>
                <td>
                    <input type="password" name="txtpassword" 
                           <c:if test="${empty requestScope.ERROR.passwordError}">
                               value="${sessionScope.USER.password}"
                           </c:if>
                           <c:if test="${not empty requestScope.ERROR.passwordError}">
                               value=""
                           </c:if>
                            />
                    
                </td>
                <td>
                    <font color="red">
                        ${requestScope.Error.passwordError}
                    </font>
                </td>
            </tr>
            <tr>
                <td>Full Name:</td>
                <td>
                    <input type="text" name="txtfullname" 
                           <c:if test="${empty requestScope.Error.nameError}">
                               value="${sessionScope.USER.name}"
                           </c:if>
                           <c:if test="${not empty requestScope.Error.nameError}">
                               value="${param.txtfullname}"
                           </c:if>
                            />
                    
                </td>
                <td>
                    <font color="red">
                        ${requestScope.Error.nameError}
                    </font>
                </td>
            </tr>
            <tr>
                <td>Phone:</td>
                <td>
                    <input type="number" name="txtphone" 
                           <c:if test="${empty requestScope.Error.phoneError}">
                               value="${sessionScope.USER.phone}"
                           </c:if>
                           <c:if test="${not empty requestScope.Error.phoneError}">
                               value ="${param.txtphone}"
                           </c:if>
                            />
                    
                </td>
                <td>
                    <font color="red">
                    ${requestScope.Error.phoneError}
                    </font>
                </td>
            </tr>
            <tr>
                <td>Address:</td>
                <td>
                    <input type="text" name="txtaddress" 
                           <c:if test="${empty requestScope.Error.addressError}">
                               value="${sessionScope.USER.address}"
                           </c:if>
                           <c:if test="${not empty requestScope.Error.addressError}">
                               value="${param.txtaddress}"
                           </c:if>
                            />
                    
                </td>
                <td>
                    <font color="red">
                    ${requestScope.Error.addressError}
                    </font>
                </td>
            </tr>
        </table>
                    <input type="submit" value="Update Information" name="btn" />
                </form>
                    <a href="UserListServlet">Click here to return Home Page</a>
                
    </body>
</html>
