<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2/25/2024
  Time: 6:24 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Search Result</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/images/logo96x96.png" type="image/png">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/webjars/bootstrap/5.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/webjars/font-awesome/6.5.1/css/all.min.css">
    <script src="${pageContext. request. contextPath}/webjars/bootstrap/5.3.2/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext. request. contextPath}/webjars/jquery/3.7.1/jquery.min.js"></script>
<%--    <script src="https://cdn.tailwindcss.com"></script>--%>
    <style>
        .card-info p:hover {
            font-weight: bold;
            background-color: #f0f0f0; /* Adjust the color as needed */
            /*padding: 2px 5px; !* Adjust padding as needed *!*/
            /*border-radius: 3px; !* Optional: add rounded corners *!*/
        }

        .nav-link {
            color: black !important;
        }

        .nav-link:hover {
            color: rgb(40, 110, 231) !important;
        }

        /*body {*/
        /*    display: flex;*/
        /*    min-height: 100vh;*/
        /*    margin: 0;*/
        /*    !* align-items: center; *!*/
        /*    justify-content: center;*/
        /*}*/

        main {
        }

        .row {
            display: flex;
            flex-wrap: wrap;
            margin: -5px;
            /* Đảm bảo giữa các col có khoảng cách */
        }

        .col-md-4 {
            flex: 0 0 33.333333%;
            max-width: 33.333333%;
            padding: 5px;
            /* Tạo khoảng cách giữa các col */
        }

        .card {
            width: 100%;
            border: 1px solid #ccc;
            border-radius: 20px;
            overflow: hidden;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .card img {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            float: left;
            margin-right: 10px;
            margin-left: 16px;
            margin-top: 10px;
        }

        .card-body {
            padding: 20px;
        }

        .card-title {
            font-size: 1.25rem;
            margin-bottom: 10px;
        }

        .card-subtitle {
            margin-top: 20px;
            font-size: 0.7rem;
        }

        .card-subtitle p {
            margin: 5px 10px 5px 0;
            padding: 8px;
            border: 2px solid #ccc;
            border-radius: 5px;
            background-color: #f0f0f0;
            float: left;
        }
    </style>
</head>

<body>
<jsp:include page="../../../components/header.jsp"></jsp:include>
<main class="justify-content-center pt-20" style="margin-top: 96px">
    <div class="SearchResultPage" style="margin: 0 auto; max-width: calc(100% - 100px);">
        <section id="SearchResultPageHeader-mainExperiment">
            <div class="SearchResultPageHeader-container">
                <div class="SearchResultPageHeader-queryFeedback" style="margin-left: 130px;">
                    <div class="SearchResultsPageHeader-resultsFor" id="SearchResultsPageHeader-resultsFor"><b>Results
                        for "${txtSearch}"</b>>
                    </div>
                </div>

                <div class="SearchResultsPageHeader-subNavExperiment" id="SearchResultsPageHeader-subNavItem">
                    <div class="TabsWrapper">
                        <ul class="nav nav-tabs mb-3" style="margin-left: 130px;" id="myTab0" role="tablist">
                            <li class="nav-item" role="presentation">
                                <button data-mdb-tab-init class="nav-link" id="home-tab0"
                                        data-mdb-target="#allresults" type="button" role="tab" aria-controls="home"
                                        aria-selected="true">
                                    All results
                                </button>
                            </li>
                            <li class="nav-item" role="presentation">
                                <button data-mdb-tab-init class="nav-link" id="profile-tab0" data-mdb-target="#set"
                                        type="button" role="tab" aria-controls="profile" aria-selected="false">
                                    Set
                                </button>
                            </li>
                            <li class="nav-item" role="presentation">
                                <button data-mdb-tab-init class="nav-link" id="contact-tab0" data-mdb-target="#user"
                                        type="button" role="tab" aria-controls="contact" aria-selected="false">
                                    User
                                </button>
                            </li>
                            <li class="nav-item" role="presentation">
                                <button data-mdb-tab-init class="nav-link" id="room-tab0" data-mdb-target="#room"
                                        type="button" role="tab" aria-controls="contact" aria-selected="false">
                                    Room
                                </button>
                            </li>
                        </ul>
                        <%-- content--%>
                        <div class="tab-content" style="margin-left: 130px; margin-right: 130px" id="myTabContent0">
                            <%-- All result--%>
                            <div class="tab-pane fade show active" id="allresults" role="tabpanel"
                                 aria-labelledby="home-tab0">
                                <!-- User -->
                                <div class="container">
                                    <!-- Div row chứa các thành phần -->
                                    <div class="row mb-3 border-bottom pb-3" id="userRow"
                                         style="display: ${empty listUser ? 'none' : 'block'}">
                                        <!-- Div row đầu tiên chứa text và button -->
                                        <div class="row">
                                            <div class="col-md-9">
                                                <h4 class="mb-0" style="font-weight: bold">user</h4>
                                            </div>
                                            <div class="col-md-3 text-right" id="seeAllButton">
                                                <button class="btn btn-primary ml-auto">See All</button>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Div row chứa 2 card -->
                                    <%--user--%>
                                    <div class="row">
                                        <c:forEach items="${listUser}" begin="0" end="1" var="u" varStatus="loop">
                                            <div class="col-md-6 mb-4" style="margin-top: 5px">
                                                <div class="card">
                                                    <img src="${u.avatar}" class="card-img-top" alt="avatar"/>
                                                    <div class="card-body">
                                                        <h5 class="card-title">${u.username}</h5>
                                                        <h5 class="card-subtitle card-info">
                                                            <p class="d-inline"><i
                                                                    class="fa-solid fa-folder-open"></i> ${countSet[loop.index]}
                                                                learning set
                                                            </p>
                                                            <p class="d-inline"><i
                                                                    class="fa-solid fa-user"></i> ${countRoom[loop.index]}
                                                                class
                                                            </p>
                                                        </h5>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                                <!-- set -->
                                <div class="container" style="margin-top: 10px;">
                                    <!-- Div row chứa các thành phần -->
                                    <div class="row mb-3 border-bottom pb-3"
                                         style="display: ${empty requestScope.listSet ? 'none' : 'block'}">
                                        <!-- Div row đầu tiên chứa text và button -->
                                        <div class="row">
                                            <div class="col-md-9">
                                                <h4 class="mb-0" style="font-weight: bold">study set</h4>
                                            </div>
                                            <div class="col-md-3 text-right" id="seeAllButton2">
                                                <button class="btn btn-primary ml-auto">See All</button>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Div row chứa 2 card -->
                                    <div class="row">
                                        <c:forEach items="${requestScope.listSet}" begin="0" end="2" var="s">
                                            <div class="col-md-4">
                                                <div class="card" style="border: 1px solid #ccc;
                                            border-radius: 5px;
                                            padding: 10px;
                                            max-width: 300px;
                                            margin: 10px">
                                                    <div class="card-content" style="display: flex;
                                                flex-direction: column;">
                                                        <h5 class="card-title" style="font-size: 18px;
                                                    margin-bottom: 10px;">${s.getSName()}</h5>
                                                        <div class="card-details" style="  display: flex;
                                                    align-items: center;">
                                                            <img src="${s.getUser().getAvatar()}" alt="Image"
                                                                 class="circular-image"
                                                                 style="  width: 30px;
                                                        height: 30px;
                                                        border-radius: 50%;
                                                        margin-right: 10px;"/>
                                                            <p class="card-text" style=" flex: 1;
                                                        margin-right: 10px;
                                                        margin-top: 10px;">${s.getUser().getUsername()}</p>
                                                            <button class="btn" style=" padding: 8px 10px;
                                                        background-color: #007bff;
                                                        color:white;">Xem trước
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                                <!-- room -->
                                <div class="container" style="margin-top: 10px;">
                                    <!-- Div row chứa các thành phần -->
                                    <div class="row mb-3 border-bottom pb-3"
                                         style="display: ${empty listRoom ? 'none' : 'block'}">
                                        <!-- Div row đầu tiên chứa text và button -->
                                        <div class="row">
                                            <div class="col-md-9">
                                                <h4 class="mb-0">Room</h4>
                                            </div>
                                            <div class="col-md-3 text-right" id="seeAllButton3">
                                                <button class="btn btn-primary ml-auto">See All</button>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Div row chứa 2 card -->
                                    <div class="row">
                                        <c:forEach items="${listRoom}" begin="0" end="1" var="r">
                                            <div class="col-md-6 mb-4" style="margin-top: 10px;">
                                                <div class="card">
                                                    <div class="card-body">
                                                        <h5 class="card-title">${r.roomName}
                                                            <span class="icon" style="float: right;">
                                                            <i class="fa-solid fa-user"></i>
                                                        </span>
                                                        </h5>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                            <%-- ứng với mỗi tablist--%>
                            <%--set--%>
                            <div class="tab-pane fade pb-4" id="set" role="tabpanel" aria-labelledby="profile-tab0">
                                <div class="row">
                                    <%-- Check if listSet is empty --%>
                                    <c:choose>
                                        <c:when test="${empty requestScope.listSet}">
                                            <!-- Print an alternative HTML structure if listSet is empty -->
                                            <div class="col-md-12">
                                                <div>
                                                    <h2 class="font-weight-bold mb-4 text-center">No results.</h2>
                                                    <h4 class="font-weight-bold mb-4 text-center">Here are some
                                                        suggestions to improve your search
                                                        results:</h4>
                                                    <ul class="mb-0 pl-8 flex flex-col items-center gap-2"
                                                        style="margin-left: 60px">
                                                        <li class="w-1/2 ml-20">Check your spelling or try a different
                                                            spelling
                                                        </li>
                                                        <li class="w-1/2 ml-20">Search with different keywords</li>
                                                        <li class="w-1/2 ml-20">Clear filter</li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </c:when>
                                        <c:otherwise>
                                            <c:forEach items="${requestScope.listSet}" var="s">
                                                <div class="col-md-6">
                                                    <div class="card" style="border: 1px solid #ccc;
                                    border-radius: 5px;
                                    padding: 10px;
                                    max-width: 300px;
                                    margin: 10px">
                                                        <div class="card-content" style="display: flex;
                                        flex-direction: column;">
                                                            <h5 class="card-title" style="font-size: 18px;
                                                margin-bottom: 10px;">${s.getSName()}</h5>
                                                            <div class="card-details" style="  display: flex;
                                            align-items: center;">
                                                                <img src="${s.getUser().getAvatar()}" alt="Image"
                                                                     class="circular-image"
                                                                     style="  width: 30px;
                                        height: 30px;
                                        border-radius: 50%;
                                        margin-right: 10px;"/>
                                                                <p class="card-text" style=" flex: 1;
                                        margin-right: 10px;
                                        margin-top: 10px;">${s.getUser().getUsername()}</p>
                                                                <button class="btn" style=" padding: 8px 10px;
                                            background-color: #007bff;
                                            color:white;">Xem trước
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:forEach>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </div>
                            <%--user--%>
                            <div class="tab-pane fade pb-4" id="user" role="tabpanel" aria-labelledby="contact-tab0">
                                <div class="row">
                                    <c:choose>
                                        <c:when test="${empty listUser}">
                                            <!-- Print an alternative HTML structure if listUser is empty -->
                                            <div class="col-md-12">
                                                <div>
                                                    <h2 class="font-weight-bold mb-4 text-center">No results.</h2>
                                                    <h4 class="font-weight-bold mb-4 text-center">Here are some
                                                        suggestions
                                                        to improve your search results:</h4>
                                                    <ul class="mb-0 pl-8 flex flex-col items-center gap-2"
                                                        style="margin-left: 60px">
                                                        <li class="w-1/2 ml-20">Check your spelling or try a different
                                                            spelling
                                                        </li>
                                                        <li class="w-1/2 ml-20">Search with different keywords</li>
                                                        <li class="w-1/2 ml-20">Clear filter</li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </c:when>
                                        <c:otherwise>
                                            <c:forEach items="${listUser}" var="u" varStatus="loop">
                                                <div class="col-md-4 mb-4">
                                                    <div class="card">
                                                        <img src="${u.avatar}" class="card-img-top" alt="avatar"/>
                                                        <div class="card-body">
                                                            <h5 class="card-title">${u.username}</h5>
                                                            <h5 class="card-subtitle">
                                                                <p class="d-inline"><i
                                                                        class="fa-solid fa-folder-open"></i> ${countSet[loop.index]}
                                                                    set</p>
                                                                <p class="d-inline"><i
                                                                        class="fa-solid fa-user"></i> ${countRoom[loop.index]}
                                                                    room</p>
                                                            </h5>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:forEach>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </div>
                            <%--room--%>
                            <div class="tab-pane fade pb-4" id="room" role="tabpanel" aria-labelledby="room-tab0">
                                <div class="row">
                                    <c:choose>
                                        <c:when test="${empty listRoom}">
                                            <!-- Print an alternative HTML structure if listSet is empty -->
                                            <div class="col-md-12">
                                                <div>
                                                    <h2 class="font-weight-bold mb-4 text-center">No results.</h2>
                                                    <h4 class="font-weight-bold mb-4 text-center">Here are some
                                                        suggestions
                                                        to improve your search results:</h4>
                                                    <ul class="mb-0 pl-8 flex flex-col items-center gap-2"
                                                        style="margin-left: 60px">
                                                        <li class="w-1/2 ml-20">Check your spelling or try a different
                                                            spelling
                                                        </li>
                                                        <li class="w-1/2 ml-20">Search with different keywords</li>
                                                        <li class="w-1/2 ml-20">Clear filter</li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </c:when>
                                        <c:otherwise>
                                            <c:forEach items="${listRoom}" var="r">
                                                <div class="col-md-6" style="margin-top: 10px;">
                                                    <div class="card">
                                                        <div class="card-body">
                                                            <h5 class="card-title">${r.roomName}
                                                                <span class="icon" style="float: right;">
                                <i class="fa-solid fa-user"></i>
                            </span>
                                                            </h5>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:forEach>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
    <script>
        function viewSet(sid) {
            window.location.href = '/Quizzicle/user/set/get?setID=' + sid;
        }
    </script>
</main>
<jsp:include page="../../../components/footer.jsp"></jsp:include>
<script>
    $(document).ready(function () {
        // Kích hoạt tab Bootstrap
        $('[data-mdb-tab-init]').on('click', function () {
            var target = $(this).attr('data-mdb-target');
            $('.tab-pane').removeClass('show active');
            $(target).addClass('show active');
        });
    });
</script>

</body>

</html>
