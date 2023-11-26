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

</style>
	 <div class="container" id=box>
      <div id=box>
        <form role="form" method="post" autocomplete="off" class="validation-form" novalidate>
        
         <h4>회원가입</h4>
          <div class="mb-3">
            <label for="name">이름<span class="text-muted"></span></label>
            <input type="text" class="form-control" name="name" required style="width:500px;">
          </div>
           
          <div class="mb-3">
            <label for="nickname">닉네임<span class="text-muted"></span></label>
            <input type="text" class="form-control" name="nickName" required>
          </div>
          
          <div class="mb-3">
            <label for="id">아이디<span class="text-muted"></span></label>
            <input type="text" class="form-control" name="id">
          </div>

			<div class="mb-3">
				<label for="pass">비밀번호<span class="text-muted"></span></label> 
				<input type="password" class="form-control" name="pass">
			</div>

			<div class="mb-3">
            <label for="phone">휴대전화번호<span class="text-muted"></span></label>
            <input type="text" class="form-control" name="phone">
          </div>
          
          <div class="mb-3">
            <label for="birthDate">생년월일<span class="text-muted"></span></label>
            <input type="text" class="form-control" name="birthDate">
          </div>

          <div class="mb-4"></div>
          
          <div id="button">
          <button class="btn btn-light" type="submit" id="submit">가입하기</button>
          </div>
        </form>
        </div>
        </div>
