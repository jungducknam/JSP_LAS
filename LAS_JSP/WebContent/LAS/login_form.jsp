<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href = "./css/style.css?ver=2" type = "text/css">
<script>
	function onCheck(){
		if(!login.userid.value){
            alert("아이디를 입력해주세요");
            login.userid.focus();
            return false;
        }
        if(!login.userpw.value){
            alert("비밀번호를 입력해주세요");
            login.userpw.focus();
            return false;
        }
	}
</script>

<title>LAS</title>
</head>
<body id="id_body">
	<br>
	<div id="box-main">
		<header>LAS</header>
			<hr>
		<div id="inbox1">
			<form action="./login_check.jsp" method="post" name="login" onsubmit="return onCheck()">
				<table style="margin:auto">
				<tr>
				 	<td><span style="width:10%;">ID:</span></td><td><input id="userid" type="text" name="userid"></td>
				</tr>
				<tr>
					<td><span style="width:10%;">PW: </span></td><td><input id="userpw" type="text" name="userpw"></td>
				</tr>
				<tr>
					<td colspan="2"><input type='submit' value="로그인" style="width:100%; margin-top:5%"></td>
				</tr>
				</table>
			</form>
		</div>
		<hr>
		<div>
		<table style="margin:auto">
			<tr>
				<td><a href="./yakgwan.jsp"><input type="button" value="회원가입"></a></td>
				<td><a href='#'><input type="button" value="ID/PW 찾기(미구현)"></a></td>
			</tr>
		</table>
		</div>
	</div>
</body>
</html>