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
        <title>Login page</title>
    </head>
    <body>
        
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
                <a href="signup.jsp">Sign up a new account</a>
    </body>
</html>
