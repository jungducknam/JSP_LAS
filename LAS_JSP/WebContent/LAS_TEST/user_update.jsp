<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="LAS_TEST.userDAO" %>
<%@ page import="LAS_TEST.User" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet" href = "./css/style.css?ver=2" type = "text/css">
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script>
    function onCheck(){
        if(!fm.Name.value){
            alert("name");
            fm.Name.focus();
            return false;
        }
        if(!fm.PW.value){
            alert("PW");
            fm.PW.focus();
            return false;
        }
        if(!fm.firstnum.value){
            alert("firstnum");
            fm.firstnum.focus();
            return false;
        }
        if(!fm.midnum.value){
            alert("midnum");
            fm.midnum.focus();
            return false;
        }
        if(!fm.lastnum.value){
            alert("lastnum");
            fm.lastnum.focus();
            return false;
        }
        if(!fm.year.value){
            alert("year");
            fm.year.focus();
            return false;
        }
        if(!fm.month.value){
            alert("month");
            fm.month.focus();
            return false;
        }
        if(!fm.day.value){
            alert("day");
            fm.day.focus();
            return false;
        }
        if(!fm.Address.value){
            alert("address");
            fm.Address.focus();
            return false;
        }
    }

    function id_search(){
    	theURL = "id.jsp";
    	window.open(theURL,'id_check','width=500,height=200');
    }
</script>
</head>
<body id="id_body">
<%
	request.setCharacterEncoding("utf-8");
	String s_id = (String)session.getAttribute("user_id");
	
	userDAO udao = new userDAO();
	User user = udao.readDB_user(s_id);
%>
<div id="box-main" style="width:60%; height:80%; margin:0 auto; padding-bottom:3%;">
<div style="margin:auto; padding:5%">
	<form action="user_update_process.jsp" method=post name="fm" onsubmit="return onCheck()">
		<table border="1" cellpadding="5">
		<tr>
		   <td>이름</td>
		   <td><input type="text" name="Name" value="<%=user.getName() %>" size=15/></td>
		</tr>
		<tr>
		   <td>아이디</td>
		   <td><input type="text" name="ID" value="<%=user.getID() %>" size=15 readonly/></td>
		</tr>
		<tr>
		   <td>전화번호</td>
		   <td>
		      <select name="firstnum">
		         <option value="053">053</option>
		         <option value="02">02</option>
		         <option value="031">031</option>
		         <option value="051">051</option>
		         <option value="010">010</option>
		         <option value="011">011</option>
		      </select>
		      -<input type="text" name="midnum" size=4 maxlength=4/>
		      -<input type="text" name="lastnum" size=4 maxlength=4/>
		   </td>
		</tr>
		<tr>
			<td>생년월일</td>
			<td>
				<select name = "year">
					<%
						for(int i=1980;i<=2016;i++){
							out.print("<option value='"+i+"'>"+i+"</option>");
						}
					%>
				</select><span>년 </span>
				<select name = "month">
					<%
						for(int i=1;i<=12;i++){
							out.print("<option value='"+i+"'>"+i+"</option>");
						}
					%>
				</select><span>월 </span>
				<select name = "day">
					<%
						for(int i=1;i<=31;i++){
							out.print("<option value='"+i+"'>"+i+"</option>");
						}
					%>
				</select><span>일 </span>
			</td>
		</tr>
		<tr>
		   <td>주소</td>
		   <td>
		      <textarea rows="2" cols="100" name="Address" value="<%=user.getAddress() %>"></textarea>
		   </td>
		</tr>
		<tr>
		   <td colspan="2" align="center">
		   <button type="submit">등록하기</button>
		   <button type="reset">취소하기</button>
		   </td>
		</tr>
		</table>
	</form>
</div>
</div>
</body>
</html>