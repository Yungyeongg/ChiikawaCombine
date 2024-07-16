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
    <title>예약페이지</title>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.13.3/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
    <script src="https://code.jquery.com/ui/1.13.3/jquery-ui.js"></script>
    <style>
      
     	body {
  background-image: url(/resources/assets/img/pool.jpg);
  background-position: center;
  background-size: cover;
  min-height: 100vh;
  background-repeat: no-repeat;
  font-family: 'Roboto', sans-serif;
}   

        #suiteRoom,
        #standardRoom,
        #choose {
            border: 1px solid #e9ecef;
            background-color: #e9ecef;
            margin: 50px 200px;
            
        }

        #suiteRoom,
        #standardRoom {
        	height: 300px;
            display: grid;
            width: 900px;
            grid-template-columns: 300px 300px 300px;
            grid-gap: 50px;
            margin-left: auto;
            margin-right: auto;
            
        }
        
        #suiteinfo, #standardinfo  {
        margin-left: 80px;
        	/*padding: 60px;*/
        }
        
        p {
        	font-size: 20px;
        	font-weight: 700;
        }
        
        li {
        	margin-top:20px;
        }

        #btnWrap {
            width: 500px;
            margin: 100px auto;
        }

        #popupBtn1, #popupBtn2, #standardBtn, #suiteBtn {          
            width: 150px;
            height: 50px;
            padding: 10px 5px;
            background-color: rgb(4, 160, 222);
            color: #fff;
            /* 텍스트 색상을 지정하세요 */
            border: none;
            /* 테두리 제거 */
            cursor: pointer;
        }

        #modalWrap1, #modalWrap2 {
            position: fixed;
            /* 화면에 고정 */
            z-index: 1;
            /* 상위에 위치 */
            padding-top: 0%;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0, 0, 0, 0.7);
            /* 반투명한 배경색 */
            display: none;
            /* 초기에는 숨김 */
        }

        #modalBody {
            width: 500px;
            height: 2000px;
            padding: 30px 30px;
            margin: 0 auto;
            border: 1px solid #777;
            background-color: #fff;
        }

        #closeBtn1, #closeBtn2 {
            float: right;
            font-weight: bold;
            color: #777;
            font-size: 25px;
            cursor: pointer;
        }
        
        #a {
        	text-align: center;
        }
        
        #b, #c, #d, #e {
        	font-weight: 700;
        	background-color: #e9ecef;
       		margin-top: 50px;
        	padding: 10px;
        	font-size: 20px;
        	text-align: center;
	        border: 1px solid black;
			border-color: rgb(176, 179, 180);
			width: 200px;
			height: 80px;
			display: inline-block;
			
        }
    </style>
</head>

<body>
    <fmt:setLocale value = '<%=request.getParameter("language")%>'/>
   <fmt:bundle basename="bundle.message"> 
    <div id="a">
	    	<div id="b"><fmt:message key="book.location"/>
	    		<p> <select name="branch" id="branch">
	                <option><fmt:message key="book.location.seoul"/></option>
	                <option><fmt:message key="book.location.busan"/></option>
	            </select> </p>
	    	</div>
	    	<div id="c"><fmt:message key="book.checkin"/> 
	    		<p><input type="text" id="from" name="from"></p>
	    	</div>
	    	<div id="d"><fmt:message key="book.checkout"/>
	    		<p><input type="text" id="to" name="to"></p>
	    	</div>
	    	<div id="e"><fmt:message key="book.membercount"/>
	    		<p><input type="number" min="1" max="3" id="person" name="person"></p>
	    	</div>
    	
    </div>
    
    <div id="suiteRoom">
        <div id="suiteimg"><img src="/resources/assets/img/suite.jpg" alt="스위트" width="400px" height="300px"></div>
        <div id="suiteinfo">
            <p id="suite"><fmt:message key="book.suite"/></p>         
            <p><fmt:message key="book.price"/> 300,000<fmt:message key="book.won"/></p>
            <p><fmt:message key="book.memberprice"/> <span id="charge1">270,000</span><fmt:message key="book.won"/></p>
            <ul>
                <li><fmt:message key="book.freewifi"/></li>
                <li><fmt:message key="book.mountainview"/></li>
                <li><fmt:message key="book.canusefitness"/></li>
            </ul>
        </div>
        <div id="btnWrap">
            <input type="button" id="popupBtn1" value="<fmt:message key="book.goto.detail.button"/>"> <br><br>
            <div id="modalWrap1"> <!-- 모달 창을 감싸는 div -->
                <div id="modalBody">
                    <span id="closeBtn1">&times;</span> <!-- 모달을 닫는 X 버튼 -->
                    <!-- 모달 창 내용 -->
                    <p><fmt:message key="book.suite.detail"/></p>
                    <div style="text-align: center;"><img src="/resources/assets/img/suite.jpg" alt="스위트" width="500px"></div>
                    <p><fmt:message key="book.suite.roominfo"/></p>
                    <p><fmt:message key="book.suite.service"/></p>
                    <ol>
                        <li><fmt:message key="book.suite.fitness"/></li>
                        <li><fmt:message key="book.suite.rounge"/></li>
                        <li><fmt:message key="book.suite.fastwifi"/></li>
                        <li><fmt:message key="book.suite.snack"/></li>
                        <li><fmt:message key="book.suite.mountainview"/></li>
                    </ol>
                    <p><fmt:message key="book.suite.basemember"/></p>
                    <p><fmt:message key="book.suite.highmember"/></p>
                    <p><fmt:message key="book.bedandpillow"/></p>
                    <ol>
                        <li><fmt:message key="book.kingsize"/></li>
                        <li><fmt:message key="book.queensize"/></li>
                    </ol>
                    <p><fmt:message key="book.goto.detail.button"/></p>
                    <ol>
                        <li><fmt:message key="book.roomspace"/></li>
                        <li><fmt:message key="book.aircon"/></li>
                        <li><fmt:message key="book.airrefresher"/></li>
                        <li><fmt:message key="book.dontsmoke"/></li>
                        <li><fmt:message key="book.closet"/></li>
                    </ol>
                    <p><fmt:message key="book.shower"/></p>
                    <ol>
                        <li><fmt:message key="book.rock"/></li>
                        <li><fmt:message key="book.ofuro"/></li>
                        <li><fmt:message key="book.hairdrier"/></li>
                        <li><fmt:message key="book.cloth"/></li>
                        <li><fmt:message key="book.sleeper"/></li>
                    </ol>
                    <p><fmt:message key="book.furniture"/></p>
                    <ol>
                        <li><fmt:message key="book.sofa"/></li>
                        <li><fmt:message key="book.chair"/></li>
                        <li><fmt:message key="book.table"/></li>
                        <li><fmt:message key="book.alarm"/></li>
                        <li><fmt:message key="book.tv"/></li>
                    </ol>
                    <p><fmt:message key="book.snackservice"/></p>
                    <p><fmt:message key="book.kitchen"/></p>
                    <ol>
                        <li><fmt:message key="book.refrege"/></li>
                        <li><fmt:message key="book.dishcup"/></li>
                    </ol>
                </div>
            </div>
            <div id="alert1"></div>
            <button id="suiteBtn"><fmt:message key="book.goto.book.button"/></button>
        </div>
    </div>
    <div id="standardRoom">
        <div><img src="/resources/assets/img/standard.jpg" alt="스탠다드" width="400px" height="300px"></div>
        <div id="standardinfo">
             <p id="standard"><fmt:message key="book.standard"/></p>                     
            <p><fmt:message key="book.price"/> 150,000<fmt:message key="book.won"/></p>
            <p><fmt:message key="book.memberprice"/> <span id="charge2">135,000</span><fmt:message key="book.won"/></p>
            <ul>
                <li><fmt:message key="book.freewifi"/></li>
            </ul>
        </div>
        <div>
            <div id="btnWrap">
                <input type="button" id="popupBtn2" value="<fmt:message key="book.goto.detail.button"/>"> <br><br>
                <div id="modalWrap2"> <!-- 모달 창을 감싸는 div -->
                    <div id="modalBody">
                        <span id="closeBtn2">&times;</span> <!-- 모달을 닫는 X 버튼 -->
                        <!-- 모달 창 내용 -->
                        <p><fmt:message key="book.standarddetail"/></p>
                        <div style="text-align: center;"><img src="/resources/assets/img/standard.jpg" alt="스탠다드" width="500px"></div>
                        <p><fmt:message key="book.standard"/></p>
                        <p><fmt:message key="book.nobonus"/></p>
                        <p><fmt:message key="book.suite.basemember"/></p>
                        <p><fmt:message key="book.suite.highmember"/></p>
                        <p><fmt:message key="book.bedandpillow"/></p>
                        <ol>
                            <li><fmt:message key="book.kingsize"/></li>
                        </ol>
                        <p><fmt:message key="book.roomdetail"/></p>
                        <ol>
                            <li><fmt:message key="book.roomspace2"/></li>
                            <li><fmt:message key="book.aircon"/></li>
                            <li><fmt:message key="book.airrefresher"/></li>
                            <li><fmt:message key="book.dontsmoke"/></li>
                            <li><fmt:message key="book.closet"/></li>
                        </ol>
                        <p><fmt:message key="book.shower"/></p>
                        <ol>
                            <li><fmt:message key="book.ofuro"/></li>
                            <li><fmt:message key="book.hairdrier"/></li>
                            <li><fmt:message key="book.cloth"/></li>
                            <li><fmt:message key="book.sleeper"/></li>
                        </ol>
                        <p><fmt:message key="book.furniture"/></p>
                        <ol>
                            <li><fmt:message key="book.sofa"/></li>
                            <li><fmt:message key="book.chair"/></li>
                            <li><fmt:message key="book.table"/></li>
                            <li><fmt:message key="book.alarm"/></li>
                            <li><fmt:message key="book.tv"/></li>
                        </ol>
                        <p><fmt:message key="book.kitchen"/></p>
                        <ol>
                            <li><fmt:message key="book.refrege"/></li>
                            <li><fmt:message key="book.dishcup"/></li>
                        </ol>
                        <p><fmt:message key="book.wifi"/></p>
                    </div>
                </div>
                <div id="alert2"></div>
                <button id = "standardBtn"><fmt:message key="book.goto.book.button"/></button> 
            </div>
        </div>
      </div>
       <a href="?language=ko">Korean</a> | <a href="?language=jp">Japanese</a>  
        <script>   //달력
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

            // 모달창 (상세정보 스위트)
            const btn1 = document.getElementById("popupBtn1"); // 모달을 띄우는 버튼 요소 가져오기
            const modal1 = document.getElementById("modalWrap1"); // 모달 창 요소 가져오기
            const closeBtn1 = document.getElementById("closeBtn1"); // 모달을 닫는 버튼(X) 요소 가져오기

            btn1.onclick = function () {
                modal1.style.display = "block"; // 버튼을 클릭하면 모달을 보이게 함
            };

            closeBtn1.onclick = function () {
                modal1.style.display = "none"; // 모달을 닫는 버튼(X)을 클릭하면 모달을 숨김
            };

            window.onclick = function (event) {
                if (event.target == modal1) {
                    modal1.style.display = "none"; // 모달 외부를 클릭하면 모달을 숨김
                }
            };

            // 모달창 (상세정보 스탠다드)
            const btn2 = document.getElementById("popupBtn2"); // 모달을 띄우는 버튼 요소 가져오기
            const modal2 = document.getElementById("modalWrap2"); // 모달 창 요소 가져오기
            const closeBtn2 = document.getElementById("closeBtn2"); // 모달을 닫는 버튼(X) 요소 가져오기

            btn2.onclick = function () {
                modal2.style.display = "block"; // 버튼을 클릭하면 모달을 보이게 함
            };

            closeBtn2.onclick = function () {
                modal2.style.display = "none"; // 모달을 닫는 버튼(X)을 클릭하면 모달을 숨김
            };

            window.onclick = function (event) {
                if (event.target == modal2) {
                    modal2.style.display = "none"; // 모달 외부를 클릭하면 모달을 숨김
                }
            };
            
            // 예약하기 버튼 누르면
            $(document).ready(function() {
            	// 스위트
                $('#suiteBtn').click(function() {
                    var branch = $('#branch').val();
                    var checkin = $('#from').val();
                    var checkout = $('#to').val();
                    var person = $('#person').val();
                    var roomtype = 'suite';
                   // var roomName = $('#suite').val();
                    var charge = $('#charge1').text();
                    
                    let book = {
                    	branch:branch
                    	,roomtype:'suite'
                    	,checkin:checkin
                    	,checkout:checkout
                    };
                    
                    $.ajax({
            			type : 'post',
            			url : '/book/getSuiteCount',
            			data : JSON.stringify(book),
            			contentType : "application/json; charset=utf-8",
            			success : function(result) {
            				let availableRoomCount = 3 - parseInt(result.count);
            				if ( 0 >= availableRoomCount ) {
            					/*alert('해당 날짜에는 객실 예약이 불가합니다.(잔여객실 : 0 개)');*/
            					$("#alert1").css("color", "red").text("해당 날짜에는 객실 예약이 불가합니다.(잔여객실 : 0 개)");
            				} else {
            					let msg = '잔여 객실 ' + availableRoomCount + ' 개 있습니다. 예약하시겠습니까?';
            					if ( confirm(msg) ) {
				                    document.location.href = '/goBook'
				                                            + '?branch=' + branch
				                                            + '&from=' + checkin
				                                            + '&to=' + checkout
				                                            + '&person=' + person
				                                            + '&roomtype=' + roomtype
				                                           // + '&roomName=' + roomName
				                                            + '&charge=' + charge;
            						
            					}
            				}
            			}
            		});                 
                    
                });
            	
            	
				// 스탠다드
                $('#standardBtn').click(function() {
                    var branch = $('#branch').val();
                    var checkin = $('#from').val();
                    var checkout = $('#to').val();
                    var person = $('#person').val();
                    var roomtype = 'standard';
                   // var roomName = $('#standard').val();
                    var charge = $('#charge2').text();
                    
                    let book = {
                        	branch:branch
                        	,roomtype:'standard'
                        	,checkin:checkin
                        	,checkout:checkout
                        };
                    
                    $.ajax({
            			type : 'post',
            			url : '/book/getStandardCount',
            			data : JSON.stringify(book),
            			contentType : "application/json; charset=utf-8",
            			success : function(result) {
            				let availableRoomCount = 3 - parseInt(result.count);
            				if ( 0 >= availableRoomCount ) {
            					//alert('해당 날짜에는 객실 예약이 불가합니다.(잔여객실 : 0 개)');
            					$("#alert2").css("color", "red").text("해당 날짜에는 객실 예약이 불가합니다.(잔여객실 : 0 개)");
            				} else {
            					let msg = '잔여 객실 ' + availableRoomCount + ' 개 있습니다. 예약하시겠습니까?';
            					if ( confirm(msg) ) {
				                    document.location.href = '/goBook'
				                                            + '?branch=' + branch
				                                            + '&from=' + checkin
				                                            + '&to=' + checkout
				                                            + '&person=' + person
				                                            + '&roomtype=' + roomtype
				                                           // + '&roomName=' + roomName
				                                            + '&charge=' + charge;
            						
            					}
            				}
            			}
            		});         
            });
            });
                /* 비동기 방식 -> 페이지 전환없이 요청 (댓글, 회원가입 유효성 확인 등)
                $.ajax({
                    url: '/book_detail',
                    type: 'POST',
                    data: { branch: branch, from: from, to: to, person: person, roomtype: roomtype },
                    success: function(response) {
                        // 서버가 반환한 URL로 이동
                        window.location.href = response;
                    },
                    error: function(xhr, status, error) {
                        console.error('Error:', error);
                    }
                });
                */     
        </script>
        </fmt:bundle>
</body>

</html>>