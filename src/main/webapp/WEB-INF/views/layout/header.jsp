<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Bare - Start Bootstrap Template</title>
        <!-- Favicon-->
        <link rel="icon" type="resources/image/x-icon" href="/resources/assets/favicon.ico" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="/resources/css/styles.css" rel="stylesheet" />
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
    </head>
<style type="text/css">
a {
	text-decoration: none;
	color: black;
}
</style>   
    
<body>
 <!-- Responsive navbar-->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container">
                <a class="navbar-brand" href="/">spring project</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                        <c:if test="${login != null}">
                        	<li class="nav-item"><a class="nav-link active" aria-current="page" href="/">${login.nickName}님 환영!</a></li>                        
                        </c:if>
                        
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="/">홈</a></li>
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="/board/listPage?num=1">게시판</a></li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">메뉴</a>
                            <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                              	<c:if test="${login == null}">
	                                <li><a class="dropdown-item" href="/member/signin">로그인</a></li>
	                                <li><a class="dropdown-item" href="/member/signup">회원가입</a></li>
	                                <!-- <li><hr class="dropdown-divider" /></li> -->
                                </c:if>
                                
                                <c:if test="${login != null}">
	                                <li><a class="dropdown-item" href="/member/signout">로그아웃</a></li>
                                </c:if>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
</body>
</html>