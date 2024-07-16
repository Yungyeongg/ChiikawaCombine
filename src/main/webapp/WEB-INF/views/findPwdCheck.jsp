<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>비밀번호발급</title>
   
    <style>
    
    
    body {
  background-image: url(/resources/assets/img/pool.jpg);
  background-position: center;
  background-size: cover;
  min-height: 100vh;
  background-repeat: no-repeat;
  font-family: 'Roboto', sans-serif;
}




      .findPwdForm {
        display: inline-block;
        position: static;
        text-align: center;
        background-color: white;
        border: 1px solid rgba(223, 220, 220, 0.8);
        border-radius: 10px;
        height: 300px;
        width: 600px;
        padding: 30px;
        margin: 200px 200px 200px 200px;
      }
      .findPwdTitle {
        margin: 40px;
        font-size: 30px;
        font-weight: 700;
        color: rgb(4, 160, 222);
      }
      #pwd {
      	font-size:20px;
      }
      
      #red {
      	color: red;
      	font-size:15px;
      }
.button {
    &.login {
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
}
     .button.login button {
    transition: 300ms cubic-bezier(0.4, 0, 0.2, 1);
    -webkit-transition: 300ms cubic-bezier(0.4, 0, 0.2, 1);
    -ms-transition: 300ms cubic-bezier(0.4, 0, 0.2, 1);
}

.button {
    button {
        cursor: pointer;
        position: relative;
        z-index: 2;
    }
}

.button {
    button {
        background-color: #fff;
        color: #ED2553;
        border: none;
    }
}

.button {
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

.button button {
    font-family: 'Roboto', sans-serif;
    font-size: 24px;
    color: rgba(0, 0, 0, 0.8);
    font-weight: 300;
}

.button {
    button {
        position: relative;
    }
}



* {
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

* {
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

 .button button:hover {
      color: #ED2553;
      border-color: #ED2553;
    }
  }


    </style>
  </head>
  <body> 
    <section>
      <article style="text-align: center">
        <div class="findPwdForm">
         <c:choose>
				<c:when test="${search == 0}">
					<p class="inquiry">${msg}</p>
				</c:when>
        		<c:otherwise>
        		 	<p class="findPwdTitle">${mem_id }님의 임시 비밀번호 입니다</p> 
            		<p id="pwd">${newPwd}</p>
            		<p id="red">안전을 위해 비밀번호를 변경해 주세요</p>
        		</c:otherwise>
			</c:choose>
            <br />  
          <div class="button login">         
          <button type="submit" id="login">로그인<i class="fa fa-check"></i></button>
          </div>
        </div>
      </article>
    </section>
    <script>
	    // 로그인 폼으로 가기
		document.getElementById('login').addEventListener('click', function() {
		document.location.href = '<c:url value="/doLogin"/>';
	});
    </script>
  </body>
</html>
