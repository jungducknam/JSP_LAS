<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>전체동의</title>
</head>
    <link rel="stylesheet" href = "./css/style.css?after?ver=1" type = "text/css">
    <script>
        function check(){
            var frm = document.frm;
            if(!frm.agree1.checked){
                alert("약관에 동의하세요");
                return;
            }
            if(!frm.agree2.checked){
                alert("개인정보에 동의하세요");
                return;
            }
            location.href="./join_form.jsp";
        }
        function allCheck(){
            if(frm.all.checked){
                frm.agree1.checked=true;
                frm.agree2.checked=true;
            }
            else{
                frm.agree1.checked=false;
                frm.agree2.checked=false;
            }
        }
        function changechk(){
            if(frm.agree1.checked && frm.agree2.checked){
                frm.all.checked=true;
            }
            else{
                frm.all.checked=false;
            }
            return true;
        }
    </script>


<body id="id_body">   
<div id="box-main" style="width:45%; height:65%; margin:0 auto; padding-bottom:3%;">
    <div style="margin:auto; padding:5%">
        <h2 style="text-align:center;">이용자 정보 동의</h2>
        <hr>
    <form action="#" name = "frm" method="get">
        <div>
            <input type="checkbox" name = "all" id = "all" onclick="allCheck()"/><label for = "all">전체동의</label>
        </div>
        <p>
            <textarea cols="106" rows = "10">약관동의</textarea><br>
            <input type="checkbox" name="agree1" id="agree1" onchange="changechk()"/><label for = "agree1">약관동의</label>
        </p>
        <hr>
        <p>
            <textarea cols="106" rows = "10">개인정보</textarea><br>
            <input type="checkbox" name="agree2" id="agree2" onchange="changechk()"/><label for = "agree2">개인정보동의</label>
        </p>
        <hr>
        <p>
            <input type="button" value="동의" onclick="check()"/><input type = "reset" value="취소"/>
        </p>
   </form>
</div>
</div>
</body>
</html>