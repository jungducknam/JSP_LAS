<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");
	String alert = request.getParameter("alert");
%>
<%@ page import="LAS.userDAO" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html>
<head>
<style>
	table{
		width:60%;
	}
	table,th,td,tr{
		border:solid 1px black;
		border-collapse:collapse;
		padding:3px;
	}
	td{
		font-size:15px;
		padding-left:5px;
	}
	#my_item1{
		border:1px solid #ccc;
		padding:2%;
		width:80%;
		height:30%;
		margin:1% auto 1% auto;
	}

</style>
<meta charset="UTF-8">
<link rel="stylesheet" href = "./css/style.css" type = "text/css">
<title><%=session.getAttribute("user_name")%>님의 마이페이지</title>
</head>
<body>
<%
	String s_id = (String)session.getAttribute("user_id");
	userDAO udao = new userDAO();
	ArrayList<ArrayList<String>> lines = udao.readDB_loans(s_id);
%>
	<jsp:include page="./header.jsp"/>
	<div style="width:100%;height:84.6%;">
		<div id="my_item1">
			<table>
				<tr><th style='width:40px;'>번호</th><th>서명</th><th>대출일</th><th>반납예정일</th><th>연장</th></tr>
<%
				for(int i=0;i<lines.size();i++){
					ArrayList<String>line = lines.get(i);
					out.print("<tr>");					
					out.print("<td style='width:40px;text-align:center;'>"+(i+1)+"</td>");
					out.print("<td>"+line.get(0)+"</td>");
					out.print("<td>"+line.get(2)+"</td>");
					out.print("<td>"+line.get(3)+"</td>");
					out.print("<td style='text-align:center;'><a href='./loanday_process.jsp?id="+s_id+"&isbn="+line.get(1)+"'><input type='button' value='연장'></a></td>");
					out.print("</tr>");
				}
%>
				</table>
		</div>
	</div>
	<jsp:include page="./footer.jsp"/>
</body>
</html>