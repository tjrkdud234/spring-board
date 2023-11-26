<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
       	<%@ include file="/WEB-INF/views/layout/header.jsp" %> 
       	
<body>
<div class="container">
<div class="input-form col-md-12 mx-auto">
	<form method="post">
		<div class="form-floating mb-3">
			<textarea name="title" class="form-control" placeholder="Leave a comment here" id="floatingTextarea2"></textarea>
			<label for="floatingTextarea">제목</label>
		</div>
		
		<div class="mb-3">
			<label for="nickName"></label>
			<input type="hidden" name="id" value="${login.id}">				
			<input type="text" class="form-control" id="nickName" name="nickName" value="${login.nickName}" readonly="readonly">				
		</div>
		
		<div class="form-floating mb-3">
			<textarea name="contents" class="form-control" placeholder="Leave a comment here" id="floatingTextarea2" style="height: 300px"></textarea>
			<label for="floatingTextarea">내용</label>
		</div>
		<c:if test="${msg == 'login_error'}">
			<p>로그인 후 작성해주세요.</p>
		</c:if>
		<c:if test="${login != null}">
			<button type="submit" class="btn btn-light">작성</button>
		</c:if>
		<a href="/board/listPage?num=1"><button type="button" class="btn btn-light">목록 </button></a>
	</form>
		
</div>
</div>
</html>