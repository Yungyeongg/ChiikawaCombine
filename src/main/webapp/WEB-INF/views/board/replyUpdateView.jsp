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
				location.href = "/board/readView?bno=${replyUpdate.bno}"
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
				<h1></h1>
			</header>
		<!-- 	<hr />  -->
			 
			<div>
				<%@include file="nav.jsp" %>
			</div>
			
			
			<div><br><br><br><br>
			<h1 class="display-5 fw-bold"></h1>
			</div><br><br><br><br><br><br><br><br>
		
			<section id="container">
				<form name="updateForm" role="form" method="post" action="/board/replyUpdate">
					<input type="hidden" name="bno" value="${replyUpdate.bno}" readonly="readonly"/>
					<input type="hidden" id="rno" name="rno" value="${replyUpdate.rno}" />
					<input type="hidden" id="page" name="page" value="${scri.page}"> 
					<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
					<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
					<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}"> 
					<table>
						<tbody>
							<tr>
								<td>
									<div id="replycontent" style=" margin-left:480px;">
									<label for="content">댓글 내용</label><textarea style="white-space: pre-wrap; width: 600px; height:300px;" class="chk" class="form-control-plaintext" id="content" name="content" value="${replyUpdate.content}"/>  </textarea>
									</div>
									
								</td>
							</tr>	
							
						</tbody>			
					</table>
					<div id="buttonlocation">
						<button type="submit" style="background-color: #B2AADA;" class="btn btn-outline-light btn-sm update_btn">저장</button>
						<button type="button" style="background-color: #B2AADA;" class="btn btn-outline-light btn-sm cancel_btn">취소</button>
					</div>
				</form>
			</section>
			
		</div>
		</div>
	<%@include file="../includes/footer.jsp"%>		
	</fmt:bundle>
	</body>
</html>