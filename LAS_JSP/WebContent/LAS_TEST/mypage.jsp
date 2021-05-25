<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%@ page import="LAS.userDAO" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html>
<head>
<style>
	table,td,tr{
		border:solid 1px black;
	}

</style>
<meta charset="UTF-8">
<link rel="stylesheet" href = "./css/style.css?after" type = "text/css">
<title><%=session.getAttribute("user_name")%>님의 마이페이지</title>
</head>
<body>
<%
	String s_id = (String)session.getAttribute("user_id");
	userDAO udao = new userDAO();
	ArrayList<ArrayList<String>> lines = udao.readDB_loans(s_id);
%>
	<jsp:include page="./header.jsp"/>
	<div style="width:100%;height:86.6%;">
		<div id="mypage">
			<table>
				<tr><td>번호</td><td>서명</td><td>대출일</td><td>반납예정일</td><td>연장</td></tr>
<%
				for(int i=0;i<lines.size();i++){
					ArrayList<String>line = lines.get(i);
					out.print("<tr>");					
					out.print("<td>"+(i+1)+"</td>");
					out.print("<td>"+line.get(0)+"</td>");
					out.print("<td>"+line.get(2)+"</td>");
					out.print("<td>"+line.get(3)+"</td>");
					out.print("<td><a href='./loanday_process.jsp?id="+s_id+"&isbn="+line.get(1)+"'><input type='button' value='연장'></a></td>");
					out.print("</tr>");
				}
%>
				</table>
		</div>
	</div>
	<jsp:include page="./footer.jsp"/>
</body>
</html>