<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
out.print("<nav id='top-menu'>");
out.print("<div class='nav_box'>");
out.print("<ul>");
	out.print("<li><a href='./main.jsp'><img id='logo_style' src='./img/liblogo.png'></a></li>");
		out.print("<li class='dropdown'>");
			out.print("<button>자료검색</button>");
			out.print("<div class='dropdown-content'>");
				out.print("<a href='#'>통합검색</a>");
				out.print("<a href='#'>작가검색</a>");
				out.print("<a href='#'>출판사검색</a>");
				out.print("</div>");
			out.print("</li>");
		out.print("<li class='dropdown'>");
		out.print("<button>나의 도서관</button>");
			out.print("<div class='dropdown-content'>");
			out.print("<a href='#'>대출,예약,연장</a>");
				out.print("<a href='#'>자료구입요청</a>");
				out.print("<a href='#'>신착자료알림</a>");
				out.print("</div>");
			out.print("</li>");
		out.print("<li class='dropdown'>");
		out.print("<button>도서관서비스</button>");
			out.print("<div class='dropdown-content'>");
			out.print("<a href='#'>도서관일정</a>");
				out.print("<a href='#'>도서관견학신청</a>");
				out.print("<a href='#'>문화행사</a>");
				out.print("</div>");
			out.print("</li>");
		out.print("<li class='dropdown'>");
		out.print("<button>커뮤니티</button>");
			out.print("<div class='dropdown-content'>");
			out.print("<a href='#'>공지사항</a>");
				out.print("<a href='#'>자료실</a>");
				out.print("<a href='#'>자유게시판</a>");
				out.print("<a href='#'>사서에게 물어보세요</a>");
				out.print("	</div>");
			out.print("</li>");
		out.print("<li class='dropdown'>");
		out.print("	<button>사이트맵</button>");
			out.print("</li>");
		out.print("</ul>");
	out.print("</div>");
out.print("</nav>");

%>