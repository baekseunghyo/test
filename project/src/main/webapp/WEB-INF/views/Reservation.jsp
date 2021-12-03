<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reservation</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<link href="/css/Reservation.css" type="text/css" rel="stylesheet"/> 
</head>
<body>
	<header>
		<div class="logoAndLogin">
			<div class="logo_wrap">
			<img id="logoImg" src="/img/logo_img.png" />
				<a href="/" class="logo">로고</a>
			</div>
			<div class="login">
				<c:choose>
					<c:when test="${empty userData}">
						<button class="Btn-line" id="loginBtn">로그인</button>
					</c:when>
					<c:otherwise>
						<button class="Btn-color" id="logoutBtn">로그아웃</button>
						<button class="Btn-line" id="mypageBtn">마이페이지</button>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</header>

	<section>
		<div class="shopInfoArea">
			<img src="${shop.simg}" alt="">
			<div class="nameAndInfoArea">
				<h2>${shop.sname}</h2>
				<div class="border-line"></div>
				<p>${shop.sinfo}</p>
			</div>

			<div class="phone">${shop.sphone}</div>
			<div class="shopPrice">${shop.price}</div>
			<div class="infoBoxArea">
				<div class="infoBox">${shop.saddress}</div>
				<div class="infoBox">${shop.stype}</div>
			</div>

		</div>
		<div class="reservationArea">
			<!-- <div class="calendar">달력</div> -->
			<div class="calendar">
				<div class="calendar-left">
					<table id="calendarTbl">
						<thead>
							<tr>
								<td><label id="prev">&#60;</label></td>
								<td colspan="5" id="current-year-month"></td>
								<td><label id="next">&#62;</label></td>
							</tr>
							<tr>
								<td class="sunday">Sun</td>
								<td>Mon</td>
								<td>Tue</td>
								<td>Wed</td>
								<td>Thu</td>
								<td>Fri</td>
								<td class="saturday">Sat</td>
							</tr>
						</thead>
						<tbody id="calendar-body"></tbody>
					</table>
				</div>
				<div class="calendar-right">
					<div class="todayWrap">
						<div id="today"></div>
						<div id="today-date"></div>
						<div class="border-line-cal"></div>
					</div>
					<div class="scheduleWrap">
						<h4>예약 정보</h4>
							<span id="reservation_null">예약 내역이 없습니다.</span>
						<div id="reservation_time">

						</div>

					</div>
				</div>
			</div>

			<!-- <div class="calendar">달력</div> -->
			<div class="selectBox">
				<div class="dateBox">
					<span style="margin-bottom: 10px;">선택한 날짜</span> <input type="date"
						id="selectDate" disabled>
				</div>
				<div class="time">
					<select name="timeSelector">
						<option value="">시간 선택</option>
						<option value="9:00 AM">9:00 AM</option>
						<option value="10:00 AM">10:00 AM</option>
						<option value="11:00 AM">11:00 AM</option>
						<option value="12:00 PM">12:00 PM</option>
						<option value="1:00 PM">1:00 PM</option>
						<option value="2:00 PM">2:00 PM</option>
						<option value="3:00 PM">3:00 PM</option>
						<option value="4:00 PM">4:00 PM</option>
						<option value="5:00 PM">5:00 PM</option>
						<option value="6:00 PM">6:00 PM</option>
					</select>
				</div>
				<div class="ChoiceBtn">
					<button class="Btn-line" id="reservationBtn" disabled>예약</button>
					<button class="Btn-line" id="changeBtn" disabled>변경</button>
				</div>
			</div>
		</div>
		<div class="border-line-review"></div>
		<div class="reviewArea">
			<div class="coment">
				<div>
					<h3>이용객 리뷰</h3>
				</div>
				<div class="border-line-review"></div>
				<div class="reviewBox">
					<c:choose>
						<c:when test="${empty userData}">
							<p class="loginCk">로그인 후 리뷰를 작성하실 수 있습니다.</p>
						</c:when>
						<c:otherwise>
							<textarea id="reviewWrite" placeholder="이용 후기를 남겨주세요.(500자 이내)"
								maxlength="500"></textarea>
							<div class="textBtnBox">
								<div id="textCnt">(0/500)</div>
								<button class="Btn-color" id="reviewBtn">작성</button>
							</div>
						</c:otherwise>
					</c:choose>
				</div>
				<div class="border-line-review"></div>
			</div>

			<c:choose>
				<c:when test="${empty review}">
					<div>
						<p class="review_null">아직 작성된 리뷰가 없습니다.</p>
					</div>
				</c:when>
				<c:otherwise>
					<c:forEach var='review' items="${review}">
						<div class="review">
							<div style="visibility: hidden">${review.idx}</div>
							<div class="nameBox">${review.uname}</div>
							<p class="writeTime">${review.writeTime}</p>
							<p class="coment">${review.comment}</p>
						</div>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</div>
		<div class="pop" id="reservationPop">
			<div>
				<p>[예약]</p>
				<p>예약을 하시겠습니까?</p>
				<div class="popBtn">
					<button class="Btn-line" id="yes">예</button>
					<button class="Btn-color" id="close">아니오</button>
				</div>
			</div>
		</div>
		<div class="pop" id="changePop">
			<div>
				<p>[예약 변경]</p>
				<p>예약을 변경하시겠습니까?</p>
				<div class="popBtn">
					<button class="Btn-line" id="yes">예</button>
					<button class="Btn-color" id="close">아니오</button>
				</div>
			</div>
		</div>
	</section>

	<script>
	<!-- 선택한 날짜 칸에 날짜 바꿔주는 친구 -->
		const offset = new Date().getTimezoneOffset() * 60000;
	
		document.getElementById('selectDate').value = new Date(Date.now()-offset).toISOString()
				.slice(0, 10);
		
		$(window).on('load',function(){
			chageReserv();
			$("#changeBtn").attr('disabled',true);
			changeInfo();
		});
		
		/*--- 화폐단위 콤마 넣기 ---*/
		$(function(){
			var price = $(".shopPrice").text();
			price = price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			$(".shopPrice").html("<div> \\"+price+"</div>");
		});
		
		/*--- 연락처 하이픈 넣기 ---*/
		$(function(){
			var phone = $('.phone').text();
			phone = phone.replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-");
			$(".phone").text(phone);	
		});
		

		$(function() {
			if ("${userData.uid}" != '') {
				$("#reservationBtn,#changeBtn").attr('disabled', false);
			}
		});

		$('#reviewWrite').keyup(function() {
			$('#textCnt').html("(" + $(this).val().length + " / 500)");

			if ($(this).val().length > 500) {
				$(this).val($(this).val().substring(0, 500));
				$('#textCnt').html("(500 / 500)");
			}
			;
		});

		$("#reviewBtn").click(function() {
			reviewUpload();
		});

		$("#loginBtn").click(function() {
			location.href = "/login"
		});

		$("#logoutBtn").click(function() {
			location.href = "/logout";
		});

		$("#mypageBtn").click(function() {
			location.href = "/my-page?uidx="+"${userData.idx}"
		});
		
		
		function reviewUpload() {
			var uidx = "${userData.idx}";
			var sidx = "${shop.idx}";
			var comment = $("#reviewWrite").val();
			var url = "/reservation?sid=" + "${shop.idx}";

			var data = {
				uidx : uidx,
				sidx : sidx,
				comment : comment
			};

			$.ajax({
						url : '/reservation/review',
						type : 'POST',
						data : data,
						success : function() {
							alert("리뷰 등록을 완료했습니다.");
							location.replace(url);
						},
						error : function(request, status, error) {
							alert("code : " + request.status + "\n"
									+ "message : " + request.responseText
									+ "\n" + "error : " + error);
						}
					});
		};

		$("#reservationBtn").click(
				function() {
					$("#reservationPop").show(); //팝업 오픈
					$("body").append('<div class="backon"></div>'); //뒷배경 생성

					$("body").on(
							"click",
							function(event) {
								if (event.target.id == 'close'
										|| event.target.className == 'backon') {
									$("#reservationPop").hide(); //close버튼 이거나 뒷배경 클릭시 팝업 삭제
									$(".backon").hide();
								} else if (event.target.id == 'yes') {
									payDeposit();
									$("#reservationPop").hide();
									$(".backon").hide();
								}
							});
				});

		$("#changeBtn").click(
				function() {
					$("#changePop").show(); //팝업 오픈
					$("body").append('<div class="backon"></div>'); //뒷배경 생성

					$("body").on(
							"click",
							function(event) {
								if (event.target.id == 'close'
										|| event.target.className == 'backon') {
									$("#changePop").hide(); //close버튼 이거나 뒷배경 클릭시 팝업 삭제
									$(".backon").hide();
								} else if (event.target.id == 'yes') {
									changeReservation();
									$("#changePop").hide();
									$(".backon").hide();
								}
							});
				});

		/*-- 달력 년월 표시, 달력 일자 표시 --*/
		var currentTitle = document.getElementById("current-year-month");
		var calendarBody = document.getElementById("calendar-body");
		/*-- 오늘 날짜, 이번 달의 첫날 --*/
		var today = new Date();
		const fixedToday = new Date();
		var first = new Date(today.getFullYear(), today.getMonth(), 1);
		/*-- 요일 정보, 달 정보, 윤년 정보 --*/
		var dayList = [ 'Sunday', 'Monday', 'Tuesday', 'Wednsday', 'Thursday',
				'Friday', 'Saturday' ];
		var monthList = [ 'January', 'February', 'March', 'April', 'May',
				'June', 'July', 'August', 'September', 'October', 'November',
				'December' ];
		var leapYear = [ 31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 ];
		var notLeapYear = [ 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 ];
		/*-- 이번 달 페이지 --*/
		var pageFirst = first;
		var pageYear;
		/*-- 클릭 요소 --*/
		var prevBtn = document.getElementById("prev");
		prevBtn.addEventListener('click', prev);
		var nextBtn = document.getElementById("next");
		nextBtn.addEventListener('click', next);
		/*-- 오른쪽 영역에 오늘 날짜 보여주기 --*/
		var rightToday = document.getElementById("today");
		var rightTodayDate = document.getElementById("today-date");
		
		
		/*-- 윤년 체크 --*/
		if (first.getFullYear() % 4 === 0) {
			pageYear = leapYear;
		} else {
			pageYear = notLeapYear;
		}

		/*-- 달력 만드는 함수 --*/
		function showCalendar() {
			let monthCnt = 100;
			let cnt = 1;

			for (var i = 0; i < 6; i++) {
				/*-- 토요일이 1일일 때 최대 6주! 반복문이 도는 동안 tr 생성 --*/
				var $tr = document.createElement('tr');
				$tr.setAttribute('id', monthCnt);
				for (var j = 0; j < 7; j++) {
					/*-- 첫번째 주 시작하는 요일 체크 --*/
					if ((i === 0 && j < first.getDay())
							|| cnt > pageYear[first.getMonth()]) {
						/*-- 출력 시작 날짜 || 달력 마지막 날짜 --*/
						var $td = document.createElement('td');
						$tr.appendChild($td);
					} else {
						var $td = document.createElement('td');
						$td.textContent = cnt;
						$td.setAttribute('id', cnt);
						$tr.appendChild($td);
						cnt++;
					}
				}
				monthCnt++;
				calendarBody.appendChild($tr);
				currentTitle.innerHTML = monthList[first.getMonth()]
						+ '&nbsp;&nbsp;&nbsp;&nbsp;' + first.getFullYear();
				showToday();
			}
		}
		showCalendar();
		addEventDate();
		

		/*-- 달력 삭제하는 함수 --*/
		function removeCalendar() {
			let catchTr = 100;
			for (var i = 100; i < 106; i++) {
				var $tr = document.getElementById(catchTr);
				$tr.remove();
				catchTr++;
			}
		}
		/*-- 이전 달로 넘기는 함수 --*/
		function prev() {
			if (pageFirst.getMonth() === 0) {
				/*-- 이번 달이 1월일 때 --*/
				/*-- 첫 번째 날을 지난 해 12월 1일로 세팅 --*/
				pageFirst = new Date(first.getFullYear() - 1, 11, 1);
				first = pageFirst
				/*-- 연도가 바뀌어서 윤년 체크 --*/
				if (first.getFullYear() % 4 === 0) {
					pageYear = leapYear;
				} else {
					pageYear = notLeapYear;
				}
			} else {
				/*-- 첫 번째 날을 지난 달 1일로 세팅 --*/
				pageFirst = new Date(first.getFullYear(), first.getMonth() - 1,
						1);
				first = pageFirst;
			}
			/*-- 지난 달 오늘 세팅 --*/
			today = new Date(first.getFullYear(), first.getMonth(), today
					.getDate());
			currentTitle.innerHTML = monthList[first.getMonth()]
					+ '&nbsp;&nbsp;&nbsp;&nbsp;' + first.getFullYear();
			removeCalendar();
			showCalendar();
			showToday();
			addEventDate();
		}

		/*-- 다음 달로 넘기는 함수 --*/
		function next() {
			if (pageFirst.getMonth() === 11) {
				pageFirst = new Date(first.getFullYear() + 1, 0, 1);
				first = pageFirst
				if (first.getFullYear() % 4 === 0) {
					pageYear = leapYear;
				} else {
					pageYear = notLeapYear;
				}
			} else {
				pageFirst = new Date(first.getFullYear(), first.getMonth() + 1,
						1);
				first = pageFirst;
			}
			today = new Date(today.getFullYear(), first.getMonth(), today
					.getDate());
			currentTitle.innerHTML = monthList[first.getMonth()]
					+ '&nbsp;&nbsp;&nbsp;&nbsp;' + first.getFullYear() - 1;
			removeCalendar();
			showCalendar();
			showToday();
			addEventDate();
		}
		
		/*-- 오른쪽 영역의 오늘 날짜 보여주는 함수 --*/
		function showToday() {
			rightToday.innerHTML = dayList[today.getDay()];
			rightTodayDate.innerHTML = today.getDate();
		}

		/*-- 모든 날짜에 이벤트 리스너 붙이는 함수 --*/
		var td;
		var checkDate = document.getElementById(today.getDate());
		checkDate.classList.add('active');

		function addEventDate() {
		debugger;
			for (let i = 1; i <= pageYear[first.getMonth()]; i++) {
				if (pageFirst.getMonth() === fixedToday.getMonth()
						&& pageFirst.getFullYear() === fixedToday.getFullYear()) {
					for (let j = fixedToday.getDate(); j <= pageYear[first.getMonth()]; j++) {
						td = document.getElementById(j);
						td.addEventListener('click', changeToday);
						td.classList.add('enable');
					}
				} else if (pageFirst.getMonth() > fixedToday.getMonth()
						|| pageFirst.getFullYear() > fixedToday.getFullYear()) {
					td = document.getElementById(i);
					td.addEventListener('click', changeToday);
					td.classList.add('enable');
				}
			}
		}
		/*-- 클릭 시에 날짜 바꿔주는 함수 --*/
		function changeToday(e) {
			checkDate.classList.remove('active');
			checkDate = e.currentTarget;
			checkDate.classList.add('active');
			today = new Date(today.getFullYear(), today.getMonth(),
					checkDate.id);
			showToday();
			<!-- 선택한 날짜 불러오기 / toISOString() 사용하기 위해 offset 설정 -->
			var clickDate = new Date(today.getTime()-(today.getTimezoneOffset()*60000));
			document.getElementById('selectDate').value = clickDate.toISOString()
					.slice(0, 10);
			chageReserv();
		}
		
		function payDeposit(){
			var uidx = "${userData.idx}";
			var price = "${shop.price}";
			var point = "${userData.point}";
			
			var data = {uidx : uidx, price : price, point : point};
			
			$.ajax({
				url : '/reservation/deposit',
				type : 'POST',
				data : data,
				success : function(result){
					if(result === "success"){
						reservation()
					} else if(result === "false"){
						alert("포인트가 부족합니다.\n[사용 가능한 포인트] : "+point);
					}
					},
					error : function(request, status, error) {
						alert("code : " + request.status + "\n"
								+ "message : " + request.responseText
								+ "\n" + "error : " + error);
					}
				});
					
			};
		
		
		/*-- 예약 함수 --*/
		function reservation(){
			var uidx = "${userData.idx}";
			var sidx = "${shop.idx}";
			var deposit = "${shop.price}";
			var date = $("#selectDate").val();
			var time = $("select[name=timeSelector]").val();
			
			var data = {uidx : uidx, sidx : sidx, deposit : deposit, date : date, time : time};
			
			$.ajax({
				url : '/reservation/booking',
				type : 'POST',
				data : data,
				success : function() {
					alert("예약을 완료했습니다.");
					location.href = "/reservation?sid="+sidx;
				},
				error : function(request, status, error) {
					alert("code : " + request.status + "\n"
							+ "message : " + request.responseText
							+ "\n" + "error : " + error);
				}
			});
				
		};
		
		
		/*-- 예약 변경 조회 함수 --*/
		function changeInfo(){
			var date = "${param.date}";
			var time = "${param.time}";
			
			if (date != '' && time != ''){
				$("select option[value='"+time+"']").prop('selected','selected');
				$("#selectDate").val(date);
				$("#reservationBtn").attr('disabled',true);
				$("#changeBtn").attr('disabled',false);
			} else {}
		};
		
		/*-- 예약 변경 함수 --*/
		function changeReservation(){
			var uidx="${userData.idx}";
			var sidx="${param.sid}";
			var date = "${param.date}";
			var time = "${param.time}";
			
			var changeDate = $("#selectDate").val();
			var changeTime =$("select[name=timeSelector]").val();
			
			var data = {uidx : uidx, 
						sidx : sidx, 
						date : date, 
						time : time,
						changeDate : changeDate,
						changeTime : changeTime};
			
			$.ajax({
				url : '/reservation/change/update',
				type : 'POST',
				data : data,
				success : function() {
					alert("예약을 변경했습니다.");
					location.href = "/reservation?sid="+sidx;
				},
				error : function(request, status, error) {
					alert("code : " + request.status + "\n"
							+ "message : " + request.responseText
							+ "\n" + "error : " + error);
				}
			});
		}
		
		/*-- 날짜 바꿔서 다시검색하는 함수.. --*/
		function chageReserv(){
			var sid = "${shop.idx}";
			var date = $("#selectDate").val();
			
			var data = {sid : sid, date : date};
			
			
			$.ajax({
				url : '/reservation/check',
				type : 'POST',
				dataType : 'JSON',
				data : data,
				success : function(reservation) {
					var list = reservation;
					$("#reservation_null").remove();
					$(".item").remove();
					$("select option").prop('hidden',false);
					
					if(list != ''){
						for(let i = 0; i < list.length; i++){
							var item = list[i];
							
							$("#reservation_time").append("<p class=item>"+item.time+"</p>");
							if(item.time === '9:00 AM'){
								$("select option[value='9:00 AM']").prop('hidden',true);
							} else if(item.time === '10:00 AM'){
								$("select option[value='10:00 AM']").prop('hidden',true);
							} else if(item.time === '11:00 AM'){
								$("select option[value='11:00 AM']").prop('hidden',true);
							} else if(item.time === '12:00 PM'){
								$("select option[value='12:00 PM']").prop('hidden',true);
							} else if(item.time === '1:00 PM'){
								$("select option[value='1:00 PM']").prop('hidden',true);
							} else if(item.time === '2:00 PM'){
								$("select option[value='2:00 PM']").prop('hidden',true);
							} else if(item.time === '3:00 PM'){
								$("select option[value='3:00 PM']").prop('hidden',true);
							} else if(item.time === '4:00 PM'){
								$("select option[value='4:00 PM']").prop('hidden',true);
							} else if(item.time === '5:00 PM'){
								$("select option[value='5:00 PM']").prop('hidden',true);
							} else if(item.time === '6:00 PM'){
								$("select option[value='6:00 PM']").prop('hidden',true);
							}
						}
					} else{
						$("#reservation_time").html("<span id='reservation_null'>예약 내역이 없습니다.</span>");
					}
				},
				error : function(request, status, error) {
					alert("code : " + request.status + "\n"
							+ "message : " + request.responseText
							+ "\n" + "error : " + error);
				}
			});	
		};
		
	</script>
</body>
</html>