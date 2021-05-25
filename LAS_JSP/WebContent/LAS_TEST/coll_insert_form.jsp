<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>반드시 해당 프로젝트 폴더안의 marc_data폴더에 있는 데이터만 가져오세요!</div>
<form method = "post" action="./coll_insert_process.jsp" name="fm">
	<input type="file" name="call_marc" accept=".txt">
	<input type="submit">
</form>
</body>
</html>