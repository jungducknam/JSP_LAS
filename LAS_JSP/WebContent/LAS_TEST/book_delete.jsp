<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="LAS.userDAO" %>
<%@page import="LAS.Book" %>
<%@page import="java.util.*" %>
<%request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String isbn = request.getParameter("ISBN");
	userDAO udao = new userDAO();
	udao.deleteDB_book(isbn);
%>
	<p>도서 <%=isbn %>의 삭제가 완료되었습니다.</p>
	<p><a href="./adminmenu.jsp"><input type="button" value="관리자메인으로"></a></p>
</body>
</html>