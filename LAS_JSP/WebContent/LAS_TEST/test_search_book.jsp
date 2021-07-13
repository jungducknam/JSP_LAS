<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%@page import="LAS_TEST.userDAO" %>
<%@page import="LAS_TEST.Book" %>
<%@page import ="java.util.*" %>

			<%	
				String cond = request.getParameter("query");
			%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8">
    <link rel="stylesheet" href = "./css/style.css" type = "text/css">
    <script>
    	function select_form(index){
    		if(index==1){
    			document.book_result.action='./loan_process.jsp';
    		}
    		else if(index==2){
    			document.book_result.action='./reservation_process.jsp';
    		}
    		document.book_result.submit();
    	}
    </script>
</head>
<body>
    <jsp:include page="./header.jsp"/>
	<jsp:include page="./nav.jsp"/>
	
	<article class="container">
		<jsp:include page="./body_search.jsp"/>

		<div class="item4">
			<div style="width:20%;height:65%;margin-left: 20%; margin-top: 1%;"><h1 style="color:whitesmoke;font-size:30px;"><%out.print("검색결과"); %></h1></div>
        </div>
		<div style="width:80%;margin:0 auto;">
			<div id="search_side">
				<div id="search_side_head">검색 </div>
				<div id="search_side_item">asdasd</div>
				<div id="search_side_item">asdasd</div>
				<div id="search_side_item">asdasd</div>
				<div id="search_side_item">asdasd</div>
				<div id="search_side_item">asdasd</div>
			</div>
			
			<!-- <form action="loan_process.jsp" method="post" name="book_result"> -->
			<jsp:include page="./test_search_book_list.jsp">
				<jsp:param name="cond" value="<%=cond %>"/>
			</jsp:include>
		</div>
		<jsp:include page="./footer.jsp"/>
    </article>
	
</body>
</html>