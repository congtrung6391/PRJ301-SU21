<%-- 
    Document   : Header.jsp
    Created on : Jul 4, 2021, 4:37:24 PM
    Author     : congt
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<nav class="navbar navbar-expand-xl navbar-light d-flex shadow-div">
    <div class="container">
        <div class="mr-auto p-2">
            <a class="navbar-brand" href="/Assignment">
                <img src="statics/icon/Logotargo.svg" alt="Logo"/>
            </a>
        </div>

        <div class="p-2">
                <ul class="nav justify-content-between list-unstyled">
                    <c:if test="${USER.getRole() eq 1}">
                        <!-- Admin -->
                        <li>
                            <a class="nav-link admin-link font-weight-bold" href="/Assignment">Admin</a>
                        </li>
                    </c:if>
                    <c:if test="${USER.getRole() eq 2}">
                        <!-- Customer -->
                        <li>
                            <a class="nav-link normal-link font-weight-bold" href="template/home.html"><h5>Home</h5></a>
                        </li>
                        <li>
                            <a class="nav-link normal-link font-weight-bold" href="template/job.html"><h5>Job</h5></a>
                        </li>
                        <li>
                            <a class="nav-link normal-link font-weight-bold" href="template/fruit.html"><h5>Fruit</h5></a>
                        </li>
                        <li>
                            <a class="nav-link normal-link font-weight-bold" href="template/stay.html"><h5>Room</h5></a>
                        </li>
                        <li>
                            <a class="nav-link normal-link font-weight-bold" href="template/faq.html"><h5>FAQ</h5></a>
                        </li>
                        <li>
                            <a class="nav-brand" href="template/fruit_cart.html">
                                <img src="statics/icon/shopping-cart.svg" alt="Cart" style="width:40px;">
                            </a>
                        </li>
                    </c:if>
                    <c:if test="${USER.getRole() eq 3}">
                        <!-- Staff -->
                    </c:if>
                    <li>
                        <a class="nav-link normal-link font-weight-bold" href="SignOutServlet">Logout</a>
                    </li>
                </ul>
        </div>
    </div>    
</nav>
