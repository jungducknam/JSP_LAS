<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="LAS.userDAO" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% request.setCharacterEncoding("utf-8"); %>
<% userDAO udao = new userDAO();
	ArrayList<ArrayList<String>> book_list = udao.readDB_loans(request.getParameter("id"));
%>
<table>
<%
	for(int i=0;i<book_list.size();i++){
		out.print(book_list.get(i));
	}
%>
</table>