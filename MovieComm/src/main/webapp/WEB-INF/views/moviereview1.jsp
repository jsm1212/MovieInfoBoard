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
      <img src="images\1-1.jfif" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="images\1-2.jfif" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="images\1-3.jfif" class="d-block w-100" alt="...">
    </div>
  </div>
</div>
<div class="info_container">
<div>
<dl>
<dt><h1>특송</h1></dt>
<dd>Special Delivery, 2020</dd>
</dl>
</div>
<div>
<dl>
<dt>개봉</dt>
<dd>2022.01.12</dd>
</dl>
<dl>
<dt>장르</dt>
<dd>범죄/액션</dd>
</dl>
<dt>국가</dt>
<dd>한국</dd>
</dl>
<dt>등급</dt>
<dd>15세이상관람가</dd>
</dl>
</dl>
<dt>상영시간</dt>
<dd>108분</dd>
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
<b>2022년을 여는 가장 짜릿한 범죄 오락 액션의 탄생!</b> <br><br>
예상치 못한 배송사고로 걷잡을 수 없는 사건에 휘말린 <br>
특송 전문 드라이버 ‘은하’. <br>
어쩌다 맡게 된 반송 불가 수하물에 출처를 알 수 없는 300억까지! <br>
경찰과 국정원의 타겟이 되어 <br>
도심 한복판 모든 것을 건 추격전을 벌이게 되는데… <br><br>
<b>NO브레이크! FULL엑셀!</b> <br>
<b>성공률 100% 특송 전문 드라이버가 온다!</b>
</div>
<br>
<hr>
</footer>

</body>
</html>