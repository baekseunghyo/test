<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Page</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<link href="/css/Mypage.css" type="text/css" rel="stylesheet"/> 

</head>
<body>
	<div class="header_wrap">
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
			<div>
				<h1>마이페이지</h1>
				<div class='header-line'></div>
			</div>
		</header>
	</div>

	<section>
		<div class="divide_line">
			<h3>회원정보</h3>
		</div>
		<div class="userTbl">
			<table>
				<tr>
					<th>이름</th>
					<td>${userData.uname}</td>
				</tr>
				<tr>
					<td colspan=2 class="border-line"></td>
				</tr>
				<tr>
					<th>ID</th>
					<td>${userData.uid}</td>
				</tr>
				<tr>
					<td colspan=2 class="border-line"></td>
				</tr>
				<tr>
					<th>주소</th>
					<td>${userData.uaddress}</td>
				</tr>
				<tr>
					<td colspan=2 class="border-line"></td>
				</tr>
				<tr>
					<th>연락처</th>
					<td class="mobile">${userData.umobile}</td>
				</tr>
				<tr>
					<td colspan=2 class="border-line"></td>
				</tr>
				<tr>
					<th>포인트</th>
					<td class="mypoint">${mypoint}</td>
				</tr>
			</table>

		</div>
		<div class="divide_line">
			<h3>예약정보</h3>
		</div>
		<div id="infoArea">


			<c:choose>
				<c:when test="${empty mypage}">
					<div>
						<p class="reservation_null">예약된 내역이 없습니다.</p>
					</div>
				</c:when>
				<c:otherwise>
					<c:forEach var="mypage" items="${mypage}">
						<div class="reservInfo">
							<table class="infoTbl">
								<tr>
									<th>상호명</th>
									<td class="name">${mypage.sname}</td>
									<th>예약일자</th>
									<td class="date">${mypage.date}</td>
									<th>예약시간</th>
									<td class="time">${mypage.time}</td>
								</tr>
							</table>
							<div class="BtnArea">
								<button class="Btn-line" id="changeBtn" value="${mypage.idx}"
									onClick="changeBtn(this)">예약변경</button>
								<button class="Btn-color" id="cancelBtn" value="${mypage.idx}"
									onClick="cancelBtn(this)">예약취소</button>
							</div>
						</div>
					</c:forEach>

				</c:otherwise>
			</c:choose>
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
		<div class="pop" id="cancelPop">
			<div>
				<p>[예약 취소]</p>
				<p>예약을 취소하시겠습니까?</p>
				<div class="popBtn">
					<button class="Btn-line" id="yes">예</button>
					<button class="Btn-color" id="close">아니오</button>
				</div>
			</div>
		</div>
	</section>


	<script>
		$("#loginBtn").hide();

		$("#loginBtn").click(function() {
			location.href = "/login"
		});

		$("#logoutBtn").click(function() {
			location.href = "/logout";
		});

		$("#mypageBtn").click(function() {
			location.href = "/my-page?uidx=" + "${userData.idx}"
		});
		
		/*--- 화폐단위 콤마 넣기 ---*/
		$(function(){
			var point = $(".mypoint").text();
			point = point.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			$(".mypoint").text(point);
		});
		
		/*--- 연락처 하이픈 넣기 ---*/
		$(function(){
			var mobile = $('.mobile').text();
			mobile = mobile.replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-");
			$(".mobile").text(mobile);	
		});

		function changeBtn(e) {
			$("#changePop").show(); //팝업 오픈
			$("body").append('<div class="backon"></div>'); //뒷배경 생성

			$("body").on("click",function(event) {
						if (event.target.id == 'close'
								|| event.target.className == 'backon') {
							$("#changePop").hide(); //close버튼 이거나 뒷배경 클릭시 팝업 삭제
							$(".backon").hide();
						} else if (event.target.id == 'yes') {
							var date = $(e).parents('.reservInfo').find('.date').text();
							var time = $(e).parents('.reservInfo').find('.time').text();
							changeResevation(date,time);
							$("#changePop").hide();
							$(".backon").hide();
						}

					});
		};


		function cancelBtn(e) {
			$("#cancelPop").show(); //팝업 오픈
			$("body").append('<div class="backon"></div>'); //뒷배경 생성

			$("body").on("click",function(event) {
						if (event.target.id == 'close'
								|| event.target.className == 'backon') {
							$("#cancelPop").hide(); //close버튼 이거나 뒷배경 클릭시 팝업 삭제
							$(".backon").hide();
						} else if (event.target.id == 'yes') {
							var date = $(e).parents('.reservInfo').find('.date').text();
							var time = $(e).parents('.reservInfo').find('.time').text();
							cancelResevation(date, time);
							$("#cancelPop").hide();
							$(".backon").hide();
						}

					});
		};

		function cancelResevation(date, time) {
			var uidx = "${userData.idx}";
			var sidx = $("#cancelBtn").val();

			var data = {
				uidx : uidx,
				sidx : sidx,
				date : date,
				time : time
			};

			$.ajax({
						url : '/reservation/cancel',
						type : 'POST',
						data : data,
						success : function() {
							alert("예약이 취소되었습니다.");
							location.href = "/my-page?uidx="+ "${userData.idx}"
						},
						error : function(request, status, error) {
							alert("code : " + request.status + "\n"
									+ "message : " + request.responseText
									+ "\n" + "error : " + error);
						}
					});
		};
		
		function changeResevation(date, time) {
			var sidx = $("#cancelBtn").val();
			
			location.href = "/reservation?sid="+sidx+"&date="+date+"&time="+time;
		};
	</script>
</body>
</html>