<%@page import="mul.camp.seven.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- MemberController loginAf.do에서 저장해둔 사용자 정보 가져오기 -->   
<%
	MemberDto user = (MemberDto)request.getSession().getAttribute("login");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>

<!-- CSS -->
<style type="text/css">
	* {
		margin: 0;
		padding: 0;
		box-sizing: border-box;
	}
	
	body {
		width: 100%;
		height: 100vh;
		display: flex;
		background: rgba(0, 0, 0, 0.1);
	}
	
	a {
		text-decoration: none;
		color: black;
	}
	
	li {
		list-style: none;
	}
	
	.wrap {
		width: 100%;
		height: 100vh;
		display: flex;
		align-items: center;
		justify-content: center;
	}
	
	.pwdreset {
		width: 30%;
		height: 600px;
		background: white;
		border-radius: 20px;
		display: flex;
		justify-content: center;
		align-items: center;
		flex-direction: column;
	}
	
	h2 {
		color: #448f99;
		font-size: 2em;
	}
	
	.pwd_reset {
		margin-top: 20px;
		width: 80%;
	}
	
	.pwd_reset input {
		width: 100%;
		height: 50px;
		border-radius: 30px;
		margin-top: 10px;
		padding: 0px 20px;
		border: 1px solid lightgrey;
		outline: none;
	}
	
	.submit {
		margin-top: 40px;
		width: 80%;
	}
	
	button {
		cursor: pointer;
		width: 100%;
		font-size: 16px;
		padding: 7px 20px;
	}
</style>

<!-- jqeury, bootstrap 사용을 위해 code 추가 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</head>
<body>

<form class="wrap" action="changePwdAf.do" id="frm" method="post">
	<div class="wrap">
		<div class="pwdreset">
			<h2>🔑 비밀번호 재설정</h2>
			
				<div class="pwd_reset">
					<label for="reset">비밀번호</label>
					<div>
					<input type="password" id="pwd" name="pwd" placeholder="영문/숫자/특수문자 포함 8-16자리">
					</div>
				</div>
				
				<!-- id 같이 전달 -->
				<input type="hidden" name="id" id="id" value="<%=user.getId() %>">
				
				<div class="submit">
					<button class="btn btn-secondary" type="button" onclick="change()">확인</button>
				</div>
		</div>
	</div>
</form>	


<script type="text/javascript">
<!-- (Front) 유효성 검사 -->
function change() {
	var pwdRule = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,16}$/;

	if($("#pwd").val().trim() == ''){ 
		alert("패스워드를 입력해 주십시오.");
	}
	// 패스워드 작성규칙 검사
	else if(!pwdRule.test($('#pwd').val().trim())){
		alert("패스워드 작성규칙에 맞게 작성해주십시오.")
		$("#pwd").val("");
	}
	else {
		$("#frm").submit();				// form id="frm"
	}
}
</script>

</body>
</html>