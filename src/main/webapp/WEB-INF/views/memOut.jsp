<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원탈퇴</title>
<style>
div {
	position: relative;
	text-align: center;
	top: 100px;
	font-size: 50px;
}
</style>
</head>
<body>
<fmt:setLocale value = '<%=request.getParameter("language")%>'/>
   <fmt:bundle basename="bundle.message">
   <!-- 
	<a href="?language=ko">Korean</a> | <a href="?language=jp">Japanese</a>
	-->
	<div>
		<p><fmt:message key="memoutmain"/></p>
		<div class="d-grid gap-2 col-4 mx-auto">
			<button class="btn btn-primary" type="button" onClick="location.href='/home.jsp'"><fmt:message key="gotomainbutton"/></button>
		</div>
	</div>
	</fmt:bundle>
</body>
</html>