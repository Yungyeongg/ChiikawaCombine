<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원정보변경</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
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
	background-color: white;
	text-align: center;
	padding: 10px;
}
</style>     

</head>

<body> <!--북마켓 챕터 17 updateMember 참고-->
<fmt:setLocale value = '<%=request.getParameter("language")%>'/>
   <fmt:bundle basename="bundle.message"> 

    <div class="container py-4">
        <div class="p-5 mb-4 bg-body-tertiary rounded-3">
            <div class="container-fluid py-1">
                <h1 class="display-5 fw-bold"><fmt:message key="memberupdatemain"/></h1>
                <p class="col-md-8 fs-4">Membership Updating</p>
            </div>
        </div>
        <a href="?language=ko">Korean</a> | <a href="?language=jp">Japanese</a>
        <!--회원수정 박스-->
        <div class="container" id="container">
            <form name="mem_Update" action= "/user/updateUser" method="post">
                <div class="mb-3 row">
                    <label class="col-sm-2"><fmt:message key="yourname"/></label>
                    <div class="col-sm-3">
                        <input name="mem_name" type="text" class="form-control" value="${user.mem_name }">
                    </div>
                </div>
                <!--이름-->
                <div class="mb-3 row">
                    <label class="col-sm-2">first name</label>
                    <div class="col-sm-3">
                        <input name="mem_enfirst" type="text" class="form-control" value="${user.mem_enfirst }">
                    </div>
                </div>
                <!--영문 성-->
                <div class="mb-3 row">
                    <label class="col-sm-2">last name</label>
                    <div class="col-sm-3">
                        <input name="mem_enlast" type="text" class="form-control" value="${user.mem_enlast }">
                    </div>
                </div>
                <!--영문 이름-->
                <div class="mb-3 row">
                    <label class="col-sm-2"><fmt:message key="yourpw"/></label>
                    <div class="col-sm-3">
                        <input name="mem_pwd" type="password" class="form-control" value="${user.mem_pwd }">
                    </div>
                </div>
                <!--비밀번호-->              
                <div class="mb-3 row">
                    <label class="col-sm-2"><fmt:message key="youremail"/></label>
                    <div class="col-sm-3">
                        <input name="mem_email" type="email" class="form-control" value="${user.mem_email }">
                    </div>
                </div>
                <!--이메일-->
                <div class="mb-3 row">
                    <label class="col-sm-2"><fmt:message key="yourphone"/></label>
                    <div class="col-sm-3">
                        <input name="mem_phone" type="text" class="form-control" value="${user.mem_phone }">
                    </div>
                </div>
                <!--전화번호-->
              <div class="mb-3 row">
                    <label class="col-sm-2"><fmt:message key="addressplaceholder1"/></label>
                    <div class="col-sm-3">
                        <input name="mem_post" type="text" id="sample6_postcode" class="form-control" placeholder="<fmt:message key="addressplaceholder1"/>">
                        <input type="button" id="findPostcodeButton" class="btn btn-primary" value="<fmt:message key="addressbutton"/>"> 
                    </div>
                </div>
                
                <div class="mb-3 row">
                    <label class="col-sm-2"><fmt:message key="addressplaceholder2"/></label>
                    <div class="col-sm-3">
                        <input name="mem_addr" type="text" id="sample6_address" class="form-control" placeholder="<fmt:message key="addressplaceholder2"/>">
                    </div>
                </div>
                
                 <div class="mb-3 row">
                    <label class="col-sm-2"><fmt:message key="addressplaceholder3"/></label>
                    <div class="col-sm-3">
                        <input name="mem_detail_addr" type="text" id="sample6_extraAddress" class="form-control" placeholder="<fmt:message key="addressplaceholder3"/>">
                    </div>
                </div>
                <!--주소-->
                
                
                
                <!-- 
                <div class="mb-3 row">
                    <label class="col-sm-2 "><fmt:message key="youraddress"/></label>
                    <div class="col-sm-3">
                        <input name="mem_post" type="text" class="form-control" value="${user.mem_post }">
                    </div>
                    <div class="col-sm-3">
                        <input name="mem_addr" type="text" class="form-control" value="${user.mem_addr }">
                    </div>
                    <div class="col-sm-3">
                        <input name="mem_detail_addr" type="text" class="form-control" value="${user.mem_detail_addr }">
                    </div>
                </div>
                
                -->
                <!--주소-->
            <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                <div class="mb-3 row  me-md-2">
                    <div class="col-sm-offset-2 col-6">
                        <input type="submit" class="btn btn-primary" value="<fmt:message key="memberupdatesavebutton"/>">
                    </div>
                </div>
               
                <!--회원 수정 버튼-->
                <div class="mb-3 row  me-md-2">
                    <div class="col-sm-offset-2 col-sm-10">
                   			<input type="button" class="btn btn-outline-dark" onclick="mem_out()" value="<fmt:message key="memberoutbutton"/>">
                    </div>
                </div>
            </div>   
            </form>
        </div>
    </div>
    
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
    	// 카카오 지도 우편번호 찾기
        document.addEventListener("DOMContentLoaded", function() {
        function sample6_execDaumPostcode() {
            new daum.Postcode({
                oncomplete: function(data) {
                	  // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                    var addr = ''; // 주소 변수
                    var extraAddr = ''; // 참고항목 변수

                    //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                    if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                        addr = data.roadAddress;
                    } else { // 사용자가 지번 주소를 선택했을 경우(J)
                        addr = data.jibunAddress;
                    }

                    // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                    if(data.userSelectedType === 'R'){
                        // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                        // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                        if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                            extraAddr += data.bname;
                        }
                        // 건물명이 있고, 공동주택일 경우 추가한다.
                        if(data.buildingName !== '' && data.apartment === 'Y'){
                            extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                        }
                        // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                        if(extraAddr !== ''){
                            extraAddr = ' (' + extraAddr + ')';
                        }
                        // 조합된 참고항목을 해당 필드에 넣는다.
                        document.getElementById("sample6_extraAddress").value = extraAddr;
                    
                    } else {
                        document.getElementById("sample6_extraAddress").value = '';
                    }

                    document.getElementById('sample6_postcode').value = data.zonecode;
                    document.getElementById("sample6_address").value = addr;
                    // 커서를 상세주소 필드로 이동한다.
                  // 상세주소 입력란에 커서를 이동
                    var detailAddressInput = document.getElementById("sample6_detailAddress");
                    if (detailAddressInput) {
                        detailAddressInput.focus();
                    }
                }
            }).open();
        }
	     // 우편번호 찾기 버튼 클릭 이벤트
	        document.getElementById("findPostcodeButton").addEventListener("click", function() {
	            sample6_execDaumPostcode();
	        });
    });
       
    	
        function mem_out() {
   		 document.location.href = "/user/mem_out";
   	}
   	
   
    </script>
    </fmt:bundle>
</body>

</html>