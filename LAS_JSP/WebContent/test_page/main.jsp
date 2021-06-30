<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	html,body{
		width:100%;
		height:100%;
		margin:0px;
		padding:0px;
	}
	header{
		width:100%;
		height:20%;
		text-align:center;
		background-color:grey;
	}
	#side_box{
		width:15%;
		height:100%;
		display:block;
		float:left;
		background-color:black;
		color:white;
	}
</style>
</head>
<body>
<header>
	<h1 style="margin:auto">hello</h1>
</header>
<article style="width:100%;height:100%;">
	<div id="side_box">
		<p>sdsds</p>
	</div>
	<div>
		<%request.setAttribute("line", "너 뭐하고 있냐<br>"); %>
		<jsp:include page="./show.jsp"/>
	</div>
</article>
</body>
</html>