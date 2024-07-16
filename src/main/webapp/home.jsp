<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- page session false 잠시 삭제함, 오류 있으면 다시 넣을 것 -->
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
  <title>치이카와COMBINE</title>

  <!-- css -->
  <link rel="stylesheet" href="/resources/assets/css/reset19.css" />
  <link rel="stylesheet" href="/resources/assets/css/style19.css" />
  <link rel="stylesheet" href="/resources/assets/css/swiper.css" />
  <!--js 달력-->
  <link rel="stylesheet" href="https://code.jquery.com/ui/1.13.3/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
  <script src="https://code.jquery.com/ui/1.13.3/jquery-ui.js"></script>

  <!-- 웹 폰트 -->
  <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&amp;subset=korean"
    rel="stylesheet" />
</head>

<body>
  <header id="header">
    <div class="container">
      <div class="row">
        <div class="header clearfix">
          <h1>
            <a href="#">
              <em><img src="/resources/assets/img/rogo.png" alt="치이카와호텔" /></em>
              <p>치이카와COMBINE</p>
            </a>
          </h1>
          <nav id="mNav">
            <h2 class="ir_so">치이카와COMBINE 전체메뉴</h2>
            <a href="#" class="ham"><span></span></a>
          </nav>
          <nav class="nav">
            <ul class="clearfix">
              <li id = "login"><a href="#">로그인</a></li>
              <li id = enroll><a href="#">회원가입</a></li>
              <li id="book"><a href="#">예약하기</a></li>
              <li id="board"><a href="#">문의하기</a></li>
            </ul>
          </nav>
        </div>
      </div>
    </div>
  </header>
  <!-- //header -->

  <section id="banner">
    <div class="slider">
      <div class="swiper-container">
        <div class="swiper-wrapper">
          <div class="swiper-slide ss1">
            <div class="container">
              <div class="row">
                <h3>ちいかわ in Seoul</h3>
                <p>도심 속, 당신의 하루에 휴식을</p>
              </div>
            </div>
          </div>
          <div class="swiper-slide ss2">
            <div class="container">
              <div class="row">
                <h3>ちいかわ in Busan</h3>
                <p>바다 위, 피로를 흘려보내다</p>
              </div>
            </div>
          </div>
          <div class="swiper-slide ss3">
            <div class="container">
              <div class="row">
                <h3>Healing with ちいかわ</h3>
                <p>치이카와 호텔에서 치유를</p>
              </div>
            </div>
          </div>
        </div>
        <div class="swiper-pagination"></div>
        <div class="swiper-button-prev"></div>
        <div class="swiper-button-next"></div>
      </div>
    </div>
  </section>
  <!-- //banner -->

  <section id="reservation">
    <div class="container">
      <div class="row">
        <h2 class="ir_so"></h2>
        <div class="movie">
          <div class="movie_title">
            <form action="#" method="get">
              <ul class="clearfix">
                <li class="active">
                  <a>
                    지점 선택 <br>
                    <select name="branch" id="branch">
                      <option value="s">서울지점</option>
                      <option value="b">부산지점</option>
                    </select>
                  </a>
                </li>
                <li>
                  <a>
                    체크인 <input type="text" id="from" name="checkin" value="">
                  </a>
                </li>
                <li>
                  <a>
                    체크아웃 <input type="text" id="to" name="checkout" value="">
                  </a>
                </li>
                <li>
                  <a>
                    인원 <br><input type="number" min="1" max="3" id="usernumber" name="usernumber" value="1">
                  </a>
                </li>
              </ul>
              <input id="button" type="submit" value="예약하기" />
            </form>
          </div>
        </div>
      </div>
    </div>
    </div>
  </section>
  <!-- //reservation -->


   <footer id="footer">
    <div id="footer_sns">
      <div class="container">
        <div class="footer_sns">
          <ul>
            <li class="icon s1">
              <a href="#"><span class="ir_pm">트위터</span></a>
            </li>
            <li class="icon s2">
              <a href="#"><span class="ir_pm">페이스북</span></a>
            </li>
            <li class="icon s3">
              <a href="#"><span class="ir_pm">인스타그램</span></a>
            </li>
            <li class="icon s4">
              <a href="#"><span class="ir_pm">구글 플레이</span></a>
            </li>
            <li class="icon s5">
              <a href="#"><span class="ir_pm">아이폰 앱스토어</span></a>
            </li>
          </ul>
          <div class="tel">
            <a href="#">ARS <em>1544-0070</em></a>
          </div>
        </div>
      </div>
    </div>
    <div id="footer_infor">
      <div class="container">
        <div class="row">
          <div class="footer_infor">
            <h2><img src="/resources/assets/img/rogo.png" alt="치이카와호텔" /></h2>
            <ul>
              <li><a href="#">회사소개</a></li>
              <li><a href="#">채용정보</a></li>
              <li><a href="#">제휴/광고/부대사업 문의</a></li>
              <li><a href="#">이용약관</a></li>
              <li><a href="#">개인정보처리방침</a></li>
              <li><a href="#">고객센터</a></li>
              <li><a href="#">윤리경영</a></li>
            </ul>
            <address>
              <p>
                서울특별시 영등포구 영중로 56, 신한빌딩<br /><span class="bar2">대표자명 치이카와</span>
                개인정보보호 책임자 경영지원실 실장 하치와레<br /><span class="bar2">사업자등록번호 111-222-333</span>
                통신판매업신고번호 제 111호
              </p>
              <p>Copyright 2024 by chiikawahotel. All right reserved</p>
            </address>
          </div>
        </div>
      </div>
    </div>
  </footer> 
  <!-- //footer -->
        
  <!-- 자바스크립트 라이브러리 -->
  <!-- <script src="assets/js/jquery.min_1.12.4.js"></script> 오래된 제이쿼리, 제이쿼리 선언이 두번 되어있어서 충돌 났음--> 
  <script src="/resources/assets/js/modernizr-custom.js"></script>
  <script src="/resources/assets/js/ie-checker.js"></script>
  <script src="/resources/assets/js/swiper.min.js"></script>
  <script src="/resources/assets/js/iframe_api.js"></script>
  <script src="/resources/assets/js/movie.js"></script>
  
  <script>
  		// 회원가입으로 가기
  		document.getElementById('enroll').addEventListener('click', function() {
			document.location.href = '<c:url value="/user/register"/>';
		});

  		// 로그인 폼으로 가기
  		document.getElementById('login').addEventListener('click', function() {
			document.location.href = '<c:url value="doLogin"/>';
		});
  		
  		// 예약으로 가기
  	    document.getElementById('book').addEventListener('click', function () {
  	    	document.location.href = '<c:url value="/book"/>';
  	    });

  	    // 게시판으로 가기
  	    document.getElementById('board').addEventListener('click', function () {
  	      alert('로그인 후 이용가능합니다.');
  	    });
  		
     //달력
     var rangeDate = 31; // set limit day
    var setSdate, setEdate;
    $("#from").datepicker({
      dateFormat: 'yy-mm-dd',
      minDate: 0,
      onSelect: function (selectDate) {
        var stxt = selectDate.split("-");
        stxt[1] = stxt[1] - 1;
        var sdate = new Date(stxt[0], stxt[1], stxt[2]);
        var edate = new Date(stxt[0], stxt[1], stxt[2]);
        edate.setDate(sdate.getDate() + rangeDate);
        $('#to').datepicker('option', {
          minDate: selectDate,
          beforeShow: function () {
            $("#to").datepicker("option", "maxDate", edate);
            setSdate = selectDate;
            console.log(setSdate)
          }
        });
        //to 설정
      }
      //from 선택되었을 때
    });
    $("#to").datepicker({
      dateFormat: 'yy-mm-dd',
      onSelect: function (selectDate) {
        setEdate = selectDate;
        console.log(setEdate)
      }
    });

    //배너 이미지 슬라이드
    var swiper = new Swiper('.swiper-container', {
      pagination: {
        el: '.swiper-pagination',
      },
      navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
      },
      autoplay: {
        delay: 5000,
      },
    });  
  </script>
</body>

</html>