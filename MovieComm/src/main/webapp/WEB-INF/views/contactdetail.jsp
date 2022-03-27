<%@page import="mul.camp.seven.dto.MemberDto"%>
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
<style>
h1{
	text-align:center;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
<h1>문의내용</h1>

<div align="center">

<table class="table table-bordered" style="width: 1000px">
<tr>
	<th>작성자</th>
	<td><%=contact.getId() %></td>
</tr>

<tr>
	<th>제목</th>
	<td><%=contact.getTitle() %></td>
</tr>

<tr>
	<th>작성일</th>
	<td><%=contact.getWdate() %></td>
</tr>

<tr>
	<th>내용</th>
	<td align="center">
		<textarea rows="15" cols="100" readonly="readonly"><%=contact.getContent() %></textarea>
	</td>
</tr>
</table>
<%
	MemberDto mem = (MemberDto)request.getSession().getAttribute("login");
%>

<%
	if(mem.getId().equals(contact.getId())) {
%>
	<button class="btn btn-success" type="button" onclick="updatecontact(<%=contact.getSeq() %>)">수정하기</button>
	<button class="btn btn-success" type="button" onclick="deletecontact(<%=contact.getSeq() %>)">삭제하기</button>
<%
}
%>
<%if(mem.getAuth()==1){%>
	<button class="btn btn-success" type="button" onclick="answercontact(<%=contact.getSeq()%>)">답변하기</button>
<%} %>
</div>
<hr>
<%if(contact.getAnswer() != null) {%>
<div align="center">
	<h1>문의답변</h1>
	<table class="table table-bordered" style="width: 1000px">
		<tr>
			<th>작성자</th>
			<td>관리자</td>
		</tr>
		<tr>
			<th>내용</th>
			<td align="center">
				<textarea rows="15" cols="100" readonly="readonly"><%=contact.getAnswer() %></textarea>
			</td>
		</tr>
	</table>
</div>
<%} %>
<script>
function answercontact( seq ) {
	location.href = "contactanswer.do?seq=" + seq;
} 

function updatecontact( seq ) {
	location.href = "updatecontact.do?seq=" + seq;
}

function deletecontact( seq ) {
	if(confirm("정말 삭제하시겠습니까?")) {
		alert("삭제되었습니다.");
		/* #21# deletebbs.do에서 deletecontact.do로 변경 */
		location.href = "deletecontact.do?seq=" + seq;
	}
}
</script>
</body>
</html>