<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	Object s_name = session.getAttribute("user_name");
	Object s_ad = session.getAttribute("ad_level");
	if(s_ad!=null){pageContext.forward("./adminmenu.jsp");}

%>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href = "./css/style.css" type = "text/css">
<link href="./css/jquery.bxslider.css" rel="stylesheet" />
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<script src="./js/jquery.bxslider.js"></script>

<title>LAS-메인</title>
</head>
<body>
	<jsp:include page="./header.jsp"/>
	<jsp:include page="./nav.jsp"/>
	<article class="container">
		<jsp:include page="./body_search.jsp"/>
		<div class="item4">
			<ul id="quick_menu">
				<li><a href="#">
					<img src = "./img/quickMenu01.png"><div>시설예약</div>
				</a></li>
				<li><a href="#">
					<img src = "./img/quickMenu02.png"><div>대출현황,연장</div>
				</a></li>
				<li><a href="#">
					<img src = "./img/quickMenu03.png"><div>자료구입요청</div>
				</a></li>
				<li><a href="#">
					<img src = "./img/quickMenu04.png"><div>추천도서</div>
				</a></li>
				<li><a href="#">
					<img src = "./img/quickMenu05.png"><div>커뮤니티</div>
				</a></li>
			</ul>
		</div>
		<div class="item2">
			<div class="item1_1"><span id="item_title">공지사항</span>
				<ul id="notice_list">
					<li>
						<span id="notice_list_mark">공지</span><a href=#>저희 도서관에 오신 분들을 환영합니다!</a><span id="notice_date">21-05-10</span>
					</li>
					<li>
						<span id="notice_list_mark">공지</span><a href=#>안내사항 전달 드립니다</a><span id="notice_date">21-05-10</span>
					</li>
					<li>
						<span id="notice_list_mark">공지</span><a href=#>21년 하반기 기간제 사서 채용 공고</a><span id="notice_date">21-05-10</span>
					</li>
					<li>
						<span id="notice_list_mark">공지</span><a href=#>독서프로그램 참여자 모집</a><span id="notice_date">21-05-10</span>
					</li>
					<li>
						<span id="notice_list_mark">공지</span><a href=#>고령자 대상 문해프로그램  참여자를 모집하고 있습니다.</a><span id="notice_date">21-05-10</span>
					</li>
				</ul>
			</div>
			<div class="item1_1"><span id="item_title">행사일정</span></div>
			<div class="item1_1" style="padding:0px;width:27%;height:96%">
				<ul id="slide_box" class="bxslider">
					<li><a href="#"><img src="./img/slide1.jpg"></a></li>
					<li><a href="#"><img src="./img/slide2.jpg"></a></li>
					<li><a href="#"><img src="./img/slide3.jpg"></a></li>
				</ul>
				<script type="text/javascript">
					$(document).ready(function(){
					  $('.bxslider').bxSlider({
						auto: true,
						speed: 500,
						pause: 4000,
						mode:'horizontal',
						autoControls: true,
						pager:true,
					   });
					 });
				   </script>
			</div>
		</div>
		<div class="item2">
			<div class="item1_2"><span id="item_title">신착도서</span>
				<ul id="new_books">
					<jsp:include page="./main_new_books.jsp"/>
				</ul>
			</div>
			<div class="item1_1"><span id="item_title">퀵메뉴</span></div>
		</div>
	</article>
	<jsp:include page="./footer.jsp"/>
</body>
</html>