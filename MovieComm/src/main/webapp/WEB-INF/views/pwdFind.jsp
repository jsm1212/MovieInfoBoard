<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<style type="text/css">
	.box{border: 3px solid #000000; margin: auto;
		 padding: 30px 0px; width: 70%;}
	.btnsize{width: 100px; margin-top: 10px;}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<h2 align="center">비밀번호 찾기</h2>
	<div align="center" class="box">
		<form>
			<input type="text" id = "id" size="20" placeholder="아이디를 입력하세요."><br>
			<input type="button" id="idCheck" class="btnsize" value="확인">
		</form>
	</div>
	
	<script type="text/javascript">
		$(document).ready(function(){
			$("#idCheck").click(function(){
				if($("#id").val() == ""){
					alert("아이디를 입력하세요");
				} else{
					$.ajax({
						url:"idCheck.do", type:"post",
						data:{id:$("#id").val()},
						success:function(num){
							if(num > 0){
								location.href = "pwdFind2.do?id=" + $("#id").val();
							} else{
								alert("아이디 정보가 없습니다");
								$("#id").val("");
							}
						}, error:function(){
							alert("error");
						}
				});}
			});
		});
	</script>
</body>
</html>