<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<meta charset="UTF-8">
<!-- css -->
<link rel="stylesheet" href="/resources/assets/css/board.css" />

	<head>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
		<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	 	<title>게시판</title>
	</head>
	<script type="text/javascript">
		$(document).ready(function(){
			var formObj = $("form[name='updateForm']");
			
			$(".cancel_btn").on("click", function(){
				location.href = "/board/readView?bno=${replyDelete.bno}"
					   + "&page=${scri.page}"
					   + "&perPageNum=${scri.perPageNum}"
					   + "&searchType=${scri.searchType}"
					   + "&keyword=${scri.keyword}";
			})
			
		})
		
	</script>
	<body>
	<fmt:setLocale value = '<%=request.getParameter("language")%>'/>
   <fmt:bundle basename="bundle.message"> 
	<div id="wrapper">
		<div id="root">
			<header>
				<h1> 게시판</h1>
			</header>
			
			 
			<div>
				<%@include file="nav.jsp" %>
			</div>
			
			
			<div><br><br>
			<h1 class="display-5 fw-bold"></h1>
			</div><br><br><br><br><br><br><br><br>
			
			<section id="container">
				<form name="updateForm" role="form" method="post" action="/board/replyDelete">
					<input type="hidden" name="bno" value="${replyDelete.bno}" readonly="readonly"/>
					<input type="hidden" id="rno" name="rno" value="${replyDelete.rno}" />
					<input type="hidden" id="page" name="page" value="${scri.page}"> 
					<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
					<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
					<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}"> 
					
					<div id="replydeletelocation">	
					<div id="buttonlocation">
						
						<span style="color: white; background-color: #B2AADA;"><p class="fs-4">댓글을 삭제하시겠습니까?</p></span>
						
						<button type="submit" style="background-color: #B2AADA;" class="btn btn-outline-light btn-sm delete_btn">예 삭제합니다.</button>
						<button type="button" style="background-color: #B2AADA;" class="btn btn-outline-light btn-sm cancel_btn">아니오. 삭제하지 않습니다.</button>
					</div>
					</div>
				</form>
			</section>
			
		</div>
		</div>
	<%@include file="../includes/footer.jsp"%>	
	</fmt:bundle>	
	</body>
</html>