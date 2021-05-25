<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="LAS.userDAO" %>
<%@page import="LAS.User" %>
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
List<User> user_list = udao.readAllDB_user();
%>
	<p><a href="./adminmenu.jsp"><input type="button" value="관리자메인으로"></a></p>
	<table>
		<tr><td>번호</td><td>이름</td><td>ID</td><td>생일</td><td>전화번호</td><td>주소</td><td>연체여부</td><td>관리자 여부</td><td>관리권한 부여</td><td>관리권한 회수</td><td>삭제</td></tr>
<%
		for(int i=0;i<user_list.size();i++){
			User user = user_list.get(i);
			String ad = "N";
			if(user.getAD_Level()!=null){
				ad = "Y";
			}
			out.print("<tr>");
			out.print("<td>"+(i+1)+"</td><td>"+user.getName()+"</td><td>"+user.getID()+"</td><td>"+user.getBirth()+"</td><td>"+user.getPhone()+"</td><td>"+user.getAddress()+"</td><td>"+user.getLoan()+"</td>"+"<td>"+ad+"</td>");
			out.print("<td><a href='./user_grant.jsp?id="+user.getID()+"'>부여</a></td>");
			out.print("<td><a href='./user_revoke.jsp?id="+user.getID()+"'>회수</a></td>");
			out.print("<td><a href='./user_delete.jsp?id="+user.getID()+"'>삭제</a></td>");
			out.print("</tr>");
		}

%>
	</table>
</body>
</html>