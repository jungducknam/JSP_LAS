<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="LAS.userDAO" %>
<%@page import="LAS.User" %>
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
	String id= request.getParameter("id");
	userDAO udao = new userDAO();
	udao.dbUpdate_level(id, "1");
	
	request.setAttribute("id",id);
	request.setAttribute("result","권한 부여");
%>
<jsp:forward page="./user_result.jsp"/>
</body>
</html>