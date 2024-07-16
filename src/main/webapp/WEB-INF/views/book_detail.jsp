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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<title>예약상세</title>
<style>

	body {
  background-image: url(/resources/assets/img/pool.jpg);
  background-position: center;
  background-size: cover;
  min-height: 100vh;
  background-repeat: no-repeat;
  font-family: 'Roboto', sans-serif;
}   

#container {
	margin: 100px;
	display: grid;
	grid-template-columns: 300px 300px 300px;
	grid-gap: 50px;
	
}



input {
	border: none;
}

#name, #enname, #phone, #email {
	width: 100px;
	height: 50px;
}

#book {
	width: 300px;
	height: 50px;
	font-size: 15px;
	background-color: rgb(160, 158, 158);
	color: white;
	margin-top: 30px;
	border: none;
}

#book:hover {
	cursor: pointer;
}

.container-fluid {
	background-color:white;
	opacity: 0.9;
	margin: 0 auto;
	position: relative;
	top: 200px;
}

p, input {
	font-size:20px;
	font-weight:500;
}

#meminfo, #bookinfo {
	margin-top:80px;
}
</style>
</head>
<body>
<div class="container py-4">
	<div class="container-fluid">
        <div class="row">
            <!-- row 1 (total : 12) -->
            <div class="col-4" style="background-color: white;">
               <p> 체크인 : ${checkin }</p>
                <p>체크아웃 : ${checkout }</p>
                <p>지점 : ${branch }</p>
                <p>${roomtype }</p>
                <p>인원 : ${person }</p>
                 <img src="/resources/assets/img/suite.jpg" alt="스위트" width="400px" height= "300px">
            </div>
            <div class="col-4" id="meminfo">
               <p>예약자명 : ${user.mem_name }</p>
               <p>영문명 : ${user.mem_enfirst } ${user.mem_enlast}</p>
			   <p>예약자 연락처 : ${user.mem_phone }</p>
			   <p>예약자 이메일 : ${user.mem_email }</p>
            </div>
            <div class="col-4" id="bookinfo">
<form method="post" id="bookingForm">
 				<input type="hidden" name="mem_id" value="${mem_id}">
				<input type="hidden" name="checkin" value="${checkin}">
        		<input type="hidden" name="checkout" value="${checkout}">
        		<input type="hidden" id="person" name="person" value="${person}">				
				<input type="hidden" name="branch" value="${branch}">       		        		
        		<input type="hidden" name="roomtype" value="${roomtype}">
        		<input type="hidden" id="chargeInput" name="charge" value="${charge}">
        		
				<p><label for="card">신용카드</label> 
				<input type="radio" id="card" name="payment_op" value="카드"></p>
			    <p><label for="cash">카카오페이</label>
				<input type="radio" id="cash" name="payment_op" value="카카오페이"></p>
				<p><label for="bank">무통장입금</label> 
				<input type="radio" id="bank" name="payment_op" value="무통장입금"></p> <br>
				<p> <input type="checkbox" id="breakfast" name="breakfast" value="o">조식추가(1인+5만원) </p>
				<p>최종금액 :<span id="chargeDisplay">${charge}</span>원</p>
			<!-- 	<button type="submit" id="book">예약하기</button>  -->
				<input type="button" id="book" value="예약하기"/>
</form>
            </div>
        </div>
</div>
 </div>
 
 <script type="text/javascript">
 
 
 		document.getElementById('book').addEventListener('click', function(){
		let charge = document.getElementById('chargeInput').value;
		document.getElementById('chargeInput').value = charge.replace(',','');
		let bookingForm = document.getElementById('bookingForm');
		bookingForm.action = '<c:url value="/checkBook"/>';
		bookingForm.submit();
	});
 		
 		
 
	// 조식 추가하면 가격 오르기
	// 요소와 값을 분리해야 함 / 변수와 DOM 요소	
		let chargeInputElement = document.getElementById("chargeInput");	// 폼에 있는 가격 요소
		let chargeDisplayElement = document.getElementById("chargeDisplay"); // 화면에 보이는 가격 요소
		let chargeInput = chargeInputElement.value;  // 폼에 있는 가격의 value를 가져옴
		let num = parseInt(chargeInput.replace(/,/g, ''), 10); // 쉼표 제거 후 숫자로 변환
		let charge = num;	// 숫자로 변환한 값을 charge에 대입
		 let breakfast = document.getElementById("breakfast"); // 조식을 선택하면 값이 오를 것
		 let person = parseInt(document.getElementById("person").value, 10); // 인원수
		 breakfast.addEventListener("change", function() {
			 if(breakfast.checked) { // breakfast를 누르면 change이벤트가 발생
				 charge += (50000 * person); // 1인 조식 가격5만원 -> 5만원*인원수 -> charge에 더함 
			 } else {
				 charge -= (50000 * person); // 체크를 해지 하면 원래 가격으로 내려감
			 }
			 chargeInputElement.value = charge;	// 폼에 있는 가격을 업데이트
			 chargeDisplayElement.textContent = charge.toLocaleString(); // 화면에 보이는 가격 업데이트, toLocaleString은 천 단위로 ,찍음
		 });
 </script>
</body>
</html>