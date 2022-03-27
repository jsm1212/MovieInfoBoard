<%@page import="org.jsoup.nodes.Element"%>
<%@page import="org.jsoup.select.Elements"%>
<%@page import="org.jsoup.Jsoup"%>
<%@page import="org.jsoup.nodes.Document"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	Document doc = Jsoup.connect("https://movie.naver.com/movie/sdb/rank/rmovie.naver").get();
	Elements El = doc.body().getElementsByClass("title");
	
	int i = 0;
	String[] movie = new String[10];
	for(Element e: El.select("a")){
		movie[i] = e.text();
		i++;
		if(i==10){
			break;
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css" />
<style>
h3{	
	margin-top:50px;
	text-align:center;
}

div{
	margin-top:48px;
}
span{
	display:table-cell;
	text-align:left;
	vertical-align: middle;
}
</style>
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<header>
<nav class="navbar navbar-light bg-light">
  <div class="container-fluid">
  	<span class="navbar-brand mb-0 h1"><b>실시간 영화랭킹 TOP 10</b></span>
    <ul class="nav">
	<li class="nav-item">
		<a class="nav-link active" aria-current="page" href="home.do">홈</a>
	</li>
	<li class="nav-item">
		<a class="nav-link active" aria-current="page" href="bbslist.do">게시판</a>
	</li>
</ul>
  </div>
</nav>
</header>
<div align="center">
<table class="table table-hover" style="width: 1000px">
<thead>
<tr>
	<th>번호</th><th class="text-center">제목</th>
</tr>
</thead>
<tbody>
<%for(int j=0; j<10; j++){ %>
<tr>
	<th><%=j+1%></th>
	<td><%=movie[j]%></td>
</tr>
<%} %>
</tbody>

</table>
</div>
<body>
<h2></h2>
</body>
</html>