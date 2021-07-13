<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%@page import="LAS_TEST.userDAO" %>
<%@page import="LAS_TEST.Book" %>
<%@page import ="java.util.*" %>

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
			<%	
				userDAO udao = new userDAO();
				String cond = request.getParameter("query");
				
				int pageLine = 10;
				
				List<Book> book_list = udao.search_Book(cond);
				System.out.println(cond);
			%>
		<div class="item4">
			<div style="width:20%;height:65%;margin-left: 20%; margin-top: 1%;"><h1 style="color:whitesmoke;font-size:30px;"><%out.print("검색결과 ("+book_list.size()+"건)"); %></h1></div>
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
			<form method="post" name="book_result">
				<ul id="search_item">
				<li style="display:inline-block"><input type="button" value="대출" onclick="select_form(1)"></li>
				<li style="display:inline-block"><input type="button" value="예약" onclick="select_form(2)"></li>
				<%
					for(int i=0;i<book_list.size();i++){
						Book book = book_list.get(i);
						String isbn = book.getISBN();
						out.print("<li id='list_item'>");
							out.print("<div id='check_box'>");
								out.print("<span><b>"+(i+1)+".</b></span><br>");
								out.print("<input type='checkbox' name='book_isbn' value='"+isbn+"'>");
							out.print("</div>");
							out.print("<div id='book_image'>");
								out.print("<img src = './img/book_sample.png'>");
							out.print("</div>");
							out.print("<div id='book_info'>");
								out.print("<ul>");
									out.print("<li id='title'>"+book.getTITLE()+"</li>");
									out.print("<li id='author'>"+book.getAUTHOR()+"</li>");
									out.print("<li id='publisher'>"+book.getPUBLISHER()+"</li>");
									out.print("<li id='pub_year'>"+book.getPUB_YEAR()+"</li>");
									if(udao.loancheck(book.getISBN())){
										out.print("<li id='loan' style='color:red;'>"+"대출중"+"</li>");
									}
									else{
										out.print("<li id='loan' style='color:#0041C2;'>"+"대출 가능"+"</li>");
									}
								out.print("</ul>");
							out.print("</div>");
						out.print("</li>");
					}
				%>
				</ul>
			</form>
		</div>
		<jsp:include page="./footer.jsp"/>
    </article>
	
</body>
</html>