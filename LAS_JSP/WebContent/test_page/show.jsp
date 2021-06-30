<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% out.print("show.jsp <br>"); 
		String line = (String)request.getAttribute("line");
		String line2 = line + "<br>니가 알아서 뭐하게<br>";
		out.print(line2);
		
		request.setAttribute("line", line2);
	%>
	<jsp:include page="view.jsp"/>
</body>
</html>