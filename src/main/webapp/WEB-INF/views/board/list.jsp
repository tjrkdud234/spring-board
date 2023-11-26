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

<script type="text/javascript">
	function moveView(no) {
		location.href = '/board/view?no=' + no;
	}
</script>
<div class="container" id="wrapper">
	<div class="d-grid gap-2 d-md-flex justify-content-md-end">
	<a href="/board/write"><button type="button" class="btn btn-light e-md-2">새 글 작성<br/></button></a>
	</div>
	
	<table class="table table-hover">
		<thead>
			<tr>
				<th scope="col">번호</th>
				<th scope="col">제목</th>
				<th scope="col">작성자</th>
				<th scope="col">작성일</th>
				<th scope="col">조회수</th>
				<th scope="col">좋아요</th>
			</tr>
		</thead>
		
		<tbody class="table-group-divider">
			<c:forEach items="${list}" var="list">
				<tr onclick="moveView('${list.no}')">
					<td>${list.no}</td>
					<td>${list.title}</td>
					<td>${list.id}</td>
					<td>${list.createTime}</td>
					<td>${list.viewCounts}</td>
					<td>${list.likes}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<div>
		<c:forEach begin="1" end="${pageNum}" var="num">
			<span>
				<a href="/board/listPost?num=${num}">${num}</a>
			</span> 
		
		</c:forEach>
	</div>
</div>
</body>
</html>