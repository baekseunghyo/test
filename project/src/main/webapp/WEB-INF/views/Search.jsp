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
<title>Search</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<link href="/css/Search.css" type="text/css" rel="stylesheet"/> 
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
						<button class="cateBtn" id="category_hair" value='헤어'>헤어</button>
					</div>
					<div class="category_nail">
						<button class="cateBtn" id="category_nail" value='네일'>네일</button>
					</div>
					<div class="category_massage">
						<button class="cateBtn" id="category_massage" value='마사지'>마사지</button>
					</div>
				</nav>
			</div>
		</header>
	</div>

	<section>
		<div>
			<div class="searchArea">
				<input type="text" id="searchBox" placeholder="검색어 입력하세용">
				<button id="searchBtn">검색</button>
			</div>
			<div class="sidebarWrap">
				<div class="sortArea">
					<div class="sidebar_location">
						<select name="location" id="locationSort"
							onchange="onClickSearch(this.value)">
							<option value="">지역 선택</option>
							<option value="서울">서울</option>
							<option value="대전">대전</option>
							<option value="광주">광주</option>
							<option value="대구">대구</option>
							<option value="부산">부산</option>
						</select>
					</div>
					<div class="sidebar_filter">
						<div class="sort">정렬</div>
						<table class="sortTable">
							<tr>
								<td><input type="radio" name="sort" value="descView"
									id="descView"> <label for="descView">조회많은순</label></td>
							</tr>
							<tr>
								<td><input type="radio" name="sort" value="ascView"
									id="ascView"> <label for="ascView">조회적은순</label></td>
							</tr>
							<tr>
								<td><input type="radio" name="sort" value="descPrice"
									id="descPrice"> <label for="descPrice">가격높은순</label></td>
							</tr>
							<tr>
								<td><input type="radio" name="sort" value="ascPrice"
									id="ascPrice"> <label for="ascPrice">가격낮은순</label></td>
							</tr>
						</table>
						<div class="somethin"></div>
					</div>
				</div>
				<div class="resultArea" id='resultArea'>
					<c:choose>
						<c:when test="${empty search}">
							<div>
								<p class="result_null">검색된 정보가 없습니다.</p>
							</div>
						</c:when>
						<c:otherwise>
							<c:forEach var='search' items="${search}">
								<div class="resultBox">
									<div style="visibility: hidden" class="sid">${search.idx}</div>
									<img src="${search.simg} " alt="">
									<div class="infoBox">${search.saddress}</div>
									<div class="infoBox">${search.stype}</div>
									<p class="textShop">${search.sname}</p>
									<div class="viewCount">${search.view}</div>
								</div>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</section>





	<script>
		var stype = '';


		$("#loginBtn").click(function() {
			location.href = "/login"
		});

		$("#logoutBtn").click(function() {
			location.href = "/logout";
		});

		$("#mypageBtn").click(function() {
			location.href = "/my-page?uidx=" + "${userData.idx}"
		});

		$("#category_hair").click(function() {
			stype = $(this).val();
			serchByCategory();
		});

		$("#category_nail").click(function() {
			stype = $(this).val();
			serchByCategory();
		});

		$("#category_massage").click(function() {
			stype = $(this).val();
			serchByCategory();
		});

		$(window).on('load', function() {
			var searchText = "${param.searchText}";
			var locationText = "${param.location}";
			var sortText = "${orderby}"

			if (searchText != '') {
				$('#searchBox').val(searchText);
			}

			if (locationText != '') {
				$("#locationSort").val(locationText).prop("selected", true);
			}
			
			if(sortText === 'viewTop'){
				$('#descView').prop('checked',true);
			}
			
			if(sortText === 'viewBottom'){
				$('#ascView').prop('checked',true);
			}
			
			if(sortText === 'priceTop'){
				$('#descPrice').prop('checked',true);
			}
			
			if(sortText === 'priceBottom'){
				$('#ascPrice').prop('checked',true);
			}
		});

		$("#searchBtn").click(function() {
			var searchText = $("#searchBox").val();

			if (searchText == '') {
				alert("검색어를 입력해주세요.");
			} else {
				searchByText();
			}
		});

		$(function() {
			searchText = $("#searchBox").val();
			$("#searchBox").keypress(function(e) {
				if (e.which == 13) {
					searchByText();
				}
			});
		});

		function serchByCategory() {
			var searchText = stype;

			location.href = "/search/category?searchText=" + searchText;

		};

		function searchByText() {
			var searchText = $("#searchBox").val();

			location.href = "/search/category?searchText=" + searchText;
		};

		function onClickSearch(value) {
			var locationData = value;
			var searchText = "${param.searchText}";

			var url = "/search/location?searchText=" + searchText
					+ "&location=" + locationData;

			location.href = url;
		};

		$(".resultBox").click(
				function() {
					/*var sname = $(this).children('p').text();*/
					var sid = $(this).children('.sid').text();

					location.href = "/reservation?sid=" + sid;
				});

		$("#descView").click(
				function() {
					var searchText = "${param.searchText}";
					var locationData = "${param.location}";
					

					if (locationData == "") {
						location.href = "/search/topview2?searchText="
								+ searchText
					} else {
						location.href = "/search/topview1?searchText="
								+ searchText + "&location=" + locationData;
					}
					
				});

		$("#ascView").click(
				function() {
					var searchText = "${param.searchText}";
					var locationData = "${param.location}";

					if (locationData == "") {
						location.href = "/search/bottomview2?searchText="
								+ searchText
					} else {
						location.href = "/search/bottomview1?searchText="
								+ searchText + "&location=" + locationData;
					}
					sortText = "ascView";
				});

		$("#descPrice").click(
				function() {
					var searchText = "${param.searchText}";
					var locationData = "${param.location}";

					if (locationData == "") {
						location.href = "/search/topprice2?searchText="
								+ searchText
					} else {
						location.href = "/search/topprice1?searchText="
								+ searchText + "&location=" + locationData;
					}
					sortText = "descPrice";
				});

		$("#ascPrice").click(
				function() {
					var searchText = "${param.searchText}";
					var locationData = "${param.location}";

					if (locationData == "") {
						location.href = "/search/bottomprice2?searchText="
								+ searchText
					} else {
						location.href = "/search/bottomprice1?searchText="
								+ searchText + "&location=" + locationData;
					}
					sortText = "ascPrice";
				});

		

		/*function replace(url) {
			url = url.replace(/&/g, "%26").replace(/\+/g, "%2B");
			return url;
		};*/
	</script>
</body>
</html>