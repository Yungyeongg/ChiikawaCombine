<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이페이지</title>
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
	background-color:white;
	text-align: center;
	padding: 10px;
}


</style>

</head>

<body>
<fmt:setLocale value = '<%=request.getParameter("language")%>'/>
   <fmt:bundle basename="bundle.message"> 
    <div class="container py-4">
        <div class="p-5 mb-4 bg-body-tertiary rounded-3">
            <div class="container-fluid py-1">
                <h1 class="display-5 fw-bold"><fmt:message key="mypagemain"/></h1>
                <p class="col-md-8 fs-4">MyPage</p>
            </div>
        </div>
        <a href="?language=ko">Korean</a> | <a href="?language=jp">Japanese</a>
        <!--회원정보 박스-->
        <div class="container" id="container">
                <div class="mb-3 row">
                    <label class="col-sm-2"><fmt:message key="yourname"/></label>
                    <div class="col-sm-3">${user.mem_name }</div>
                </div>
                <!--이름-->
                <div class="mb-3 row">
                    <label class="col-sm-2">first name</label>
                    <div class="col-sm-3">${user.mem_enfirst }</div>
                </div>
                <!--영문 성-->
                <div class="mb-3 row">
                    <label class="col-sm-2">last name</label>
                    <div class="col-sm-3">${user.mem_enlast }</div>
                </div>
                <!--영문 이름-->               
                <div class="mb-3 row">
                    <label class="col-sm-2"><fmt:message key="youremail"/></label>
                    <div class="col-sm-3">${user.mem_email }</div>
                </div>
                <!--이메일-->
                <div class="mb-3 row">
                    <label class="col-sm-2"><fmt:message key="yourphone"/></label>
                    <div class="col-sm-3">${user.mem_phone}</div>                   
                </div>
                <!--전화번호-->
                
                
                <div class="mb-3 row">
                    <label class="col-sm-2 "><fmt:message key="addressplaceholder1"/></label>
                    <div class="col-sm-3">${user.mem_post }</div>                                     
                </div>
                <div class="mb-3 row">
                    <label class="col-sm-2 "><fmt:message key="addressplaceholder2"/></label>                   
                    <div class="col-sm-3">${user.mem_addr }</div>                  
                </div>
                <div class="mb-3 row">
                    <label class="col-sm-2 "><fmt:message key="addressplaceholder3"/></label>                                   
                    <div class="col-sm-3">${user.mem_detail_addr }</div>
                </div>
                <!--주소-->
                
                
            <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                <div class="mb-3 row  me-md-2">
                    <div class="col-sm-offset-2 col-6">
                    	<form action = "/user/goChangeMember" method = "get">
                        <input type = "submit" class="btn btn-primary" value="<fmt:message key="memberupdatebutton"/> ">
                        </form>
                    </div>
                </div>
               <!--회원 수정 버튼-->
            <form action="<c:url value = '/bookCheck'/>" method="get">
                <div class="mb-3 row  me-md-2">
                    <div class="col-sm-offset-2 col-sm-10">
                        <input type="submit" class="btn btn-outline-dark" name="check" value="<fmt:message key="checkbookbutton"/>">
                    </div>
                </div>
            </form>
            </div>
            </div>
            <!-- 예약 확인 버튼 -->   
        </div>
        </fmt:bundle>
</body>

</html>