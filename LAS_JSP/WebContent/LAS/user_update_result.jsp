<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<style>
		html,body{
			background:#0E4194;
			height:100%;
			width:100%;
			overflow: hidden;
			padding:0;
			margin:0;
		}
		#div{
			background:white;
			height:80%;
			width:100%;
			margin-top:5%;
		}
	</style>
<meta charset="utf-8">
<title>정보 수정 완료</title>
</head>
<body>
	<div id="div">
		<div style="text-align:center;margin:auto;font-weight:bold;font-size:32px;">
			<p>${Name}님 정보 수정이 완료되었습니다.</p>
			<a href="./main.jsp"><input type="button" value="Go main"></a>
			<a href="./mypage.jsp?id=<%=(String)session.getAttribute("user_id") %>"><input type="button" value="Go mypage"></a>
		</div>
	</div>
</body>
</html>