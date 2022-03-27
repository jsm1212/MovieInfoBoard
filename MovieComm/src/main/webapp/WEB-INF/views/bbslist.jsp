<%@page import="mul.camp.seven.dto.BbsDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%!
// 답글의 depth 와 image를 추가해 주는 함수
// depth 1 = ' '-> 
// depth 2 = '  '->
public String arrow(int depth){
	String res = "<img src='image/arrow.png' width='20px' height='20px' />";
	String nbsp = "&nbsp;&nbsp;&nbsp;&nbsp;";	// 여백
	
	String ts = "";
	for(int i = 0;i < depth; i++){
		ts += nbsp;
	}
	
	return depth==0?"":ts + res;
}
%>

<%
List<BbsDto> bbslist = (List<BbsDto>)request.getAttribute("bbslist");
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

<!-- <h1>bbslist</h1>
<h1>로그인 성공! 😊<h1> -->

<div align="center">

<hr>
<select id="choice">
	<option value="title">제목</option>
	<option value="content">내용</option>
	<option value="writer">작성자</option>
</select>

<input type="text" id="search" value="">

<button type="button" onclick="searchBbs()">검색</button>

<br><hr><br>  

<!--   attribute  property   -->
<table class="table table-hover" style="width: 1000px">
<!-- <col width="30"><col width="200"><col width="80"> -->

<thead>
<tr>
	<th>번호</th><th>제목</th><th>정보</th><th>작성자</th>
</tr>
</thead>

<tbody>
<%
if(bbslist == null || bbslist.size() == 0){
	%>
	<tr>
		<td colspan="3">작성된 글이 없습니다</td> 
	</tr>
	<%
}else{
	
	for(int i = 0;i < bbslist.size(); i++){
		BbsDto bbs = bbslist.get(i);
	%>
		<tr>	
			<th><%=i+1 %></th>
			<td>
				<%=arrow(bbs.getDepth()) %>
				<a href="bbsdetail.do?seq=<%=bbs.getSeq() %>">
					<%=bbs.getTitle() %>
				</a>
			</td>
			<td><%=bbs.getRef() %>-<%=bbs.getStep() %>-<%=bbs.getDepth() %></td>
			<td align="center"><%=bbs.getId() %></td>
		</tr>
	<%
	}
}
%>
</tbody>
</table>
</div>
<br>
<div align="center">
	<a href="bbswrite.do">글쓰기</a>
</div>

<!-- 
<script type="text/javascript">
location.href = "bbslist.do"; -> GET
</script>
 -->

<script type="text/javascript">
function searchBbs() {
	let choice = document.getElementById("choice").value;
	let search = document.getElementById("search").value;
	
	location.href = "bbslist.do?choice=" + choice + "&search=" + search;
}

</script> 

</body>
</html>