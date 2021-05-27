<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%@ page import="LAS.userDAO" %> 
<%@ page import="LAS.User" %>
<%@ page import="java.sql.Date" %>
<jsp:useBean id="user" class="LAS.User"/>
<jsp:setProperty property="*" name="user"/>

<%
	String name = request.getParameter("Name");
	String address = request.getParameter("Address");
	String tel1 = request.getParameter("firstnum");
	String tel2 = request.getParameter("midnum");
	String tel3 = request.getParameter("lastnum");
	
	String year = request.getParameter("year");
	String month = request.getParameter("month");
	String day = request.getParameter("day");
	
	String birth_date = year+"-"+month+"-"+day;
	Date bd = Date.valueOf(birth_date);
	
	user.setName(name);
	user.setAddress(address);
	user.setPhone(tel1+tel2+tel3);
	user.setBirth(bd);
	
	userDAO udao = new userDAO();
	udao.dbUpdate_user(user);
	
	request.setAttribute("Name", user.getName());
%>
<jsp:forward page="./user_update_result.jsp"/>