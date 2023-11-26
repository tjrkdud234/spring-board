<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
       	<%@ include file="/WEB-INF/views/layout/header.jsp" %> 
<style type="text/css">
a {
	text-decoration: none;
}
</style>       	
<body>
<div class="container">
<div class="input-form col-md-12 mx-auto">
	<form method="post">
		<div class="mb-3">
			<input type="text" class="form-control" value="${view.title}" readonly>
		</div>
		
		<div class="mb-3">
			<input type="text" class="form-control" value="${view.id}" readonly>
		</div>
		
		<div class="mb-3">
			<input type="text" class="form-control" value="${view.contents}" style="height: 300px" readonly>
		</div>
	</form>
		<a href="/board/listPage?num=1"><button class="btn btn-light">목록</button></a>
		
		<c:if test="${login.id == view.id}">
		<a href="/board/modify?no=${view.no}"><button class="btn btn-light">수정</button></a>
		<a href="/board/delete?no=${view.no}"><button class="btn btn-light">삭제</button></a>
		</c:if>
		
</div>
</div>
</body>
</html>