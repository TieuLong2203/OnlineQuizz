+<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 3/7/2024
  Time: 4:43 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Profile</title>
    <link rel="stylesheet" href="../../css/EditProfile.css">
    <link rel="shortcut icon" type="image/png" href="${pageContext.request.contextPath}/images/logo96x96.png"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/webjars/bootstrap/5.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/webjars/font-awesome/6.5.1/css/all.min.css">
    <script src="${pageContext. request. contextPath}/webjars/bootstrap/5.3.2/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext. request. contextPath}/webjars/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>
<jsp:include page="../../../components/header.jsp"/>
<main class="min-vh-100" style="background-color: #eee;">
    <div class="container h-auto">
        <div class="row d-flex justify-content-center align-items-center h-auto">
            <div class="col-lg-12 col-xl-11">
                <div class="card text-black" style="border-radius: 25px;">
                    <div class="card-body p-md-5">
                        <div class="row justify-content-center">
                            <div class="col-md-10 col-lg-6 col-xl-5 order-2 order-lg-1">
                                <p class="text-center h1 fw-bold mb-5 mx-1 mx-md-4 mt-4">Edit Profile</p>
                                <%--                                update avatar--%>
                                <div class="d-flex justify-content-center mb-5">
                                    <div class="d-flex justify-content-center">
                                        <div class="d-flex flex-column align-items-center">
                                            <div class="my-5 d-flex align-items-center justify-content-center overflow-hidden">
                                                <c:set var="noAvatar" value="${pageContext.request.contextPath}/images/noImage.png"/>
                                                <img id="avatarPreview" src="${sessionScope.user.avatar != null ? sessionScope.user.avatar : noAvatar}" alt="" class="rounded-circle" height="240" width="240">
                                            </div>
                                            <div>
                                                <form id="changeAvatarForm" action="update-avatar" method="GET" class="d-flex align-items-center justify-content-center">
                                                    <input type="hidden" id="avatarUrl" name="avatarUrl">
                                                    <input id="fileInput" type="file" class="d-none" accept=".jpg,.jpeg,.png">
                                                    <button type="submit" id="buttonSubmitForm" class="d-none btn btn-primary">
                                                        Change
                                                    </button>
                                                </form>
                                                <button id="buttonOpenFile" onclick="changeAvatarButton()" class="btn btn-primary">
                                                    Select Avatar
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <form action="./update" method="post" enctype="multipart/form-data"
                                      class="mx-1 mx-md-4">
                                    <input name="uid" type="hidden" value="${requestScope.user.id}">
                                    <div class="w-100">
                                        <div class="d-flex flex-row align-items-center mb-4">
                                            <i class="fas fa-user fa-lg me-3 fa-fw"></i>
                                            <div class="input-group form-outline flex-fill mb-0">
                                                <input type="text" name="first-name" placeholder="First Name"
                                                       class="form-control" value="${sessionScope.user.givenName}"
                                                       required/>
                                                <input type="text" name="last-name" placeholder="Last Name"
                                                       class="form-control" value="${sessionScope.user.familyName}"
                                                       required/>
                                            </div>
                                        </div>
                                        <div class="d-flex flex-row align-items-center mb-4">
                                            <i class="fa-solid fa-address-card fa-lg me-3 fa-fw"></i>
                                            <div class="form-outline flex-fill mb-0">
                                                <input type="text" name="username" placeholder="Username"
                                                       class="form-control"
                                                       value="${sessionScope.user.username}" required/>
                                            </div>
                                        </div>
                                        <div class="d-flex flex-row align-items-center mb-4">
                                            <i class="fas fa-envelope fa-lg me-3 fa-fw"></i>
                                            <div class="form-outline flex-fill mb-0">
                                                <input type="email" name="email" placeholder="Email"
                                                       class="form-control"
                                                       value="${sessionScope.user.email}" required/>
                                            </div>
                                        </div>
                                        <div class="d-flex flex-row align-items-center mb-4">
                                            <i class="fas fa-lock-open fa-lg me-3 fa-fw"></i>
                                            <div class="form-outline flex-fill mb-0">
                                                <input type="password" name="current_password"
                                                       placeholder="Current_password"
                                                       class="form-control"
                                                       value="${sessionScope.user.password}" required/>
                                            </div>
                                        </div>
                                        <div class="input-group d-flex flex-row align-items-center mb-4 position-relative">
                                            <i class="fas fa-lock fa-lg me-3 fa-fw "></i>
                                            <span class="position-absolute top-custom start-100 translate-middle-y p-1"
                                                  id="show-hide-password">
                                                <i class="fa-regular fa-eye-slash"></i>
                                            </span>
                                            <input
                                                    type="password"
                                                    class="form-control rounded mt-1 password"
                                                    placeholder="Type your password"
                                                    aria-label="password"
                                                    aria-describedby="password"
                                                    name="password"
                                                    id="password-input"
                                            />
                                            <div class="valid-feedback">Good</div>
                                            <div class="invalid-feedback">Wrong</div>
                                        </div>
                                        <div
                                                class="alert px-4 py-3 mb-0 d-none"
                                                role="alert"
                                                data-mdb-color="warning"
                                                id="password-alert"
                                        >
                                            <ul class="list-unstyled mb-0">
                                                <li class="requirements leng">
                                                    <i class="fas fa-check text-success me-2"></i>
                                                    <i class="fas fa-times text-danger me-3"></i>
                                                    Your password must have at least 8 chars
                                                </li>
                                                <li class="requirements big-letter">
                                                    <i class="fas fa-check text-success me-2"></i>
                                                    <i class="fas fa-times text-danger me-3"></i>
                                                    Your password must have at least 1 big letter.
                                                </li>
                                                <li class="requirements num">
                                                    <i class="fas fa-check text-success me-2"></i>
                                                    <i class="fas fa-times text-danger me-3"></i>
                                                    Your password must have at least 1 number.
                                                </li>
                                                <li class="requirements special-char">
                                                    <i class="fas fa-check text-success me-2"></i>
                                                    <i class="fas fa-times text-danger me-3"></i>
                                                    Your password must have at least 1 special char.
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="d-flex justify-content-left mx-4 mb-3 mb-lg-4">
                                        </div>
                                        <button type="submit" class="btn btn-primary btn-lg">Submit</button>
                                        <button type="submit" class="btn btn-light btn-lg">Cancle</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>
<jsp:include page="../../../components/footer.jsp"/>
<script src="${pageContext. request. contextPath}/js/UpdateProfile.js"></script>
<script src="https://www.gstatic.com/firebasejs/8.3.2/firebase-app.js"></script>
<script src="https://www.gstatic.com/firebasejs/8.3.2/firebase-storage.js"></script>
<script src="${pageContext. request. contextPath}/js/UploadFirebase.js"></script>
</body>
</html>

