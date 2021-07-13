<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href = "./css/style.css" type = "text/css">
<title>Insert title here</title>
</head>
<body>
		<div class="item1" id="main_back_img">
			<form id = "search_box_form" action="./test_search_book.jsp" method="get" onsubmit="check()">
				<fieldset id="search_box">
					<input id = "input_one" type="text" title="검색어 입력." name="query" placeholder="  검색어를 입력하세요.">
					<!--<button id= "input_two" type="submit">-->
					<input type="image" id = "input_two" src = "./img/searchBtn.png" alt="검색" title = "검색">
				</fieldset>
			</form>
		</div>
</body>
</html>