<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="LAS.userDAO" %>
<%request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		userDAO udao = new userDAO();
	
		String s_id = (String)session.getAttribute("user_name");
		String[] isbn_list = request.getParameterValues("book_isbn");
		
		int possible_loan_count = 5-udao.countcheck(s_id);
		
		if(isbn_list.length<=possible_loan_count){
			for(String isbn : isbn_list){
				udao.insertDB_loans(s_id, isbn);
			}
			request.setAttribute("result", isbn_list.length);
			pageContext.forward("./loan_result.jsp");
		}
		else{
			out.print("<h3> 대출하시려는 책의 수가 너무 많습니다. 현재 이용자님은 "+possible_loan_count+"개의 도서를 대출할 수 있습니다.</h3>");
			out.print("<a hreg='#' onclick='history.back(-1);' return false;>뒤로가기</a>");
			
		}
	
	%>
</body>
</html>