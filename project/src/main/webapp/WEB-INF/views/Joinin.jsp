<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Join</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<link href="/css/Joinin.css" type="text/css" rel="stylesheet"/> 
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
					<button class="Btn-line" id="loginBtn">로그인</button>
				</div>
			</div>
		</header>
	</div>

	<section>
		<div class="invisable_box"></div>
		<div class="joinTextWrap">
			<span class="join_text">회원가입</span>
		</div>
		<div class="tableWrap">
			<table>
				<tr>
					<th>ID</th>
					<td><input id="id" type="text" placeholder="ID"></td>
					<td><button class="Btn-line" id="checkBtn">중복확인</button></td>
				</tr>
				<tr>
					<td colspan=3 class='valiTd'><p class='valiP' id="idP">*id를
							입력해주세요.</p></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input id="pw" type="password" placeholder="비밀번호"></td>
				</tr>
				<tr>
					<td colspan=3 class='valiTd'><p class='valiP' id="pwP">*pw를
							입력해주세요.</p></td>
				</tr>
				<tr>
					<th>비밀번호 확인</th>
					<td><input id="pwCheck" type="password" placeholder="비밀번호 확인"></td>
				</tr>
				<tr>
					<td colspan=3 class='valiTd'><p class='valiP' id="pwcP">*pw가
							틀립니다.</p></td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input id="name" type="text" placeholder="이름"></td>
				</tr>
				<tr>
					<td colspan=3 class='valiTd'><p class='valiP' id="nameP">*이름를
							입력해주세요.</p></td>
				</tr>
				<tr>
					<th>나이</th>
					<td><input id="age" type="text" placeholder="나이"></td>
				</tr>
				<tr>
					<th>주소</th>
					<td><input id="address" type="text" placeholder="주소"></td>
				</tr>
				<tr>
					<td colspan=3 class='valiTd'><p class='valiP' id="addressP">*주소를
							입력해주세요.</p></td>
				</tr>
				<tr>
					<th>연락처</th>
					<td><input id="mobile" type="text"
						placeholder="-를 제외한 숫자만 입력해주세요."></td>
				</tr>
				<tr>
					<td colspan=3 class='valiTd'><p class='valiP' id="mobileP">*핸드폰
							번호를 입력해주세요.</p></td>
				</tr>
			</table>
			<button class="button_join" id="joinBtn" disabled>가입하기</button>
		</div>
	</section>


	<script>
		var idCheck = false;
		const idCk = /^[a-zA-Z0-9]{4,12}$/;
		const pwCk = /^[a-zA-Z0-9]{6,20}$/;
		const nameCk = /^[가-힣]{2,6}$/;
		const addressCk = /^[가-힣]{2,6}$/;
		const mobileCk = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;

		$("input").keyup(function() {
			joinBtnCheck();
		});

		function joinBtnCheck() {
			var id = $("#id").val();
			var pw = $("#pw").val();
			var pwCheck = $("#pwCheck").val();
			var name = $("#name").val();
			var age = $("#age").val();
			var address = $("#address").val();
			var mobile = $("#mobile").val();

			if (id != '') {
				$("#idP").hide();

				if (idCk.test(id) == false) {
					$("#idP").text("*id가 유효하지 않습니다.").show();
				}
			}

			if (pw != '') {
				$("#pwP").hide();

				if (pwCk.test(pw) == false) {
					$("#pwP").text("*pw가 유효하지 않습니다.").show();
				}
			}

			if (pwCheck != pw) {
				$("#pwcP").show();
			} else {
				$("#pwcP").hide();
			}

			if (name != '') {
				$("#nameP").hide();

				if (nameCk.test(name) == false) {
					$("#nameP").text("*이름이 유효하지 않습니다.").show();
				}
			}

			if (address != '') {
				$("#addressP").hide();

				if (addressCk.test(address) == false) {
					$("#addressP").text("*주소가 유효하지 않습니다.").show();
				}
			}

			if (mobile != '') {
				$("#mobileP").hide();

				if (mobileCk.test(mobile) == false) {
					$("#mobileP").text("*연락처가 유효하지 않습니다.").show();
				}
			}

			if (id != '' && pw != '' && pwCheck != '' && name != ''
					&& address != '' && mobile != '') {
				$("#joinBtn").attr('disabled', false);
			} else {
				$("#joinBtn").attr('disabled', true);
			}

		};

		$("#loginBtn").click(function() {
			location.href = "login"
		});

		$("#checkBtn").click(function() {
			var id = $("#id").val();
			var data = {
				uid : id
			}

			idCheck = false;

			if (id == '') {
				alert("id를 입력해주세요.");
				$("#id").focus();
			} else {

				$.ajax({
					url : '/user/idCheck',
					type : 'POST',
					data : data,
					success : function(result) {
						if (result == 'fail') {
							alert("이미 사용중인 아이디입니다.");
							idCheck = false;
						} else {
							alert("사용이 가능한 아이디입니다.");
							idCheck = true;
						}
					},
					error : function() {
						alert("에러");
					}
				});
			}
			;
		});

		$("#joinBtn").click(function() {
			var id = $("#id").val();
			var pw = $("#pw").val();
			var pwCheck = $("#pwCheck").val();
			var name = $("#name").val();
			var age = $("#age").val();
			var address = $("#address").val();
			var mobile = $("#mobile").val();
			var data = {
				uid : id,
				upw : pw,
				uname : name,
				uage : age,
				uaddress : address,
				umobile : mobile
			}

			if (idCheck == true) {
				$.ajax({
					url : '/user/joinup',
					type : 'POST',
					data : data,
					success : function() {
						alert("성공적으로 가입을 마쳤습니다.");
						location.replace('login');
					},
					error : function() {
						alert("에러");
					}
				});
			} else {
				alert("id 중복 확인해주세요.");
				$("#id").focus();
			}

		});

		function check() {

		};
	</script>
</body>
</html>