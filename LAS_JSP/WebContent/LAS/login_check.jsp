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
		if(user.getAD_Level()!=null){
			session.setAttribute("adcheck",user.getAD_Level());
		}
		else{
			session.setAttribute("adcheck",null);
		}
		%>
		<jsp:forward page="./main.jsp"/>
<%
	}
	else{
		response.sendRedirect("./login_form.jsp");
	}
%>
