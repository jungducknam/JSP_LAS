<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%request.setCharacterEncoding("utf-8"); %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="#" method = "post">
		<p>반납할 이용자의 ID를 입력하세요<input type="text" name="id"></p>
<%			request.setAttribute("id",request.getParameter("id")); %>
	</form>
	<jsp:include page="./back_book_list.jsp"/>

</body>
</html>