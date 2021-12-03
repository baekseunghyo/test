<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<link href="/css/Login.css" type="text/css" rel="stylesheet"/> 
</head>
<body>
 <div class="wrap">
        <div class="top">
            <div>
            <img id="logoImg" src="/img/logo_img.png" />
                <a href="/" class="logo">로고</a>
            </div>
        </div>
        <div class="middle">
        	<div class="loginWrap">
	            <div class="login">
	                로그인
	            </div>
	            <div class="border-line"></div>
	            <div class="loginBox">
	                <div class="idBox">
	                    <input type="text" placeholder="ID입력" id=uid />
	                </div>
	                <div class="pwBox">
	                    <input type="password" placeholder="PW입력" id=upw />
	                </div>
	            </div>
	            <div class="loginBtn">
	                <input type="button" value="로그인" onclick="loginBtn()">
	            </div>
	            <div class="find">
	                <a href="/join">회원가입</a>
	                <a href="/find">ID/PW찾기</a>
	            </div>
            </div>
            <div class="back">
	        </div>
        </div>
    </div>
    <script>
    $(function () {
        $("#upw").keypress(function (e) {
            if (e.which == 13) {
                loginBtn();
            }
        });
    });

    function loginBtn() {
        var id = $('#uid').val();
        var password = $('#upw').val();

        if (id == "") {
            alert("아이디를 입력해주세요.");
            return false;
        }
        if (password == "") {
            alert("비밀번호를 입력해주세요.");
            return false;
        }

        var datas = {
            uid: id,
            upw: password
        };

        $.ajax({
            type: 'POST',
            url: '/j_spring_security_check',
            dataType: 'JSON',
            data: datas
        }).done(function (body) {

            var error = body.response.error;
            if (error) {
                if (body.response.msg == 'ERROR_NOT_FOUND_USER') {
                    alert('아이디와 비밀번호를 확인해주세요.');
                } else {
                    alert('알수없는 오류입니다.\n관리자에게 문의해주세요.');
                }
            } else {
                var url = body.response.url;
                location.href = url;
            }
        });
    }
    </script>
</body>
</html>