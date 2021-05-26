<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	request.setCharacterEncoding("utf-8");
	Object s_name = session.getAttribute("user_name");
	Object s_ad = session.getAttribute("ad_level");
	Object s_id = session.getAttribute("user_id");
	if(s_name==null){
		out.print("<div id='head_line'><div id='head_menu'><ul><li><a href='./login_form.jsp'>로그인</a></li><li><a href='./yakgwan.jsp'>회원가입</a></li></ul></div></div>");
	}
	else{
		out.print("<div id='head_line'><div id='head_menu'><ul><li><b><a href='./mypage.jsp?id="+s_id+"'>"+s_name+"님</a></b></li><li><a href='./logout.jsp'>로그아웃</a></li></ul></div></div>");
	}
%>