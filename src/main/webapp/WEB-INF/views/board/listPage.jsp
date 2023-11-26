<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
       	<%@ include file="/WEB-INF/views/layout/header.jsp" %> 
<style type="text/css">
a {
	text-decoration: none;
}

.page-link {
  color: #000; 
  background-color: #fff;
  border: 1px solid #ccc; 
}

.page-item.active .page-link {
 z-index: 1;
 color: #555;
 font-weight:bold;
 background-color: #f1f1f1;
 border-color: #ccc;
 
}

.page-link:focus, .page-link:hover {
  color: #000;
  background-color: #fafafa; 
  border-color: #ccc;
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
	
	<!-- 이전 -->
<nav aria-label="Page navigation example">
	<ul class="pagination justify-content-center">		
		<c:if test="${page.prev}">
			<li class="page-item">
				<a class="page-link" href="/board/listPage?num=${page.startPageNum - 1}"><span aria-hidden="true">&laquo;</span></a>
			</li>
		</c:if>
		
		<!-- 페이지 -->
		<c:forEach begin="${page.startPageNum}" end="${page.endPageNum}" var="num">
			<c:if test="${select != num}">
				<li class="page-item">
					<a class="page-link" href="/board/listPage?num=${num}">${num}</a>
				</li>
			</c:if>
			
			<c:if test="${select == num}">
				<li class="page-item active" aria-current="page">
					<b class="page-link">${num}</b>
				</li>
			</c:if>
		</c:forEach>
		
		<!-- 다음 -->	
		<c:if test="${page.next}">
			<li class="page-item" id="dataTable_next">
				<a class="page-link" href="/board/listPage?num=${page.endPageNum + 1}"> <span aria-hidden="true">&raquo;</span></a>
			</li>
		</c:if>		
	</ul>
</nav>
</div>
</body>
</html>