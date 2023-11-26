<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
       	<%@ include file="/WEB-INF/views/layout/header.jsp" %> 
<title>게시물 수정</title> 	
<body>
<div class="container">
<div class="input-form col-md-12 mx-auto">
	<form method="post">
		<div class="form-floating mb-3">
			<textarea name="title" class="form-control" placeholder="Leave a comment here" id="floatingTextarea2">${view.title}</textarea>
			<label for="floatingTextarea">제목</label>
		</div>
		
		<div class="form-floating mb-3">
			<textarea name="id" class="form-control" placeholder="Leave a comment here" id="floatingTextarea2">${view.id}</textarea>
			<label for="floatingTextarea">작성자</label>
		</div>
		
		<div class="form-floating mb-3">
			<textarea name="contents" class="form-control" placeholder="Leave a comment here" id="floatingTextarea2" style="height: 300px">${view.contents}</textarea>
			<label for="floatingTextarea">내용</label>
		</div>
		<div>
		<button type="submit" class="btn btn-light">수정</button>
		<a href="/board/listPage?num=1"><button class="btn btn-light">취소</button></a>
		</div>
	</form>
</div>
</div>
<!-- </body> -->
</html>