<%@page import="mul.camp.seven.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String memId = (String)request.getAttribute("_id"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.box{border: 3px solid #000000; margin: auto;
		 padding: 30px 0px; width: 70%;}
	.btn{width: 100px;}
	.center{display: inline;}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<h2 align="center">아이디 찾기</h2>
	<div align="center" class="box">
		<p id = "ddd" style="fotn-size: 8px">
			회원님의 아이디는 <%=memId %>입니다.
		</p>
		
		<form action="login.do" class="center">
			<input class="btn" type="submit" value="로그인">
		</form>
		
		<form action="pwdFind.do" class="center">
			<input class="btn" type="submit" value="비밀번호 찾기">
		</form>
	</div>
</body>
</html>