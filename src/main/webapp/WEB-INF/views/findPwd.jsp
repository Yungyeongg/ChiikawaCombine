<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>로그인폼</title>
   
    <style>
    
    body {
  background-image: url(/resources/assets/img/pool.jpg);
  background-position: center;
  background-size: cover;
  min-height: 100vh;
  background-repeat: no-repeat;
  font-family: 'Roboto', sans-serif;
}
    
                    .box {
  position: relative;
  top: 0;
  opacity: 1;
  float: left;
  padding: 60px 50px 40px 50px;
  width: 100%;
  background: #fff;
  border-radius: 10px;
  transform: scale(1);
  -webkit-transform: scale(1);
  -ms-transform: scale(1);
  z-index: 5;

  &.back {
    transform: scale(0.95);
    -webkit-transform: scale(0.95);
    -ms-transform: scale(0.95);
    top: -20px;
    opacity: .8;
    z-index: -1;
  }

  &:before {
    content: "";
    width: 100%;
    height: 30px;
    border-radius: 10px;
    position: absolute;
    top: -10px;
    background: rgba(255, 255, 255, 0.6);
    left: 0;
    transform: scale(0.95);
    -webkit-transform: scale(0.95);
    -ms-transform: scale(0.95);
    z-index: -1;
  }
}

.overbox .title {
  color: #fff;

  &:before {
    background: #fff;
  }
}

.title {
  width: 100%;
  float: left;
  line-height: 46px;
  font-size: 34px;
  font-weight: 700;
  letter-spacing: 2px;
  color: rgb(4, 160, 222);
  position: relative;

  &:before {
    content: "";
    width: 5px;
    height: 100%;
    position: absolute;
    top: 0;
    left: -50px;
    background: #ED2553;
  }
}

.input {
  transition: 300ms cubic-bezier(0.4, 0, 0.2, 1);
  -webkit-transition: 300ms cubic-bezier(0.4, 0, 0.2, 1);
  -ms-transition: 300ms cubic-bezier(0.4, 0, 0.2, 1);

  label, input, .spin {
    transition: 300ms cubic-bezier(0.4, 0, 0.2, 1);
    -webkit-transition: 300ms cubic-bezier(0.4, 0, 0.2, 1);
    -ms-transition: 300ms cubic-bezier(0.4, 0, 0.2, 1);
  }
}

.button {
  transition: 300ms cubic-bezier(0.4, 0, 0.2, 1);
  -webkit-transition: 300ms cubic-bezier(0.4, 0, 0.2, 1);
  -ms-transition: 300ms cubic-bezier(0.4, 0, 0.2, 1);

  button .button.login button i.fa {
    transition: 300ms cubic-bezier(0.4, 0, 0.2, 1);
    -webkit-transition: 300ms cubic-bezier(0.4, 0, 0.2, 1);
    -ms-transition: 300ms cubic-bezier(0.4, 0, 0.2, 1);
  }
}

.material-button .shape {
  &:before, &:after {
    transition: 300ms cubic-bezier(0.4, 0, 0.2, 1);
    -webkit-transition: 300ms cubic-bezier(0.4, 0, 0.2, 1);
    -ms-transition: 300ms cubic-bezier(0.4, 0, 0.2, 1);
  }
}

.button.login button {
  transition: 300ms cubic-bezier(0.4, 0, 0.2, 1);
  -webkit-transition: 300ms cubic-bezier(0.4, 0, 0.2, 1);
  -ms-transition: 300ms cubic-bezier(0.4, 0, 0.2, 1);
}

.material-button, .alt-2, .material-button .shape, .alt-2 .shape, .box {
  transition: 400ms cubic-bezier(0.4, 0, 0.2, 1);
  -webkit-transition: 400ms cubic-bezier(0.4, 0, 0.2, 1);
  -ms-transition: 400ms cubic-bezier(0.4, 0, 0.2, 1);
}

.input {
  width: 100%;
  float: left;

  label, input, .spin {
    width: 100%;
    float: left;
  }
}

.button {
  width: 100%;
  float: left;

  button {
    width: 100%;
    float: left;
  }
}

.input, .button {
  margin-top: 30px;
  height: 70px;
}

.input {
  position: relative;

  input {
    position: relative;
  }
}

.button {
  position: relative;

  button {
    position: relative;
  }
}

.input {
  input {
    height: 60px;
    top: 10px;
    border: none;
    background: transparent;
    font-family: 'Roboto', sans-serif;
    font-size: 24px;
    color: rgba(0, 0, 0, 0.8);
    font-weight: 300;
  }

  label {
    font-family: 'Roboto', sans-serif;
    font-size: 24px;
    color: rgba(0, 0, 0, 0.8);
    font-weight: 300;
  }
}

.button button {
  font-family: 'Roboto', sans-serif;
  font-size: 24px;
  color: rgba(0, 0, 0, 0.8);
  font-weight: 300;
}

.input {
  &:before, .spin {
    width: 100%;
    height: 1px;
    position: absolute;
    bottom: 0;
    left: 0;
  }

  &:before {
    content: "";
    background: rgba(0, 0, 0, 0.1);
    z-index: 3;
  }

  .spin {
    background: #ED2553;
    z-index: 4;
    width: 0;
  }
}

.overbox .input {
  .spin {
    background: rgba(255, 255, 255, 1);
  }

  &:before {
    background: rgba(255, 255, 255, 0.5);
  }
}

.input label {
  position: absolute;
  top: 10px;
  left: 0;
  z-index: 2;
  cursor: pointer;
  line-height: 60px;
}

.button {
  &.login {
    width: 60%;
    left: 20%;

    button {
      width: 100%;
      line-height: 64px;
      left: 0%;
      background-color: transparent;
      border: 3px solid rgba(0, 0, 0, 0.1);
      font-weight: 900;
      font-size: 18px;
      color: rgba(0, 0, 0, 0.2);
    }
  }

  button {
    width: 100%;
    line-height: 64px;
    left: 0%;
    background-color: transparent;
    border: 3px solid rgba(0, 0, 0, 0.1);
    font-weight: 900;
    font-size: 18px;
    color: rgba(0, 0, 0, 0.2);
  }

  &.login {
    margin-top: 30px;
  }

  margin-top: 20px;

  button {
    background-color: #fff;
    color: #ED2553;
    border: none;
  }

  &.login button {
    &.active {
      border: 3px solid transparent;
      color: #fff !important;

      span {
        opacity: 0;
        transform: scale(0);
        -webkit-transform: scale(0);
        -ms-transform: scale(0);
      }

      i.fa {
        opacity: 1;
        transform: scale(1) rotate(-0deg);
        -webkit-transform: scale(1) rotate(-0deg);
        -ms-transform: scale(1) rotate(-0deg);
      }
    }

    i.fa {
      width: 100%;
      height: 100%;
      position: absolute;
      top: 0;
      left: 0;
      line-height: 60px;
      transform: scale(0) rotate(-45deg);
      -webkit-transform: scale(0) rotate(-45deg);
      -ms-transform: scale(0) rotate(-45deg);
    }

    &:hover {
      color: #ED2553;
      border-color: #ED2553;
    }
  }

  margin: 40px 0;
  overflow: hidden;
  z-index: 2;

  button {
    cursor: pointer;
    position: relative;
    z-index: 2;
  }
}

.pass-forgot {
  width: 100%;
  float: left;
  text-align: center;
  color: rgba(0, 0, 0, 0.4);
  font-size: 18px;
  cursor: pointer;
}

.click-efect {
  position: absolute;
  top: 0;
  left: 0;
  background: #ED2553;
  border-radius: 50%;
}

.overbox {
  width: 100%;
  height: 100%;
  position: absolute;
  top: 0;
  left: 0;
  overflow: inherit;
  border-radius: 10px;
  padding: 60px 50px 40px 50px;

  .title, .button, .input {
    z-index: 111;
    position: relative;
    color: #fff !important;
    display: none;
  }

  .title {
    width: 80%;
  }

  .input {
    margin-top: 20px;

    input, label {
      color: #fff;
    }
  }

  .material-button, .alt-2 {
    display: block;

    .shape {
      display: block;
    }
  }
}

.material-button, .alt-2 {
  width: 140px;
  height: 140px;
  border-radius: 50%;
  background: #ED2553;
  position: absolute;
  top: 40px;
  right: -70px;
  cursor: pointer;
  z-index: 100;
  transform: translate(0%, 0%);
  -webkit-transform: translate(0%, 0%);
  -ms-transform: translate(0%, 0%);
}

.material-button .shape, .alt-2 .shape {
  position: absolute;
  top: 0;
  right: 0;
  width: 100%;
  height: 100%;
}

.material-button .shape:before, .alt-2 .shape:before, .material-button .shape:after, .alt-2 .shape:after {
  content: "";
  background: #fff;
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%) rotate(360deg);
  -webkit-transform: translate(-50%, -50%) rotate(360deg);
  -ms-transform: translate(-50%, -50%) rotate(360deg);
}

.material-button .shape:before, .alt-2 .shape:before {
  width: 25px;
  height: 4px;
}

.material-button .shape:after, .alt-2 .shape:after {
  height: 25px;
  width: 4px;
}

.material-button.active, .alt-2.active {
  top: 50%;
  right: 50%;
  transform: translate(50%, -50%) rotate(0deg);
  -webkit-transform: translate(50%, -50%) rotate(0deg);
  -ms-transform: translate(50%, -50%) rotate(0deg);
}



html {
  overflow: hidden;
}

.materialContainer {
  width: 100%;
  max-width: 460px;
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  -webkit-transform: translate(-50%, -50%);
  -ms-transform: translate(-50%, -50%);
}

* {
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
  margin: 0;
  padding: 0;
  text-decoration: none;
  list-style-type: none;
  outline: none;

  &:after, &::before {
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
    margin: 0;
    padding: 0;
    text-decoration: none;
    list-style-type: none;
    outline: none;
  }
}

    </style>
  </head>
  <body> 
  <fmt:setLocale value = '<%=request.getParameter("language")%>'/>
   <fmt:bundle basename="bundle.message">
   <div class="materialContainer">
        <div class="box">
     
           <div class="title"><fmt:message key="findpwbutton"/></div>
        <form action ="/user/findPwd" method = "post">
        <div class="input">
              <label for="id"></label>
              <input type="text" name="mem_id" placeholder="<fmt:message key="inputid"/>">
              <span class="spin"></span>
           </div>
           
           <div class="input">
              <label for="name"></label>
              <input type="text" name="mem_name" placeholder="<fmt:message key="yourname"/>">
              <span class="spin"></span>
           </div>
     
           <div class="input">
              <label for="email"></label>
              <input type="text" name="mem_email" placeholder="<fmt:message key="youremail"/>">
              <span class="spin"></span>
           </div>
           <a href="?language=ko">Korean</a> | <a href="?language=jp">Japanese</a>
     
           <div class="button login">
              <button type="submit"><span><fmt:message key="findpwbutton"/></span> <i class="fa fa-check"></i></button>
           </div>
        </form>
     
           <p class="pass-forgot"><span id="register"><fmt:message key="registerbutton"/></span> | <span id="login"><fmt:message key="loginbutton"/></span></p>
     
        </div>
     </div>
    
    <script>
	 // 회원가입 으로 가기
		document.getElementById('register').addEventListener('click', function() {
		document.location.href = '<c:url value="/user/register"/>';
	});
	 // 로그인 폼으로 가기
		document.getElementById('login').addEventListener('click', function() {
		document.location.href = '<c:url value="/doLogin"/>';
	});
    </script>
    </fmt:bundle>
  </body>
</html>
