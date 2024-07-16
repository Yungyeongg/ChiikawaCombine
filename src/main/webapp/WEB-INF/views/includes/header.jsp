<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport"
    content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
  <meta http-equiv="X-UA-Compatible" content="ie=edge" />
  <meta name="format-detection" content="telephone=no" />
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous" />
  <title><fmt:message key="chiikawacombine"/></title>

  <!-- css -->
  <link rel="stylesheet" href="/resources/assets/css/reset19.css" />
  <link rel="stylesheet" href="/resources/assets/css/style19.css" />
  <link rel="stylesheet" href="/resources/assets/css/swiper.css" />
  <link rel="stylesheet" href="/resources/assets/css/board.css" />
  <!--js 달력-->
  <link rel="stylesheet" href="https://code.jquery.com/ui/1.13.3/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
  <script src="https://code.jquery.com/ui/1.13.3/jquery-ui.js"></script>

  <!-- 파비콘 -->
  <link rel="shortcut icon" href="assets/icons/favicon.ico" />
  <link rel="apple-touch-icon-precomposed" href="assets/icons/favicon_72.png" />
  <link rel="apple-touch-icon-precomposed" sizes="96x96" href="assets/icons/favicon_96.png" />
  <link rel="apple-touch-icon-precomposed" sizes="144x144" href="assets/icons/favicon_144.png" />
  <link rel="apple-touch-icon-precomposed" sizes="192x192" href="assets/icons/favicon_192.png" />

  <!-- 웹 폰트 -->
  <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&amp;subset=korean"
    rel="stylesheet" />
</head>

<body>
  <header id="header1">
    <div class="container">
      <div class="row">
        <div class="header clearfix">
          <h1>
 
            <button id="gotohome">
            <!--   <em><img src="/resources/assets/img/rogo.png" alt="치이카와호텔" /></em>  -->
              <p><fmt:message key="chiikawacombine"/></p>
            </button>
           
            
          </h1>
          <nav id="mNav">
            <h2 class="ir_so">치이카와호텔 전체메뉴</h2>
            <a href="/endLogin" id="homebutton" class="ham"><span></span></a>
          </nav>
          <nav class="nav">
            <ul class="clearfix">
              <li id = "logout"><a href="#"><fmt:message key="headerlogout"/></a></li>
              <li id = "mypage"><a href="#"><fmt:message key="gotomypage"/></a></li>
              <li id="book"><a href="#"><fmt:message key="headerbook"/></a></li>
              <li id="board"><a href="#"><fmt:message key="headerboard"/></a></li>
            </ul>
          </nav>
          <br><br><br>
          <div>
		<div>
			<!-- <a href="/board/list">목록</a> -->
			<button type="button" style="background-color: #B2AADA;" class="btn btn-outline-light btn-sm" onClick="location.href='/board/list'"><fmt:message key="boardlistbutton"/></button>

			<c:if test="${sessionScope.mem_id != null}">
				<!-- <a href="/board/writeView">글 작성</a>  -->
				<button type="button" style="background-color: #B2AADA;" class="btn btn-outline-light btn-sm" onClick="location.href='/board/writeView'"><fmt:message key="writebutton"/></button>
			</c:if>
			
		</div>
	</div>
        </div>
      </div>
    </div>
  </header>
  <!-- //header -->
  
   <!-- 자바스크립트 라이브러리 -->
  <!-- <script src="assets/js/jquery.min_1.12.4.js"></script> 오래된 제이쿼리, 제이쿼리 선언이 두번 되어있어서 충돌 났음--> 
  <script src="/resources/assets/js/modernizr-custom.js"></script>
  <script src="/resources/assets/js/ie-checker.js"></script>
  <script src="/resources/assets/js/swiper.min.js"></script>
  <script src="/resources/assets/js/iframe_api.js"></script>
  <script src="/resources/assets/js/movie.js"></script>
  
  <script>
  
  
  		// 홈페이지로 가기
  		
    document.getElementById('gotohome').addEventListener('click', function() {
        
        document.location.href="/endLogin"; 
        // 또는 window.location.href = '/newPage'; // 다른 페이지로 이동하는 경우
    });

  		 
  
  		// 마이페이지로 가기
  		document.getElementById('mypage').addEventListener('click', function() {
			console.log(mypage);
			document.location.href = '<c:url value="../user/mypage"/>';
		});
  		// 예약하기 페이지로 가기
  		document.getElementById('book').addEventListener('click', function() {
  			console.log(book);
			document.location.href = '<c:url value="../book"/>';
		});
	  	// 로그아웃 하기
	  	document.getElementById('logout').addEventListener('click', function() {
	  		console.log(logout);
				document.location.href = '<c:url value="../logout"/>';
		});
	  	// 게시판 페이지로 가기(수정)-
	  	document.getElementById('board').addEventListener('click', function() {
				document.location.href = '<c:url value="../board/list"/>';
		});
	  	

</script>
  </script>
  
  