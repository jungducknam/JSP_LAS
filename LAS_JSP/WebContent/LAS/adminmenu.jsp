<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.getAttribute("utf-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href = "./css/style.css" type = "text/css">
<title><%=session.getAttribute("user_name")%> 도서관 관리 페이지</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
Object s_name = session.getAttribute("user_name");
//String s_name = request.getParameter("s_name");
String s_ad = request.getParameter("s_ad");
%>
	<jsp:include page="./header.jsp"/>
	<div style="width:100%;height:84.7%;">
	<ul>
		<li><a href="./all_user.jsp">유저 조회,삭제 및 권한부여</a></li>
		<li><a href="./all_book.jsp">장서조회 및 삭제</a></li>
		<li><a href="./coll_insert_form.jsp">장서추가</a></li>
		<li><a href="./back_book.jsp">반납 업무</a></li>
	</ul>
	</div>
	<jsp:include page="./footer.jsp"/>
</body>
</html>