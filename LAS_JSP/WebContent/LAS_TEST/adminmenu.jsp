<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.getAttribute("utf-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
Object s_name = session.getAttribute("user_name");
//String s_name = request.getParameter("s_name");
String s_ad = request.getParameter("s_ad");
out.print("<div id='head_line'><div id='head_menu'><ul><li><b>"+s_name+"님</b></li><li><a href='./logout.jsp'>로그아웃</a></li></ul></div></div>");
%>
	<ul>
		<li><a href="./all_user.jsp">유저 조회,삭제 및 권한부여</a></li>
		<li><a href="./all_book.jsp">장서조회 및 삭제</a></li>
		<li><a href="./coll_insert_form.jsp">장서추가</a></li>
	</ul>
</body>
</html>