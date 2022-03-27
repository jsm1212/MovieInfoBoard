<%@page import="mul.camp.seven.dto.ContactDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ContactDto contact = (ContactDto)request.getAttribute("contact");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>

</style>
</head>
<body>
<h1 align="center">글 수정</h1>

<div align="center">
<form id="frm" action="contactupdate.do" method="post">

<input type="hidden" name="seq" id="seq" value="<%=contact.getSeq() %>">

<table class="table table-bordered" style="width: 1000px">
<tr>
	<th>아이디</th>
	<td>
		<input type="text" name="id" size="70px" value="<%=contact.getId() %>" readonly="readonly">
	</td>	
</tr>
<tr>
	<th>제목</th>
	<td>
		<input type="text" name="title" id="title" size="70px" value="<%=contact.getTitle()%>">
	</td>
</tr>
<tr>
	<th>내용</th>
	<td>
		<textarea rows="20" cols="80" name="content" id="content"><%=contact.getContent()%></textarea>
	</td>
</tr>
<tr align="center">
	<td colspan="2">
		<button class="btn btn-success" type="button" onclick="contactupdate()">수정하기</button>
	</td>
</tr>

</table>
</form>
</div>


<!-- <script>
	function contactupdate( seq ) {
		location.href="bbsupdate.do?seq" + seq;
	}
</script> -->
<script type="text/javascript">
function contactupdate() {
	
	if($("#title").val() == ''){
		alert('글의 제목을 입력해주세요');
	}
	else if($("#content").val() == ''){
		alert('글의 내용을 입력해주세요');
	}
	else {
		$("#frm").submit();
		alert("수정되었습니다.")
	}
}
</script>

</body>
</html>