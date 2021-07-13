<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "LAS_TEST.userDAO" %>
<%@ page import = "LAS_TEST.Book" %>
<%@ page import = "java.util.*" %>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	userDAO udao = new userDAO();
	List<Book> book_list = udao.readALLDB_book();
	for(int i=0;i<5;i++){
		Book book = book_list.get(i);
		out.print("<li><a href='#'><img src='./img/book_sample.png' id='sample_book'><div>"+book.getTITLE()+"</div></a></li>");
	}
%>