<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="../layout/header.jsp"></jsp:include>
<jsp:include page="../layout/navbar.jsp"></jsp:include>

<div class="container-md">


<form action="/member/register" method="post">
	<div class="mb-3">
		<label for="email" class="form-label">이메일 : </label> 
		<input type="email" name="email" class="form-control" id="email" placeholder="email@000.com">
	</div>
	<div class="mb-3">
		<label for="password" class="form-label">비밀번호 :</label> 
		<input type="password" name="pwd" class="form-control" id="pwd" >
	</div>
	<div class="mb-3">
		<label for="nickName" class="form-label">닉네임 : </label> 
		<input type="text" name="nickName" class="form-control" id="nickName" placeholder="Nick - Name">
	</div>
<button type="submit" class="btn btn-dark" >회 원 가 입</button>


</form>
</div>
<jsp:include page="../layout/footer.jsp"></jsp:include>