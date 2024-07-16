<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원예약확인</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<style>

body {
  background-image: url(/resources/assets/img/pool.jpg);
  background-position: center;
  background-size: cover;
  min-height: 100vh;
  background-repeat: no-repeat;
  font-family: 'Roboto', sans-serif;
}

#containerfluid{
	opacity:0.9;
}

#box {
	text-align: center;
}

/*table,*/ th, tr, td {
	border: 1px solid black;
	border-collapse: collapse;
	border-color: rgb(176, 179, 180);
	width: 300px; /*테이블 넓이 table에는 적용 안됨*/
}

td:nth-child(odd) {
	background-color: rgb(235, 231, 231);
}

td:nth-child(even) {
	background-color: white;
}

table, #btn {
	display: inline-block;
}

#flexbox {
	display: flex;
  	justify-content: space-evenly;
  	
  	
  	
}
</style>
</head>

<body>

	<div id="containerfluid" class="container py-4">
		<div class="p-5 mb-4 bg-body-tertiary rounded-3">
			<div  class="container-fluid py-1">
				<h1 class="display-5 fw-bold">회원 예약 확인</h1>
				<p class="col-md-8 fs-4">Membership Booking Check</p>
			</div>
		</div>
	<!-- <div id="box">
			<section id="container">
					<table>
						<tr><th>예약번호</th><th>예약자명</th><th>체크인</th><th>체크아웃</th><th>예약일</th></tr>
						
						<c:forEach items="${bookList}" var = "bookList">
							<tr>
								<td>
									<a href="/readView?book_no=${bookList.book_no }">
									<c:out value="${bookList.book_no}" />
									</a>
								</td>
								<td><c:out value="${user.mem_name}" /></td>
								<td><c:out value="${bookList.checkin}" /></td>
								<td><c:out value="${bookList.checkout}" /></td>
								<td><c:out value="${bookList.book_date}" /></td>
							</tr>
						</c:forEach>
						
					</table>
					
						
			</section>

		</div>  -->

	<div id="flexbox">
		<c:choose>
			<c:when test="${empty bookList }">
				<div style="background-color: white;">
				예약 정보가 없습니다.
				</div>
						  	
		  	</c:when>
		  	<c:otherwise>
				<c:forEach items="${bookList}" var = "bookList">
					<div class="card" style="width: 18rem;">
						<div class="card-body">
							
	  						<h5 class="card-title">
	  							<c:if test="${ 'o' == book_cancel }">
				  					[취소]<c:out value="${bookList.book_no}" />
		  						</c:if>
	  							<c:if test="${ 'o' != bookList.book_cancel }">
			  						<a href="/readView?book_no=${bookList.book_no }" class="card-link">
				  						<c:out value="${bookList.book_no}" />
			  						</a>
		  						</c:if>
	  						</h5><br>	    
	  						<p class="card-text">치이카와combine <c:out value="${bookList.branch}" /></p>
					    	<p class="card-text">예약자명 : <c:out value="${user.mem_name}" /></p>
					    	<p class="card-text">체크인 : <c:out value="${bookList.checkin}" /></p>
					    	<p class="card-text">체크아웃 : <c:out value="${bookList.checkout}" /></p>
					    	<p class="card-text">예약일 : <c:out value="${bookList.book_date}" /></p>
						    
						</div>
					</div>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</div>
</body>

</html>