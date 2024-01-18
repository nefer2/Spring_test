<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix ="sec" %>
    
    

<jsp:include page="../layout/header.jsp"></jsp:include>
<jsp:include page="../layout/navbar.jsp"></jsp:include>


<div class="container-md">
	<form action="/board/register" method="post" enctype="multipart/form-data">
		<div class="mb-3">
		  <label for="title" class="form-label">제목</label>
		  <input type="text" name="title" class="form-control" id="title" placeholder="제목을 입력해주세요.">
		</div>
		<div class="mb-3">
		  <label for="wirter" class="form-label">작성자</label>
	      <input type="text" name="writer" class="form-control" id="wirter" placeholder="작성자를 입력해주세요.">
		</div>
		<div class="mb-3">
		  <label for="content" class="form-label">내용</label>
		  <textarea name="content" class="form-control" id="content" placeholder="내용을 입력해주세요."></textarea>
		</div>
		
		
<!-- 파일 입력 라인 추가 -->
	<div class="mb-3">
		<input type="file" class="form-control" name="files" id="files"multiple="multiple" style="display: none"> <br>
		<!-- 파일 버튼 트리거를 사용하기 위해서 주는 버튼 -->
		<button type="button" class="btn btn-primary" id="trigger">파일선택</button>
	</div>
<!-- 파일 표시라인 -->
	<div class="mb-3" id="fileZone">
		
	</div>
<button type="submit" class="btn btn-secondary" id="regBtn">등 록</button>
	</form>
</div>


<script src="/resources/js/boardRegister.js"></script>

<jsp:include page="../layout/footer.jsp"></jsp:include>

