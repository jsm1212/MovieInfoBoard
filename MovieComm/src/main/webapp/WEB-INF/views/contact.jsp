<%@page import="java.util.List"%>
<%@page import="mul.camp.seven.dto.ContactDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
List<ContactDto> contact = (List<ContactDto>)request.getAttribute("contact");
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
<style>
#search{
	height:38px;
}
#choice{
	height:38px;
}
.btn-success{
	margin-bottom:5px;
}
</style>
<body>
<div align="center">
<h1>문의사항</h1>
</div>
<div align="center">

<hr>



<table class="table table-hover" style="width: 1000px">

<thead>
<tr>
	<th>번호</th><th class="text-center">제목</th><th class="text-right">작성자</th>
</tr>
</thead>

<tbody>
<%
if(contact == null || contact.size() == 0){
	%>
	<tr>
		<td class="text-center" colspan="3">작성된 글이 없습니다</td> 
	</tr>
	<%
}else{
	
	for(int i = 0;i < contact.size(); i++){
		ContactDto contactlist = contact.get(i);
		if(contactlist.getDel() == 0){
	%>
		<tr>	
			<th><%=i+1 %></th>
			<td align="center">
				<a href="contactdetail.do?seq=<%=contactlist.getSeq() %>">
					<%=contactlist.getTitle() %>
				</a>
				<%if(contactlist.getAnswer() != null){ %>
				(답변완료)
				<%} %>
			</td>
			<td align="right"><%=contactlist.getId() %></td>
		</tr>
	<%
		}
	}
}
%>
</tbody>

</table>

</div>

<br><hr><br>  
<div align="center">
	<a href="contactwrite.do"><button class="btn btn-success" type="button">문의하기</button></a>
</div>
<br>
<div align="center">
<select id="choice">
	<option value="title">제목</option>
	<option value="content">내용</option>
	<option value="writer">작성자</option>
</select>

<input type="text" id="search" value="">

<button class="btn btn-success" type="button" onclick="searchContact()">검색</button>
</div>


<script type="text/javascript">
function searchContact() {
	let choice = document.getElementById("choice").value;
	let search = document.getElementById("search").value;
	
	location.href = "contact.do?choice=" + choice + "&search=" + search;
}

</script> 

</body>
</html>