<%-- 
    Document   : newjsp
    Created on : Jun 18, 2021, 3:21:27 PM
    Author     : khang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link 
            rel="stylesheet" 
            href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" 
            integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" 
            crossorigin="anonymous"
        >
        <link 
            rel="stylesheet" 
            href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css"
        >
        <link 
            href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700" 
            rel="stylesheet"
        >
        <link 
            rel="stylesheet" 
            type="text/css" 
            href="statics/css/style.css"
        >
        <title>Home Page</title>
    </head>
    <body>
        
        <%@include file="/WEB-INF/jsp/common/Header.jsp" %>

        <h1>Login Page</h1>
        <form action="LoginServlet" method="POST">
            <font color="red">
                ${requestScope.ErrorLogin}
                ${requestScope.NotLogin}
            </font>        
            <table>
                <tr>
                    <td>
                    Username : <input type="text" name="txtusername" value="${param.txtusername}" />
                    </td>
                </tr>
                <tr>
                    <td>
                    Password : <input type="password" name="txtpassword" value="" />
                    </td>
                </tr>
                <tr>
                    <td>
                    <input type="submit" value="Login" name="btn" />
                    <input type="reset" value="Reset" />
                    </td>
                </tr>
                
            </table>
        </form>
                <a href="SignUp.jsp">Sign up a new account</a>
    </body>
</html>
