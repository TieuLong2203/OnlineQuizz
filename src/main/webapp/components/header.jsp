<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2/23/2024
  Time: 2:35 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header>
    <nav class="navbar navbar-expand-lg navbar-dark fixed-top">
        <a class="navbar-brand" href="#">
            <img src="../imagines/logo1250x1250.png" width="30" height="30" class="d-inline-block align-top" alt="">
            Quizzical
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class='fas fa-align-right'></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav" >
                <li class="nav-item active mr-5">
                    <a class="nav-link" href="#"><i class="fas fa-home"></i> Homepage</a>
                </li>
                <li class="nav-item active mr-5">
                    <a class="nav-link" href="${pageContext.request.contextPath}/user/room"><i class='fas fa-book'></i> Your room</a>
                </li>
                <li class="nav-item active mr-5">
                    <a class="nav-link" href="${pageContext.request.contextPath}/user/set"><i class='fas fa-book'></i> Your set</a>
                </li>
                <li class="nav-item mr-5 mt-1">
                    <form action="search" method="post" class="form-inline my-2 my-lg-0"
                          style="margin-top: 0.25rem; width: 120%">
                        <div class="input-group input-group-sm" style="width: 20vw">
                            <input name="query" type="text" class="form-control" aria-label="Small"
                                   aria-describedby="inputGroup-sizing-sm" placeholder="Search..." value="${txtSearch}" style="font-size: 18px">
                            <div class="input-group-append">
                                <button type="submit" class="btn btn-secondary btn-number">
                                    <i class="fa fa-search"></i>
                                </button>
                            </div>
                        </div>
                    </form>
                </li>
                <li class="nav-item mr-3 mt-1" id="custom-dropdown-li">
                    <button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenuButton"
                            data-toggle="dropdown"
                            aria-haspopup="true" aria-expanded="false">
                        <i class="fa-solid fa-plus  text-white" id="custom-dropdown-icon"></i>
                    </button>
                    <div class="dropdown" id="custom-dropdown">
                        <div class="dropdown-menu custom-dropdown" aria-labelledby="dropdownMenuButton">
                            <a class="dropdown-item custom-dropdown-item" href="./user/set/create"><i class="fas fa-cog"></i>
                                Set</a>
<%--                            <a class="dropdown-item custom-dropdown-item" href="./user/set/create"><i class="fas fa-folder"></i>--%>
<%--                                Question</a>--%>
                            <a class="dropdown-item custom-dropdown-item" href="./user/room"><i
                                    class="fa-solid fa-people-group"></i>
                                Room</a>
                        </div>
                    </div>
                </li>
                <c:if test="${sessionScope.user == null}">
                    <a class="btn sign-in-btn ml-2"
                       style="background-color: green;color: white;margin: auto;padding: 8px;margin-top: 5px;"
                       href="./login">LOGIN</a>
                    <!-- Register button -->
                    <a class="btn register-btn ml-2"
                       style="background-color: #3bb2f3;color: white; margin: auto; padding: 8px;margin-top: 5px;"
                       href="./register">SIGN UP</a>
                </c:if>
                <c:if test="${sessionScope.user != null}">
                    <div class="navbar-nav" style="margin-left: 30px;">
                        <li class="nav-item dropdown">
                            <a href="" class="nav-link dropdown-toggle" aria-haspopup="true" id="navbarDropdownNotification" data-toggle="dropdown" aria-expanded="false">
                                <i class="fa-sharp fa-solid fa-bell"></i>
                            </a>
                            <ul class="dropdown-menu" style="overflow-y: auto; max-height: 400px" aria-labelledby="navbarDropdownNotification">
                                <c:forEach items="${requestScope.notifications}" var="notification">
                                    <li class="dropdown-item">

                                    </li>
                                </c:forEach>
                            </ul>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle mt-0" href="#" id="navbarDropdown" role="button"
                               data-toggle="dropdown"
                               aria-haspopup="true" aria-expanded="false">
                                <i class="" style="font-size: 25px;"></i>
                                <img src="${sessionScope.user.avatar}" alt="UserAvatar"
                                     style="width: 25px;height: 25px;border-radius: 50%">
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="${pageContext.request.contextPath}/user/profile"><i class=" sfa-solid fa-gear"></i> Brief</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="${pageContext.request.contextPath}/user/profile/update"><i class="fas fa-cogs"></i> Settings</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="${pageContext.request.contextPath}/logout"><i class="fas fa-sign-out-alt"></i>Logout</a>
                            </div>
                        </li>
                    </div>
                </c:if>
            </ul>
        </div>
    </nav>
</header>
