<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "LAS_TEST.userDAO" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<% request.setCharacterEncoding("utf-8"); %>
<%
	String id = request.getParameter("id");
	String isbn = request.getParameter("isbn");
	
	userDAO udao = new userDAO();
	udao.dbUpdate_loan_back(id, isbn);
%>
<h3><%=id %>에 대한 반납 처리가 완료되었습니다</h3>
<a href="./back_book.jsp"><input type="button" value="돌아가기"></a>

</body>
</html>