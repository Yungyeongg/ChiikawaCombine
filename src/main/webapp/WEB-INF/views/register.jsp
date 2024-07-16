<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
    <title>회원가입</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<style>

#a, #b {
color: rgb(4, 160, 222);
}


body {
  background-image: url(/resources/assets/img/pool.jpg);
  background-position: center;
  background-size: cover;
  min-height: 100vh;
  background-repeat: no-repeat;
  font-family: 'Roboto', sans-serif;
}

#container {

	background-color:white;
	text-align: center;
	padding: 10px;
}

</style>

</head>
<body>
<fmt:setLocale value = '<%=request.getParameter("language")%>'/>
   <fmt:bundle basename="bundle.message"> 
    <!--북마켓 챕터 17 updateMember 참고-->
    <div class="container py-4">
        <div class="p-5 mb-4 bg-body-tertiary rounded-3">
            <div class="container-fluid py-1">
                <h1 id="a" class="display-5 fw-bold"><fmt:message key="registerbutton"/></h1>
                <p id="b" class="col-md-8 fs-4">Membership register</p>
            </div>
        </div>
        <a href="?language=ko">Korean</a> | <a href="?language=jp">Japanese</a>
        <!--회원가입 박스-->
        <div id="container">
            <form id = "registerForm" action="/user/register" method="post">
                <div class="mb-3 row">
                 	<label class="col-sm-2"><fmt:message key="inputid"/></label>
                    <div class="col-sm-3">
                       <input name="mem_id" type="text" class="form-control" id ="mem_id" placeholder="id">
                    </div>
                    <label id ="label1"></label> <!-- 아이디 확인 -->
                </div>
                <!--아이디-->
                <div class="mb-3 row">
                    <label class="col-sm-2"><fmt:message key="inputpw"/></label>
                    <div class="col-sm-3">
                        <input name="mem_pwd" type="password" class="form-control" id = "inputPwd" placeholder="password">
                    </div>
                </div>
                <!--비밀번호-->
                <div class="mb-3 row">
                    <label class="col-sm-2"><fmt:message key="yourname"/></label>
                    <div class="col-sm-3">
                        <input name="mem_name" type="text" class="form-control" placeholder="name">
                    </div>
                </div>
                <!--이름-->
                <div class="mb-3 row">
                    <label class="col-sm-2">first name</label>
                    <div class="col-sm-3">
                        <input name="mem_enfirst" type="text" class="form-control" placeholder="firstName">
                    </div>
                </div>
                <!--영문 성-->
                <div class="mb-3 row">
                    <label class="col-sm-2">last name</label>
                    <div class="col-sm-3">
                        <input name="mem_enlast" type="text" class="form-control" placeholder="lastName">
                    </div>
                </div>
                <!--영문 이름-->
                <div class="mb-3 row">
                    <label class="col-sm-2"><fmt:message key="youremail"/></label>
                    <div class="col-sm-10">
                        <div class="row">
                            <div class="col-sm-4">
                                <input type="text" name="mem_email" id="email" maxlength="50" class="form-control" placeholder="example@gmail.com">
                                <!--  <input type="button" value="인증하기" class="btn btn-primary" id="emailAuth">
                                <input class="form-control" placeholder="인증 코드 6자리를 입력해주세요." maxlength="6" disabled="disabled" name="authCode" id="authCode" type="text" autofocus>
  								<span id="emailAuthWarn"></span>-->
                            </div>
                        </div>
                    </div>
                </div>
                <!--이메일-->
                <div class="mb-3 row">
                    <label class="col-sm-2"><fmt:message key="yourphone"/></label>
                    <div class="col-sm-3">
                        <input name="mem_phone" type="text" class="form-control" placeholder="phone">
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
            <div class="d-grid gap-2 d-md-flex ">
                <div class="mb-3 row  me-md-2">
                    <div class="col-sm-offset-2 col-6">
                        <input type = "submit" value = "<fmt:message key="registerbutton"/>" class="btn btn-lg btn-primary btn-block" id="registerBtn"> <!--disabled="disabled"-->
                    </div>
                </div>
            </div>
                <!--회원가입 버튼-->
            </form>
    	</div>
    </div>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type ="text/javascript">
    $(document).ready(function() {
    	//ID 중복 확인
    	//id를 입력할 수 있는 input text 영역을 벗어나면 동작한다.
    	$("#mem_id").on("focusout", function() {
    		
    		var mem_id = $("#mem_id").val();
    		
    		if(mem_id == '' || mem_id.length == 0) {
    			$("#label1").css("color", "red").text("공백은 ID로 사용할 수 없습니다.");
    			return false;
    		}
    		
        	//Ajax로 전송
        	$.ajax({
        		url : '/user/ConfirmId',
        		data : {
        			mem_id : mem_id
        		},
        		type : 'POST',
        		dataType : 'json',
        		success : function(result) {
        			if (result == true) {
        				$("#label1").css("color", "black").text("사용 가능한 ID 입니다.");
        			} else{
        				$("#label1").css("color", "red").text("사용 불가능한 ID 입니다.");
        				$("#mem_id").val('');
        			}
        		}
        	}); //End Ajax
    	});
    })
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
  /* function sample6_execDaumPostcode() {
  //  new daum.Postcode({
     //   oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

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

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample6_postcode').value = data.zonecode;
            document.getElementById("sample6_address").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("sample6_detailAddress").focus();
        }
    }).open();
}*/
    /*
    //인증하기 버튼을 눌렀을 때 동작
		$("#emailAuth").click(function() {
    	const email = $("#email").val(); //사용자가 입력한 이메일 값 얻어오기
    		
    	//Ajax로 전송
        $.ajax({
        	url : './EmailAuth',
        	data : {
        		email : email
        	},
        	type : 'POST',
        	dataType : 'json',
        	success : function(result) {
        		console.log("result : " + result);
        		$("#authCode").attr("disabled", false);
        		code = result;
        		alert("인증 코드가 입력하신 이메일로 전송 되었습니다.");
       		}
        }); //End Ajax
    });*/
    
    
    </script>
    </fmt:bundle>
</body>
</html>	