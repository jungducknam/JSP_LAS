<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="LAS_TEST.userDAO" %>
<%@ page import="LAS_TEST.Book" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% request.setCharacterEncoding("utf-8"); %>
<% userDAO udao = new userDAO();
	ArrayList<ArrayList<String>> book_list = udao.readDB_loans(request.getParameter("id"));
%>
<html>
<head>
	<style>
		table,tr,td{
			border:solid 1px black;
		}
	
	</style>
</head>
<body>
<table>
	<tr><td>title</td><td>ISBN</td><td>대출일</td><td>반납예정일</td><td>반납</td></tr>
<%
	String id = request.getParameter("id");
	for(int i=0;i<book_list.size();i++){
		ArrayList<String> book = book_list.get(i);
		out.print("<tr>");
		out.print("<td>"+book.get(0)+"</td>");
		out.print("<td>"+book.get(1)+"</td>");
		out.print("<td>"+book.get(2)+"</td>");
		out.print("<td>"+book.get(3)+"</td>");
		out.print("<td>"+"<a href='./back_book_result.jsp?id="+id+"&isbn="+book.get(1)+"'><input type='button' value='반납'"+"</a></td>");
		out.print("</tr>");
	}
%>
</table>
</body>
</html>