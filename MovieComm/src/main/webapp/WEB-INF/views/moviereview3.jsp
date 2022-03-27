<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css" />
<style>
h2{ text-align:center; }
ul { justify-content:center;
	 align-items:center;	
}
main{
	display:flex;
}
.info_container{
	margin-left:20px;
}
.content_container{
	margin-left:50px;
}
h3{
	margin-left:30px;
}
img{
	width:350px;
	height:350px;
}

#carouselExampleSlidesOnly{
	display:flex;
	justify-content:center;
	align-items:center;
	margin-left:200px;
	margin-right:150px;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
<header>
<nav class="navbar navbar-light bg-light">
  <div class="container-fluid">
    <span class="navbar-brand mb-0 h1"><b>영화정보</b></span>
    <ul class="nav">
	<li class="nav-item">
		<a class="nav-link active" aria-current="page" href="home.do">홈</a>
	</li>
	<li class="nav-item">
		<a class="nav-link active" aria-current="page" href="moviereply.do">랭킹</a>
	</li>
	<li class="nav-item">
		<a class="nav-link active" aria-current="page" href="bbslist.do">게시판</a>
	</li>
</ul>
  </div>
</nav>
</header>
<br><br>
<main>
<div id="carouselExampleSlidesOnly" class="carousel slide" data-bs-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="images\3-1.jfif" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="" class="d-block w-100" alt="...">
    </div>
  </div>
</div>
<div class="info_container">
<div>
<dl>
<dt><h1>킹메이커</h1></dt>
<dd>Kingmaker, 2021</dd>
</dl>
</div>
<div>
<dl>
<dt>개봉</dt>
<dd>2022.01.26</dd>
</dl>
<dl>
<dt>장르</dt>
<dd>드라마</dd>
</dl>
<dt>국가</dt>
<dd>한국</dd>
</dl>
<dt>등급</dt>
<dd>15세이상관람가</dd>
</dl>
</dl>
<dt>상영시간</dt>
<dd>123분</dd>
</dl>
</div>
</div>
</main>
<footer>
<br><br>
<h3>영화내용</h3>
<hr>
<div class="content_container">
<br>
세상을 바꾸기 위해 도전하는 정치인 ‘김운범’ 앞에<br>
그와 뜻을 함께하고자 선거 전략가 ‘서창대’가 찾아온다.<br><br>
열세인 상황 속에서 서창대는 아무도 상상하지 못한 선거 전략을 펼치고<br>
‘김운범’은 선거에 연이어 승리하며, 당을 대표하는 대통령 후보까지 올라서게 된다.<br><br>
대통령 선거를 향한 본격적인 행보가 시작되고 그들은 당선을 위해 총력을 기울인다.<br><br>
그러던 중 ‘김운범’ 자택에 폭발물이 터지는 사건이 발생하고<br>
용의자로 ‘서창대’가 지목되면서 둘의 관계는 새로운 국면을 맞이하게 되는데... <br><br>
<b>치열한 선거판,</b><br>
<b>그 중심에 있던 두 남자의 이야기가 시작된다!</b>
</div>
<hr>
</footer>

</body>
</html>