<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Find</title>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<link href="/css/Find.css" type="text/css" rel="stylesheet"/> 
</head>
<body>
 <div class="wrap">
        <div class="top">
            <div class="logoWrap">
            <img id="logoImg" src="/img/logo_img.png" />
                 <a href="/" class="logo">로고</a>
            </div>
            <div class="login">
                <button class="Btn-line" id=loginBtn>로그인</button>
            </div>
        </div>
        <div class="middle">
            <div class="findId">
                <h3>ID찾기</h3>
                <div class="border-line-w"></div>
                <div class="inputBox">
                    <input type="text" placeholder="이름" id="nameForId">
                    <input type="text" placeholder="전화번호" id="mobile">
                </div>
                <div class="findBtn">
                    <button class="Btn-line" id="findIdBtn" disabled>ID찾기</button>
                </div>
            </div>
            <div class="border-line-l"></div>
            <div class="findPw">
                <h3>PW찾기</h3>
                <div class="border-line-w"></div>
                <div class="inputBox">
                    <input type="text" placeholder="ID" id="id">
                    <input type="text" placeholder="이름" id="nameForPw">
                </div>
                <div class="findBtn">
                    <button class="Btn-line" id="findPwBtn" disabled>PW찾기</button>
                </div>
            </div>
        </div>
    </div>
    <script>
    const idCk = /^[a-zA-Z0-9]{4,12}$/;
    const nameCk = /^[가-힣]{2,6}$/;
    const mobileCk = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;

		$("input").keyup(function(){
			btnEnable();
		});
		
		$("#loginBtn").click(function(){
            location.href = "/login";
        });
		
		function btnEnable(){
			var valCkId = false;
			var valCkPw = false;
			var iname = $("#nameForId").val();
    		var mobile = $("#mobile").val();
    		var id = $("#id").val();
    		var pname = $("#nameForPw").val();
    		
			if(nameCk.test(iname) == true
					&& mobileCk.test(mobile) == true){
				valCkId = true
			}else {valCkId = false}
				
				
			if (nameCk.test(pname) == true
					&& idCk.test(id) == true){
				valCkPw = true
			}else{ valCkPw = false }
			
			
			if(valCkId == true){
				$("#findIdBtn").attr('disabled',false);
			} else {$("#findIdBtn").attr('disabled',true);}
				
			if(valCkPw == true){
				$("#findPwBtn").attr('disabled',false);
			}else{$("#findPwBtn").attr('disabled',true);}
		};
    
		
    	$("#findIdBtn").click(function(){
    		var iname = $("#nameForId").val();
    		var mobile = $("#mobile").val();
			var data = {uname : iname, umobile : mobile};
   		
    		$.ajax({
    			url:'/login/findid',
    			type : 'POST',
    			dataType: 'text',
    			data : data,
    			success : function(result){
    				if(result != ''){
    					alert(iname+"님의 아이디는 "+result+" 입니다.");
    				}else{ alert("가입 정보가 없습니다.");}
    			},
    			error : function(request, status, error){
    				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
    			}
    		});
    		
    	});
    	
    	
    	$("#findPwBtn").click(function(){
    		var id = $("#id").val();
    		var pname = $("#nameForPw").val();
			var data = {uid : id, uname : pname};
    		
    		$.ajax({
    			url:'/login/findpw',
    			type : 'POST',
    			dataType: 'text',
    			data : data,
    			success : function(result){
    				if(result != ''){
    					alert(pname+"님의 비밀번호는 "+result+" 입니다.");
    				}else{ alert("가입 정보가 없습니다.");}
    			},
    			error : function(request, status, error){
    				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
    			}
    		});
    		
    	});
    	
    	
    </script>
</body>
</html>