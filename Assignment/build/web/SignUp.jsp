<%-- 
    Document   : signup
    Created on : Jun 27, 2021, 11:07:28 PM
    Author     : khang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign Up Page</title>
    </head>
    <body>
        <h1>Sign Up A New Account</h1>
        <font color="red">
            ${requestScope.SUCCESS}
        </font>
        
        <form action="SignUpServlet">    
        <table>
            <tr>
                <td>Username:</td>
                <td>
                    <input type="text" name="txtusername" value="${param.txtusername}" />
                    <font color="red">
                        ${errorobj.usernameError}
                    </font>                
                </td>
            </tr>
            <tr>
                <td>Password:</td>
                <td>
                    <input type="password" name="txtpassword" value="" />
                    <font color="red">
                        ${errorobj.passwordError}
                    </font>                 
                </td>
            </tr>
            <tr>
                <td>Name:</td>
                <td>
                    <input type="text" name="txtname" value="${param.txtname}" />
                    <font color="red">
                        ${errorobj.nameError}
                    </font>                    
                </td>
            </tr>
            <tr>
                <td>Phone:</td>
                <td>
                    <input type="number" name="txtphone" value="${param.txtphone}" />                    
                    <font color="red">
                        ${errorobj.phoneError}
                    </font>
                </td>
            </tr>
            <tr>
                <td>Address:</td>
                <td>
                    <input type="text" name="txtaddress" value="${param.txtaddress}" />              
                    <font color="red">
                        ${errorobj.addressError}
                    </font>
                </td>
            </tr>
        </table>
                <input type="submit" value="Sign Up" name="btn" /><br/>
                <input type="reset" value="Reset" />
        </form>
                    <a href="Login.jsp">Click here to return Login Page</a>
    </body>
</html>
