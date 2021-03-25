<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Title -->

    <title>Pet Sitting</title>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport"  content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- ####BootStrap link & script####  -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:200,300,400,500,600,700,800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

    <link rel="stylesheet" href="<c:url value="/css/animate.css"/>">
    <link rel="stylesheet" href="<c:url value="/css/owl.carousel.min.css"/>">
    <link rel="stylesheet" href="<c:url value="/css/owl.theme.default.min.css"/>">
    <link rel="stylesheet" href="<c:url value="/css/magnific-popup.css"/>">
    <link rel="stylesheet" href="<c:url value="/css/bootstrap-datepicker.css"/>">
    <link rel="stylesheet" href="<c:url value="/css/jquery.timepicker.css"/>">
    <link rel="stylesheet" href="<c:url value="/css/flaticon.css"/>">
    <link rel="stylesheet" href="<c:url value="/css/style.css"/>">
    <!-- Favicon -->
    <link href='<c:url value="/images/dog_foot.jpg"/>' rel="icon" type="image/jpg">
</head>
<script>
    function isLogin(typeofbbs) {
        $.ajax({
            url : "<c:url value='/Auth/IsLogin.do' />",
            type : "post",
            success : function(data) {
                console.log(typeofbbs);
                if (data == 'yes') {
                    if (typeofbbs == 'mypage')
                        location.replace("<c:url value='/Mypage/Mypage'/>");
                    else if (typeofbbs == 'community'){
                        location.replace("<c:url value='/Community/Community'/>");
                    }
                } else {
                    alert('로그인 후 이용할 수 있습니다.');
                    location.replace("<c:url value='/Auth/Login.do' />");
                }
            }
        });
    }

</script>
<header>
    <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
        <div class="container">
            <a class="navbar-brand" href="<c:url value="/"/>"><span class="flaticon-pawprint-1 mr-2"></span>Pet sitting</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="fa fa-bars"></span> Menu
            </button>
            <div class="collapse navbar-collapse" id="ftco-nav">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item"><a href="<c:url value="/"/>" class="nav-link">Home</a></li>
                    <!--<li class="nav-item"><a href="" class="nav-link">Community</a></li>--><!--/community/community-->
                    <li class="nav-item"><a class="nav-link" href="javascript:isLogin('community')">Community</a></li>

                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Service</a>
                        <div class="dropdown-menu" aria-labelledby="dropdown04">
                            <a class="dropdown-item" href="#">우석</a>
                            <a class="dropdown-item" href="#">현진</a>
                            <a class="dropdown-item" href="#">찬구</a>
                        </div>
                    </li>

                    <sec:authorize access="isAnonymous()">
                        <li class="nav-item"><a href="<c:url value="/Auth/Login"/>" class="nav-link">로그인/회원가입</a></li><!--/Auth/login-->
                    </sec:authorize>
                    <sec:authorize access="isAuthenticated()">
                        <li class="nav-item"><a href="<c:url value="/Auth/Logout"/>" class="nav-link">로그아웃</a></li><!--/Auth/logout-->
                        <li class="nav-item"><a href="<c:url value=""/>" class="nav-link">마이페이지</a></li><!--/Auth/logout-->
                    </sec:authorize>
                </ul>
            </div>
        </div>
    </nav>
</header>
</html>