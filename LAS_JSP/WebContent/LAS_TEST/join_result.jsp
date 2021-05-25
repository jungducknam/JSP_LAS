<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
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
<title>가입을 축하드립니다.</title>
</head>
<body>
	<div id="div">
		<div style="text-align:center;margin:auto;font-weight:bold;font-size:32px;">
			<p>${Name}님! 가입을 축하드립니다.</p>
			<a href="./main.jsp"><input type="button" value="Go main"></a>
		</div>
	</div>
</body>
</html>