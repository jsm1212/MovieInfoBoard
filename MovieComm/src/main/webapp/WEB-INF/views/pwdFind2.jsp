<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.box{border: 3px solid #000000; margin: auto;
		 padding: 10px 0px 40px; width: 70%;}
	.btnsize{width: 100px; margin-top: 10px;}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<h2 align="center">비밀번호 찾기</h2>
	<div align="center" class="box">
		<form>
			<h3 align="center">이메일 인증</h3>
			<table>
				<tr>
					<td>이메일</td>
					<td><input type="text" id="email" size="20"></td>
					<td><input type="button" id="sendNum" value="인증번호 전송"></td>
				</tr>
				<tr>
					<td></td>
					<td><input type="text" id="inputCode" placeholder="인증번호 6자리 숫자입력"></td>
					<td><input type="button" id="check" value="확인"></td>
				</tr>
			</table>
		</form>
	</div>
	<script type="text/javascript">
		let code = ""; // 인증번호 저장용 -> 인증번호 확인에 사용
		
		$(document).ready(function(){
			$("#sendNum").click(function(){
				if($("#email").val() == ""){
					alert("이메일을 입력하세요");
				} else{
					$.ajax({
						url:"emailCheck.do", type:"post",
						data:{email:$("#email").val()},
						success:function(rdnum){
							if(rdnum > 0){ // 회원O
								alert("인증번호가 전송되었습니다");
								code = rdnum;
							} else{		   // 회원X
								alert("이메일 정보가 없습니다");
								$("#email").val("");
							}
						}, error:function(){
							alert("error");
						}
				});}
			});
		});
		
		$(document).ready(function(){
			$("#check").click(function(){
				if($("#inputCode").val() == "" || $("#inputCode").val() != code){
					alert("인증번호를 정확하게 입력하세요");
					$("#inputCode").val("");
				} else{
					location.href = "pwdReset.do?email=" + $("#email").val();
				}
			});
		});
	</script>
</body>
</html>