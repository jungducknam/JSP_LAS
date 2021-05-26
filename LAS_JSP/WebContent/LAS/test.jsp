<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="LAS.Read_marc" %>
<%@ page import="LAS.Book" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		Read_marc marc = new Read_marc();
	
		/*jsp 기본경로가 C:\eclipse-projects\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\(각 프로젝트 명) 으로 설정되어있음.*/
		String filepath = request.getRealPath("./marc_data/1.txt");
		
		File file = new File(filepath); //
		BufferedReader filedata = new BufferedReader(new InputStreamReader(new FileInputStream(file),"utf-8")); //텍스트 파일을 utf-8로 글자로 만들어 출력
		String marcdata = filedata.readLine();
		filedata.close();
		marc.setMARC(filepath);
		marc.setBook();
		Book book = marc.getBook();
		
		out.print("marc원본 데이터 : "+marcdata);
		out.print("<br>");
		out.print("<p>marc데이터를 가공한 결과 : "+"</p>");
		out.print("<p>ISBN : "+book.getISBN()+"</p>");
		out.print("<p>title : "+book.getTITLE()+"</p>");
		out.print("<p>AUTHOR : "+book.getAUTHOR()+"</p>");
		out.print("<p>CO-AUTHOR : "+book.getCO_AUTHOR()+"</p>");
		out.print("<p>PUBLISHER : "+book.getPUBLISHER()+"</p>");
		out.print("<p>PUB_YEAR : "+book.getPUB_YEAR()+"</p>");
		
		out.print("<br>");
		ArrayList<ArrayList<String>> marc_list = marc.getMARC();
		for(int i =0;i<marc_list.size();i++){
			out.print("<p>"+marc_list.get(i)+"</p>");
		}
		
		
		
		
		

	
	%>
</body>
</html>