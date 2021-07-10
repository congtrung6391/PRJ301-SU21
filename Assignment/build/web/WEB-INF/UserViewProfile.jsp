<%-- 
    Document   : UserViewProfile
    Created on : Jul 10, 2021, 2:29:40 AM
    Author     : khang
--%>

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
            </font>
        <table>
            <tr>
                <td>Username:</td>
                <td>
                    <input type="text" name="txtusername" value="${sessionScope.USER.username}" />
                    <font color="red">
                    ${requestScope.Error.usernameError}
                    </font>
                </td>
            </tr>
            <tr>
                <td>Password:</td>
                <td>
                    <input type="password" name="txtpassword" value="${sessionScope.USER.password}" />
                    <font color="red">
                        ${requestScope.Error.passwordError}
                    </font>
                </td>
            </tr>
            <tr>
                <td>Full Name:</td>
                <td>
                    <input type="text" name="txtfullname" value="${sessionScope.USER.name}" />
                    <font color="red">
                        ${requestScope.Error.nameError}
                    </font>
                </td>
            </tr>
            <tr>
                <td>Phone:</td>
                <td>
                    <input type="number" name="txtphone" value="${sessionScope.USER.phone}" />
                    <font color="red">
                    ${requestScope.phoneError}
                    </font>
                </td>
            </tr>
            <tr>
                <td>Address:</td>
                <td>
                    <input type="text" name="txtaddress" value="${sessionScope.USER.address}" />
                    <font color="red">
                    ${requestScope.addressError}
                    </font>
                </td>
            </tr>
        </table>
                    <input type="submit" value="Update Information" name="btn" />
                </form>
                    <a href="UserListServlet">Click here to return Home Page</a>
                
    </body>
</html>
