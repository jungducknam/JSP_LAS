<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%@page import="LAS.userDAO" %>
<%@page import="LAS.Book" %>
<%@page import ="java.util.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8">
    <link rel="stylesheet" href = "./css/style.css?ver=2" type = "text/css">
</head>
<body>
    <jsp:include page="./header.jsp"/>
	<jsp:include page="./nav.jsp"/>
	
	<article class="container">
		<div class="item1" id="main_back_img">
			<form id = "search_box_form" action="./search_book.jsp" method="get" onsubmit="check()">
				<fieldset id="search_box">
					<input id = "input_one" type="text" title="검색어 입력." name="query" placeholder="  검색어를 입력하세요.">
					<!--<button id= "input_two" type="submit">-->
					<input type="image" id = "input_two" src = "../img/searchBtn.png" alt="검색" title = "검색">
				</fieldset>
			</form>
		</div>
			<%	
				userDAO udao = new userDAO();
				String cond = request.getParameter("query");
				List<Book> book_list = udao.search_Book(cond);
			%>
		<div class="item4">
			<div style="width:20%;height:65%;margin-left: 20%; margin-top: 1%;"><h1 style="color:whitesmoke;font-size:30px;"><%out.print("검색결과 ("+book_list.size()+"건)"); %></h1></div>
        </div>
		<div style="width:80%;margin:0 auto;">
			<div id="search_side">
				<div class="item1_1">asdasd</div>
				<div class="item1_1">asdasd</div>
				<div class="item1_1">asdasd</div>
				<div class="item1_1">asdasd</div>
				<div class="item1_1">asdasd</div>
			</div>

			<ul id="search_item">
			<% for(int i=0;i<book_list.size();i++){
				Book book = book_list.get(i);
				out.print("<li id='list_item'>");
					out.print("<div id='check_box'>");
						out.print("<span><b>"+(i+1)+".</b></span><br>");
						out.print("<input type='checkbox' name='book' value='book_isbn_num'>");
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
		</div>
		<jsp:include page="./footer.jsp"/>
    </article>
	
</body>
</html>