<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../layout/header.jsp"></jsp:include>
<jsp:include page="../layout/navbar.jsp"></jsp:include>

<div class="col-sm-12 col-md-6" style="align-content: center;">
	<form action="/board/list" method="get">
		<div class="input-group mb-3">
			<c:set value="${ph.pgvo.type}" var="typed"></c:set>
			<select class="form-select" name="type" id="inputGroupSelect" aria-label="Default select example">
			  <option ${typed eq null ? 'selected':'' }>Choose...</option>
			  <option value="twc" ${typed eq 'twc' ? 'selected' : '' }>전부</option>
			  <option value="t" ${typed eq 't' ? 'selected' : '' }>제목</option>
			  <option value="w" ${typed eq 'w' ? 'selected' : '' }>작성자</option>
			  <option value="c" ${typed eq 'c' ? 'selected' : '' }>내용</option>
			  <option value="tw" ${typed eq 'tw' ? 'selected' : '' }>제목+작성자</option>
			  <option value="tc" ${typed eq 'tc' ? 'selected' : '' }>제목+내용</option>
			  <option value="wc" ${typed eq 'wc' ? 'selected' : '' }>작성자+내용</option>
			</select>
				<input type="hidden" name="pageNo" value="1">
				<input type="hidden" name="qty" value="${ph.pgvo.qty }">
			    <input class="form-control me-2" name="keyword" value="${ph.pgvo.keyword }" type="search" placeholder="Search" aria-label="Search">
      		    <button class="btn btn-outline-success" type="submit">Search
      		    <span class="badge text-bg-info">${ph.totalCount }</span>
      		    </button>
		</div>
	</form>
</div>


<table class="table table-hover" style="margin-left: auto; margin-right: auto;">
  <thead class="table-dark">
    <tr>
      <th scope="col">#</th>
      <th scope="col">제목</th>
      <th scope="col">작성자</th>
      <th scope="col">작성일</th>
      <th scope="col">조회수</th>
      <th scope="col">첨부파일</th>
    </tr>
  </thead>
  <tbody class="table-group-divider">
	  <c:forEach items="${list }" var="bvo">
	    <tr>
	      <th scope="row">${bvo.bno }</th>
	      
	      <td><a href="/board/detail?bno=${bvo.bno }" style="text-decoration:none;color: black">${bvo.title } 
	      <c:if test="${bvo.cmtQty ne '0'}">[${bvo.cmtQty }]
	      </c:if>
	      </a></td>
	      
	      <td>${bvo.writer }</td>
	      <td>${bvo.regAt }</td>
	      <td>${bvo.readCount }</td>
	      <td>${bvo.hasFile }</td>
	      
	    </tr>
	  </c:forEach>
  </tbody>  
</table>

<!-- 페이징 라인 처리 -->

<nav aria-label="Page navigation example">
  <ul class="pagination justify-content-center">
  
<!-- 이전 페이지 -->
<c:if test="${ph.prev }">
    <li class="page-item">
      <a class="page-link" href="/board/list/?pageNo=${ph.startPage-1 }&qty=${ph.pgvo.qty}&type=${ph.pgvo.type}&keyword=${ph.pgvo.keyword}" aria-label="Prev">
      <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
</c:if>
<!-- 페이지번호 -->
<c:forEach begin="${ph.startPage }" end="${ph.endPage }" var="i"> 
    <li class="page-item"><a class="page-link" href="/board/list/?pageNo=${i}&qty=${ph.pgvo.qty}&type=${ph.pgvo.type}&keyword=${ph.pgvo.keyword}">${i }</a></li>
</c:forEach>
   
<!-- 다음 페이지 -->
<c:if test="${ph.next }">
    <li class="page-item">
      <a class="page-link" href="/board/list/?pageNo=${ph.endPage+1 }&qty=${ph.pgvo.qty}&type=${ph.pgvo.type}&keyword=${ph.pgvo.keyword}" aria-label="Next">
      <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
</c:if>

</ul>
</nav>





<jsp:include page="../layout/footer.jsp"></jsp:include>