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
<title>예약 완료.</title>
</head>
<body>
	<div id="div">
		<div style="text-align:center;margin:auto;font-weight:bold;font-size:32px;">
			<h3>${result}개의 자료를 예약했습니다.</h3>
			<a href="./main.jsp"><input type="button" value="Go main"></a>
		</div>
	</div>
</body>
</html>