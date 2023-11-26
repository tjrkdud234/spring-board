<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
       	<%@ include file="/WEB-INF/views/layout/header.jsp" %> 
       	
<style>
#box{
display: table;
margin-left: auto;
margin-right: auto;
position: absolute;
top: 50%;
left: 50%;
transform: translate(-50%, -50%);
display: flex;
justify-content: center;
}
h4 {
margin-top: 30px;
text-align: center;
}
#button {
    width: 100px;
    margin: auto;
    display: block;
}
input {
}


</style>
<section id="content">
	<div class="container" id=box>
		<form role="form" method="post" autocomplete="off">
         <h4>로그인</h4>
			<div class="mb-3">
				<label for="id">아이디<span class="text-muted"></span></label>
				<input type="text" class="form-control" name="id">
			</div>
			
			<div class="mb-3">
				<label for="pass">비밀번호<span class="text-muted"></span></label> 
				<input type="password" class="form-control" name="pass">
			</div>
			
			<div id="button">
				<button class="btn btn-light" type="submit" id="signin_btn" name="signin_btn">로그인</button>
			</div>
					    
			<c:if test="${msg == false}">
			<p style="color:#f00;">로그인에 실패했습니다.</p>
			</c:if>
		    
		</form>  
	</div>   
</section>
