<%@page import="org.jsoup.nodes.Element"%>
<%@page import="org.jsoup.select.Elements"%>
<%@page import="org.jsoup.Jsoup"%>
<%@page import="org.jsoup.nodes.Document"%>
<%@page import="mul.camp.seven.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
MemberDto mem = (MemberDto)request.getSession().getAttribute("login");
%>   
<!-- jsoup 크롤링 -->
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
<!doctype html>
<html lang="ko">
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		
		
		<link rel="stylesheet" type="text/css" href="css/home.css" />
		
		<script type="text/javascript" src="js/home.js"></script>
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
		<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
		<style type="text/css">
		#container{
			background-image: url("image/background.jpg");
			background-size: cover;
		}
		.title{
			float: center;
		}
		.login-input-section-wrap{
		margin:100px;
		padding:30px;
			flex-direction: column;
			align-items: center;
			float: right;
			border: 4px solid #9C9C9C;
		}
		.input-section-wrap{
			margin:0 50px 0 0;
			padding:20px;
			flex-direction: column;
			align-items: center;
			float: right;
			border: 4px solid #9C9C9C;
		}
		.login-input-wrap{
			width: 465px;
			height :48px;
			
		}
		
		.img-size {
       	  width: 400px;
          height: 600px;
          border-radius: 20px;
		  text-align: center;
		  margin: 0 0 20px 40px;
		  }
		  
		 .white-color{
		 color: white;
		 font-style: italic;
		 }
		 .event{
		 width: 700px;
		 height: 450px;
		 margin:20px 0 0px 40px;
		 border-radius: 20px;
		 }
		 .movie-list{
		 width: 500px;
		 float: left;
		 }
		.list-line{
		border: 4px solid white;
		padding: 5px;
		font-weight: bold
		}
		.real-event{
		 width: 700px;
		 height: 450px;
		 margin:20px 0 0px 40px;
		 border-radius: 50%;
		  margin-bottom: -500px;
		}
		.btn btn-info btn-md{
		
		}
				
		</style>
		
		<title>Movie Site</title>
	</head>
	<body id="container">
	<header>
	<iframe src="//ad.cgv.co.kr/NetInsight/html/CGV/CGV_201401/main@TopBar_EX" width="100%" height="80" title="" frameborder="0" scrolling="no" topmargin="0" 
	leftmargin="0" marginwidth="0" marginheight="0" name="TopBanner" id="TopBanner"></iframe>
	</header>
	<div>
		<!-- <a><img class="img-size" alt="sitemap" src="image/movieview.png"></a> -->
	</div>
	<body>
		<div>
			<div>
				<div>
					<a href="bbslist.do"><button type="button" class="btn btn-secondary">자유게시판</button></a>
					<a href="moviereply.do"><button type="button" class="btn btn-secondary">실시간 순위</button></a>
					<a href="contact.do"><button type="button" class="btn btn-secondary">문의사항</button></a>
				</div>
			</div>
		</div>
	</body>
	<hr>
	
		<aside>
				<div class="login-input-section-wrap">
				<div><%=mem.getNickname()%>님 환영합니다!</div>
				<a href="mypage.do"><button class="btn btn-info btn-md">마이페이지</button></a>
				</div>
		</aside>
	<body>
		<div>
		<h1 class="white-color">　　현재 상영작 </h1>
		<a href="moviereview1.do"><img class="img-size" alt="004" src="image/004.jpg" ></a>
		<a href="moviereview2.do"><img class="img-size" alt="02" src="image/02.jpg"></a>
		<a href="moviereview3.do"><img class="img-size" alt="003" src="image/003.jpg"></a>
		</div>
		<hr>
		<div class="input-section-wrap">
			<div>
				<h3 style="font-weight: bold">실시간 영화 순위</h3>
				<%for(int j=0; j<10; j++){ %>
				<p class="list-line"><%=j+1%>　.　<%=movie[j]%></p>
				<!-- <p class="list-line">2　.　해적</p>
				<p class="list-line">3　.　킹메이커</p>
				<p class="list-line">4　.　특송</p>
				<p class="list-line">5　.　싱2게더</p>
				<p class="list-line">6　.　어나더 라운드</p>
				<p class="list-line">7　.　비욘드라이브 더 무비</p>
				<p class="list-line">8　.　하우스 오브 구찌</p>
				<p class="list-line">9　.　웨스트 사이드 스토리</p>
				<p class="list-line">10　.　블루버스데이</p> -->
				<%} %>
			</div>
			</div>
			<div>
				<a href="https://www.youtube.com/watch?v=yFZh-Wqi7RI" target="_blank">
				<img class="event" alt="spyder1"src="image/spyder1.jpg">
				</a>
				<a href="https://www.youtube.com/watch?v=sGVFJSYQHJk" target="_blank">
				<img class="event" alt="kingmaker"src="image/kingmaker.jpg">
				</a>
			</div>
			<div>
						<br>
						<hr>
						<br>
				<img class="real-event" alt="event1"src="image/event1.png">
				<img class="real-event" alt="event2"src="image/event2.png">
			</div>
		</body>
		<footer>
				<jsp:include page="./footer.jsp"></jsp:include>
		</footer>
	</body>
</html>

