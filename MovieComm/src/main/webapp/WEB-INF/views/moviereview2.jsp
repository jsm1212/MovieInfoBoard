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
img{
	width:350px;
	height:350px;
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
      <img src="images\2-1.jfif" class="d-block w-100" alt="...">
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
<dt><h1>씽2게더</h1></dt>
<dd>Sing2, 2021</dd>
</dl>
</div>
<div>
<dl>
<dt>개봉</dt>
<dd>2022.01.05</dd>
</dl>
<dl>
<dt>장르</dt>
<dd>애니메이션</dd>
</dl>
<dt>국가</dt>
<dd>미국</dd>
</dl>
<dt>등급</dt>
<dd>전체관람가</dd>
</dl>
</dl>
<dt>상영시간</dt>
<dd>110분</dd>
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
<b>전 세계가 주목한 스테이지! 함께 도전할 준비됐지?</b> <br><br>
대국민 오디션 이후 각자의 자리에서 꿈을 이루고 있는 버스터 문(매튜 맥커너히)과 크루들에게 레드 쇼어 시티에서 전 세계<br>
가 주목하는 사상 최고의 쇼가 펼쳐진다는 소식이 들려오고 버스터 문과 크루들은 도전에 나선다. <br><br>
그러나 최고의 스테이지에 서기 위한 경쟁은 이전과는 비교도 할 수 없을 만큼 치열하고, 버스터 문은 완벽한 라이브를 위해 <br>
종적을 감춘 레전드 뮤지션 클레이(보노)를 캐스팅하겠다는 파격 선언을 하는데!<br><br>

</div>
<hr>
</footer>

</body>
</html>