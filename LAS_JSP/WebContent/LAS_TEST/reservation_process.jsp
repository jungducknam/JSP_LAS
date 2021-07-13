<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="LAS_TEST.userDAO" %>
<%request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	userDAO udao = new userDAO();
	
	String s_id = (String)session.getAttribute("user_id");
	String[] isbn_list = request.getParameterValues("book_isbn");
	
	int possible_loan_count = 5-udao.countcheck(s_id);
	
	if(isbn_list.length<=possible_loan_count){
		for(String isbn : isbn_list){
			udao.insertDB_reserv(s_id, isbn);
		}
		pageContext.forward("./reservation_result.jsp");
	}
	else{
		out.print("<h3> 예약하시려는 책의 수가 너무 많습니다. 현재 이용자님은 "+possible_loan_count+"개의 도서를 예약할 수 있습니다.</h3>");
		out.print("<a hreg='#' onclick='history.back(-1);' return false;>뒤로가기</a>");	
	}
	request.setAttribute("result", isbn_list.length);
%>
</body>
</html>