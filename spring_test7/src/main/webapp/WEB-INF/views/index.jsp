<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>

<jsp:include page="./layout/header.jsp"></jsp:include>
<jsp:include page="./layout/navbar.jsp"></jsp:include>


<body>
<h1 style="text-align: center;">
	Hello world!  
</h1>

<img src="https://i.ibb.co/3493r17/cat.jpg" style="margin-left: auto; margin-right: auto; display: block;" width="500px"/>
<P style="text-align: center;">  
The time on the server is ${serverTime}.
 </P>

</body>


<jsp:include page="./layout/footer.jsp"></jsp:include>