<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main</title>
 <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<link href="/css/Main.css" type="text/css" rel="stylesheet"/> 
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
            <div class="category">
                <nav>
                    <div class="category_hair">
                        <button class="cateBtn" id="category_hair" value="헤어">헤어</button>
                    </div>
                    <div class="category_nail">
                        <button class="cateBtn" id="category_nail" value="네일">네일</button>
                    </div>
                    <div class="category_massage">
                        <button class="cateBtn" id="category_massage" value="마사지">마사지</button>
                    </div>
                </nav>
            </div>
        </header>
    </div>

    <section>
        
            <div class="searchArea">
	            <div class="maket_text">
	        		<span class="text_span">모든 뷰티 예약을 로고에서 쉽고 편하게!</span>
	        	</div>
	        	<div class="border-line"></div>
                <input type="text" id="searchBox" placeholder="찾으시는 업체의 상호명 또는 업종을 검색해주세요.">
                <button id="searchBtn">검색</button>
            </div>
        <div class = 'back'>
        </div>
    </section>

    <div class="iconzone">
        <div class="part">
        	<img src="/img/hair_icon.png"/>
        	<br>
        	<span>헤어샵</span>
        	<div class="border-tag"></div>
        </div>
        <div class="part">
        	<img src="/img/nail_icon.png"/>
        	<br>
        	<span>네일샵</span>
        	<div class="border-tag"></div>
        </div>
        <div class="part">
        	<img src="/img/massage_icon.png"/>
        	<br>
        	<span>마사지샵</span>
        	<div class="border-tag"></div>
        </div>
    </div>


	    <script>
	    var stype = '';

        $("#loginBtn").click(function(){
            location.href = "/login";
        });
        
        $("#logoutBtn").click(function(){
            location.href = "/logout";
        });

        $("#mypageBtn").click(function(){
        	location.href = "/my-page?uidx="+"${userData.idx}"
        });

        $("#searchBtn").click(function(){
        	searchText = $("#searchBox").val();
        	
            if(searchText == ''){
            	alert("검색어를 입력해주세요.");
            	$("#searchBox").focus();
            }else{
            	searchByText();
            }
        });
        
        $(function () {
        	searchText = $("#searchBox").val();
            $("#searchBox").keypress(function (e) {
                if (e.which == 13) {
                	searchByText();
                }
            });
        });

        $("#category_hair").click(function(){
            stype = $(this).val();
            serchByCategory();
        });

        $("#category_nail").click(function(){
            stype = $(this).val();
            serchByCategory();
        });

        $("#category_massage").click(function(){
            stype = $(this).val();
            serchByCategory();
        });
        
        function serchByCategory(){
        	var searchText = stype;
            
        	location.href = "/search/category?searchText="+searchText;
        };
        
        function searchByText(){
        	var searchText = $("#searchBox").val();
            
        	location.href = "/search/category?searchText="+searchText;        	
        };
        
        
    </script>
</body>
</html>