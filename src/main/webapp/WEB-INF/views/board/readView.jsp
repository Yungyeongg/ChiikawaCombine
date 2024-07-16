<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<meta charset="UTF-8">

<!-- css -->
<link rel="stylesheet" href="/resources/assets/css/board.css" />

	<head>
		<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	 	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	 	<title>게시판</title>
	 
	
	</head>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			var formObj = $("form[name='readForm']");
			
		// 목록
			$(".list_btn").on("click", function(){

			location.href = "/board/list?page=${scri.page}"
			+"&perPageNum=${scri.perPageNum}"
			+"&searchType=${scri.searchType}&keyword=${scri.keyword}";
			})
			
		// 수정 
			$(".update_btn").on("click", function(){
				formObj.attr("action", "/board/updateView");
				formObj.attr("method", "get");
				formObj.submit();				
			})
			
		// 삭제
			$(".delete_btn").on("click", function(){
				
				var deleteYN = confirm("삭제하시겠습니까?");
				if(deleteYN == true){
					
				formObj.attr("action", "/board/delete");
				formObj.attr("method", "post");
				formObj.submit();
					
				}
			})
			
		// 댓글 표시
			$(".replyWriteBtn").on("click", function(){
  				
				var formObj = $("form[name='replyForm']");
  				
				formObj.attr("action", "/board/replyWrite");
  				formObj.submit();
			});
			
		//댓글 수정 View
			$(".replyUpdateBtn").on("click", function(){
				location.href = "/board/replyUpdateView?bno=${read.bno}"
								+ "&page=${scri.page}"
								+ "&perPageNum=${scri.perPageNum}"
								+ "&searchType=${scri.searchType}"
								+ "&keyword=${scri.keyword}"
								+ "&rno="+$(this).attr("data-rno");
			});
					
		//댓글 삭제 View
			$(".replyDeleteBtn").on("click", function(){
				location.href = "/board/replyDeleteView?bno=${read.bno}"
					+ "&page=${scri.page}"
					+ "&perPageNum=${scri.perPageNum}"
					+ "&searchType=${scri.searchType}"
					+ "&keyword=${scri.keyword}"
					+ "&rno="+$(this).attr("data-rno");
			});
			
		// 취소
//			$(".list_btn").on("click", function(){
//				
//				location.href = "/board/list";
//			})
		})
	</script>
	
	<body>
	<fmt:setLocale value = '<%=request.getParameter("language")%>'/>
   <fmt:bundle basename="bundle.message"> 
	<div id="wrapper">
		<div id="root" >
			<header>
				<h1> 게시판</h1>
			</header>
			
			 
			<div>
				<%@include file="nav.jsp" %>
			</div>
			
			<br><br><br><br><br>
			<section id="container">
				<form name="readForm" role="form" method="post">
					<input type="hidden" id="bno" name="bno" value="${read.bno}" />
					<input type="hidden" id="page" name="page" value="${scri.page}"> 
  					<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
 					<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
 					<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}"> 
				</form>
				<br><br><br>
				<table class="d1"> 
					<tbody>
						<tr>
							<td>
								<label for="title"><fmt:message key="boardtitle"/></label>
								
								<input readonly class="form-control-plaintext" type="text" id="title" name="title" value="${read.title}" readonly="readonly" /><br>
								
							</td>
						</tr>	
						<tr>
							<td>
								<label for="content"><fmt:message key="checkcontenttext"/></label><textarea readonly class="form-control-plaintext" id="content" name="content" readonly="readonly"><c:out value="${read.content}" /></textarea><br>
							</td>
						</tr>
						<tr>
							<td>
							<!-- 
								<label for="writer">작성자</label><input type="text" id="writer" name="writer" value="${read.writer}"  readonly="readonly"/>
							-->
							<label for="writer"><fmt:message key="boardwriter"/></label><input readonly class="form-control-plaintext" type="text" id="writer" name="writer" value="${read.writer}"  readonly="readonly"/>
							<!-- ${mem_id} -->
							<!-- ${read.writer} --> 
							</td>
						</tr> <br>
						<tr>
							<td>
								<div id="regdateleft">
								<label for="regdate"><fmt:message key="boardregdate"/></label><br>
								<fmt:formatDate value="${read.regdate}" pattern="yyyy-MM-dd" />		<br>	
								</div>		
							</td>
						</tr>		
					</tbody>			
				</table>
				<br>
				<div id="buttonlocation">
				<c:if test="${sessionScope.mem_id != null}">
					<button type="submit"  style="background-color: #B2AADA;" class="btn btn-outline-light btn-sm update_btn"><fmt:message key="updatebutton"/></button>
					<button type="submit"  style="background-color: #B2AADA;" class="btn btn-outline-light btn-sm delete_btn"><fmt:message key="deletebutton"/></button>
				</c:if>	
					<button type="submit"  style="background-color: #B2AADA;" class="btn btn-outline-light btn-sm list_btn"><fmt:message key="boardlistbutton"/></button>	
				</div>
				
				<!-- 댓글 -->
				<div id="reply" class="d2">
  					<ol class="replyList">
    					<c:forEach items="${replyList}" var="replyList">
      						<li>
        						<p>
        						<fmt:message key="boardwriter"/> : ${replyList.writer}<br />
        						<fmt:message key="boardregdate"/> :  <fmt:formatDate value="${replyList.regdate}" pattern="yyyy-MM-dd" />
        						</p>

        					<!-- 	<p height="100px">${replyList.content}</p>  -->
        							<div style='font-size:12pt; height:auto; white-space: pre-line;' class="form-control-plaintext">${replyList.content}</div>
        							
        							
        						<div>
        						<c:if test="${sessionScope.mem_id != null}">
  									<button type="button" style="background-color: #B2AADA;" class="btn btn-outline-light btn-sm replyUpdateBtn" data-rno="${replyList.rno}"><fmt:message key="updatebutton"/></button>
  									<button type="button" style="background-color: #B2AADA;" class="btn btn-outline-light btn-sm replyDeleteBtn" data-rno="${replyList.rno}"><fmt:message key="deletebutton"/></button>
								</c:if>
								</div>
      						</li>
    					</c:forEach>   
  					</ol>
				</div>
				
				<form name="replyForm" method="post">
  				<input type="hidden" id="bno" name="bno" value="${read.bno}" />
 				<input type="hidden" id="page" name="page" value="${scri.page}"> 
  				<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
  				<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
  				<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}"> 

  				<div id = "replydiv">
    				<!-- <label for="writer">댓글 작성자</label><input type="text" id="writer" name="writer" /> -->
    				<br/>
    				<label for="content"><fmt:message key="writereply"/></label><input type="text" id="contentreplyinput" name="content" />
  				
  				
  				<button type="button" style="background-color: #B2AADA;" class="btn btn-outline-light btn-sm replyWriteBtn"><fmt:message key="writesubmit"/></button>
  					</div>
  				</div>	
					</form>
				
			</section>
 <!--  					<br><a href="?language=ko">Korean</a> | <a href="?language=jp">Japanese</a> -->
			
		</div>
		</div>
	<%@include file="../includes/footer.jsp"%>		
	</fmt:bundle>
	</body>
</html>