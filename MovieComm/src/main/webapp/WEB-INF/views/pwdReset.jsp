<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String mem = (String)request.getAttribute("_id2"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 재설정</title>
<style type="text/css">
	.box{border: 3px solid #000000; margin: auto;
		 padding: 40px 0px; width: 70%;}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<h2 align="center">비밀번호 재설정</h2>
	<div align="center" class="box">
		<form>
			<table>
				<tr>
					<td colspan="2">
						아이디 : <input id="id" value="<%=mem %>" style="border: none;" readonly="readonly">
					</td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" id="pwd" size="20"></td>
				</tr>
				<tr>
					<td>비밀번호 재확인</td>
					<td><input type="password" id="pwd2" size="20"></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="button" id="pwdChange" value="변경">
					</td>
				</tr>
			</table>
		</form>
	</div>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#pwdChange").click(function(){
				if($("#pwd").val().trim() == "" || $("#pwd2").val().trim() == ""){
					alert("비밀번호를 입력하세요");
				} else if($("#pwd").val().trim() != $("#pwd2").val().trim()){
					alert("비밀번호가 일치하지 않습니다");
					$("#pwd2").val("");
				} else{
					alert("변경되었습니다");
					location.href = "pwdUpdate.do?id=" + $("#id").val() + "&pwd=" + $("#pwd").val();
				}
			});
		});
	</script>
</body>
</html>