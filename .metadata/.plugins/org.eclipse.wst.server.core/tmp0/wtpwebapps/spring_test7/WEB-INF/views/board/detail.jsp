<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<jsp:include page="../layout/header.jsp"></jsp:include>
<jsp:include page="../layout/navbar.jsp"></jsp:include>


<div class="container-md">
<c:set value="${bdto.bvo }" var="bvo"></c:set>
	<div class="mb-3">
	  <label for="Bno" class="form-label">번호</label>
	  <input type="text" name="Bno" class="form-control" id="Bno" value="${bvo.bno }" readonly="readonly">
	</div>
	
	<div class="mb-3">
	  <label for="title" class="form-label">제목</label>
	  <input type="text" name="title" class="form-control" id="title" value="${bvo.title }" readonly="readonly">
	</div>
	
	<div class="mb-3">
	  <label for="writer" class="form-label">작성자</label>
	  <input type="text" name="writer" class="form-control" id="writer" value="${bvo.writer }" readonly="readonly">
	</div>
	
	<div class="mb-3">
	  <label for="reg_date" class="form-label">작성일</label>
	  <span class="badge text-bg-primary">${bvo.readCount }</span>
	  <input type="text" name="reg_date" class="form-control" id="reg_date" value="${bvo.regAt  }" readonly="readonly">
	</div>
	
	<div class="mb-3">
	  <label for="content" class="form-label">내용</label>
	  <textarea name="content" class="form-control" id="content" rows="3" readonly="readonly">${bvo.content }</textarea>
	</div>
	
	<!-- file line -->
<c:set value="${bdto.flist }" var="flist"></c:set>
	<div class="mb-3">
	<label for="f" class="form-label">File</label>
	<ul class="list-group list-group-flush">
		<c:forEach items="${flist }" var="fvo">
    		<li class="list-group-item">
    			<c:choose>
    				<c:when test="${fvo.fileType == 1 }">
    					<div>
    						<img alt="" src="/upload/${fvo.saveDir }/${fvo.uuid}_th_${fvo.fileName}">
    					</div>
    				</c:when>
    				<c:otherwise>
    					<div>
    						<!-- 일반 파일 표시할 아이콘 -->
    						<a href="/upload/${fvo.saveDir }/${fvo.uuid}_${fvo.fileName}" download="${fvo.fileName }">
    						<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-file-earmark-break" viewBox="0 0 16 16">
 							<path d="M14 4.5V9h-1V4.5h-2A1.5 1.5 0 0 1 9.5 3V1H4a1 1 0 0 0-1 1v7H2V2a2 2 0 0 1 2-2h5.5L14 4.5zM13 12h1v2a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2v-2h1v2a1 1 0 0 0 1 1h8a1 1 0 0 0 1-1v-2zM.5 10a.5.5 0 0 0 0 1h15a.5.5 0 0 0 0-1H.5z"/>
							</svg>
							</a>
    					</div>
    				</c:otherwise>	
    			</c:choose>
    			<div class="ms-2 me-auto">
    				<div class="fw-bold">${fvo.fileName }</div>
    				<span class="badge rounded-pill text-bg-secondary">${fvo.fileSize }Byte</span>
    			</div>
    		</li>
    	</c:forEach>
	</ul>
    
	</div>
	
	
<a href="/board/modify?bno=${bvo.bno }"><button type="button" class="btn btn-success"> 수정 </button></a>
<a href="/board/delete?bno=${bvo.bno }"><button type="button" class="btn btn-danger"> 삭제 </button></a>
<br>
<br>
<div>
<a href="/board/list"><button type="button" class="btn btn-primary"> 리스트 </button></a>
</div>
<hr>
<br>

<!-- 댓글라인 -->
	<div class="input-group mb-3">
		<span class="input-group-text" id="cmtWriter">${bvo.writer }</span>
		<input type="text" class="form-control" id="cmtText" aria-label="Amount (to the nearest dollar)">
		<button type="button" class="btn btn-success" id="cmtPostBtn">Post</button>
	</div>

<!-- 댓글 표시 라인 -->
<ul class="list-group list-group-flush" id="cmtListArea">
	<li class="list-group-item">
		<div class="mb-3">
			<div class="fw-bold">Writer	</div>
			content
		</div>
			<span class="badge rounded-pill text-bg-warning">modAt</span>
		</li>
	</ul>
</div>
	
	<div>
		<button type="button" id="moreBtn" data-page="1" class="btn btn-dark" style="visibility:hidden">More +</button>
	</div>

<!-- 모달 창 -->
<div class="modal" id="myModal" tabindex="-1">
  <div class="modal-dialog">
    <div class="modal-content">
		<div class="modal-header">
        	<h5 class="modal-title">Writer</h5>
        	<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		</div>
      <div class="modal-body">
      	 <div class="input-group mb-3">
         	<input type="text" class="form-control" id="cmtTextMod" >
        		<button type="button" class="btn btn-primary" id="cmtModBtn">Post</button>
      		</div>
      			<div class="modal-footer">
        			<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
      			</div>
   			</div>
		</div>
	</div>
</div>




<script type="text/javascript">
let bnoVal = `<c:out value="${bdto.bvo.bno}" />`;
console.log(bnoVal);
</script>

<script src="/resources/js/boardComment.js"></script>

<script type="text/javascript">
spreadCommentList(bnoVal);
</script>

<jsp:include page="../layout/footer.jsp"></jsp:include>