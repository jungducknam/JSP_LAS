<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="LAS.userDAO" %>
<%@page import="LAS.Book" %>
<%@page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
	table,tr,td{
		border:1px solid black;
	}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
userDAO udao = new userDAO();
List<Book> book_list = udao.readALLDB_book();
%>
	<p><a href="./adminmenu.jsp"><input type="button" value="관리자메인으로"></a></p>
	<table>
		<tr><td>번호</td><td>서명</td><td>저자</td><td>공저자</td><td>출판사</td><td>출판연도</td><td>KDC</td><td>DDC</td><td>ISBN</td><td>ISBN_SET</td><td>삭제</td></tr>
<%
		for(int i=0;i<book_list.size();i++){
			Book book = book_list.get(i);
			out.print("<tr>");
			out.print("<td>"+(i+1)+"</td>");
			out.print("<td>"+book.getTITLE()+"</td>");
			out.print("<td>"+book.getAUTHOR()+"</td>");
			out.print("<td>"+book.getCO_AUTHOR()+"</td>");
			out.print("<td>"+book.getPUBLISHER()+"</td>");
			out.print("<td>"+book.getPUB_YEAR()+"</td>");
			out.print("<td>"+book.getKDC()+"</td>");
			out.print("<td>"+book.getDDC()+"</td>");
			out.print("<td>"+book.getISBN()+"</td>");
			out.print("<td>"+book.getSET_ISBN()+"</td>");
			out.print("<td><a href='book_delete.jsp?ISBN="+book.getISBN()+"'>삭제</a></td>");
			out.print("</tr>");
		}
%>
	</table>
</body>
</html>