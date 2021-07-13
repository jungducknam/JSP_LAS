<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="LAS_TEST.userDAO" %>
<%@page import="LAS_TEST.Book" %>
<%@page import ="java.util.*" %>
<%request.setCharacterEncoding("utf-8"); %>
<%
	String cond = request.getParameter("query");
	int pageLine = 10;
	int pageNo = (int)session.getAttribute("pageNo");
	System.out.println(pageNo);
	userDAO udao = new userDAO();
	List<Book> book_list = udao.search_Book(pageNo, pageLine, cond);

%>
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