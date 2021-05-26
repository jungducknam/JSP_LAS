<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="LAS.userDAO" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%request.setCharacterEncoding("utf-8"); %>
<%
	String path = request.getRealPath("./marc_data/");
	//String path="C:/eclipse-projects/LAS_JSP/WebContent/marc_data/";
	String filename = request.getParameter("call_marc");
	
	userDAO udao = new userDAO();
	udao.insertDB_book(path+filename);
	
	request.setAttribute("name", filename);
	
%>
<jsp:forward page="coll_insert_result.jsp"/>