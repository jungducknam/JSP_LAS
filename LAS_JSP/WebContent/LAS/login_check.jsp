<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="LAS.userDAO" %>
<%@ page import="LAS.User" %>

<%
	String id= request.getParameter("userid");
	String password = request.getParameter("userpw");
	userDAO userdao = new userDAO();
	User user = userdao.readDB_user(id);
	
	if(password.equals(user.getPW())){
		session.setAttribute("user_name",user.getName());
		session.setAttribute("user_id",user.getID());
		session.setAttribute("ad_level",user.getAD_Level());
	}
	else{
		request.setAttribute("alert", "ID또는 PW가 잘못되었습니다.");
		pageContext.forward("./login_form.jsp");
	}
%>
<jsp:forward page="main.jsp"/>