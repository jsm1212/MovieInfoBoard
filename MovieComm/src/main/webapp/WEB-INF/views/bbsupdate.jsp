<%@page import="mul.camp.seven.dto.MemberDto"%>
<%@page import="mul.camp.seven.dto.BbsDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	BbsDto bbs = (BbsDto)request.getAttribute("bbs");

	MemberDto mem = (MemberDto)request.getSession().getAttribute("login");
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

</head>
<body>

<h1>게시글 수정</h1>

<div align="center">
<h1>부모글</h1>

<form id="frm" action="update.do" method="post">

<!-- seq 번호를 form을 통하여 같이 전달, 보이지 않게 하기 위하여 hidden 타입 사용 -->
<input type="hidden" name="seq" value="<%=bbs.getSeq() %>">


<table class="table table-bordered" style="width: 1000px">
<tr>
	<th>작성자</th>
	<td><%=bbs.getId() %></td>
</tr>

<tr>
	<th>제목</th>
	<td><input type="text" name="title" id="title" size="70px" value="<%=bbs.getTitle() %>"></td>
</tr>

<tr>
	<th>작성일</th>
	<td><%=bbs.getWdate() %></td>
</tr>

<tr>
	<th>내용</th>
	<td align="center">
		<textarea rows="15" cols="100" id=content name=content><%=bbs.getContent() %></textarea>
	</td>
</tr>
<tr>
	<td colspan="2">
		<input type="submit" value="수정">
	</td>
</tr>



</table>

</form>

</div>

</body>
</html>