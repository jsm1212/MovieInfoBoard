<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.apache.commons.lang3.time.DateFormatUtils"%>
<%@page import="java.util.Date"%>
<%@page import="mul.camp.seven.dto.MemberDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- MemberController loginAf.do에서 저장해둔 사용자 정보 가져오기 -->   
<%
	MemberDto user = (MemberDto)request.getSession().getAttribute("login");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyPage</title>

<style type="text/css">
.boardIcon {
	width: 90%;
	margin: 10px auto;
	display: flex;
}

.qna {
	flex: 1;
	width: 50%;
	box-sizing: border-box;
}

.review {
	flex: 1;
	margin: 0px 5% 5% 5%;
	width: 45%;
	box-sizing: border-box;
}

.free {
	flex: 1;
	width: 50%;
	box-sizing: border-box;
}

</style>

<!-- jqeury, bootstrap 사용을 위해 code 추가 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</head>
<body>
	<div class="container">
		<div class="input-form-background row">
			<div class="input-form col-md-12 mx-auto">
				<h4 class="mb-3">마이페이지</h4>
				<br>
				<!-- 회원정보 -->
				<form id="frm" action="userEdit.do" method="post">
					<div class="row">
					
						<div class="col-md-6 mb-3">
							<label for="id">아이디</label>
							<input type="text" class="form-control" name="id" id="id" value="<%=user.getId() %>" readonly="readonly">
						</div>
						
						<div class="col-md-6 mb-3">
							<label for="nickname">닉네임</label>
							<input type="text" class="form-control" name="nickname" id="nickname" value="<%=user.getNickname() %>" readonly="readonly">
						</div>
						
						<div class="col-md-6 mb-3">
							<label for="name">이름</label>
							<input type="text" class="form-control" name="name" id="name" value="<%=user.getName() %>" readonly="readonly">
						</div>
						
						<div class="col-md-6 mb-3">
							<label for="age">나이</label>
							<input type="text" class="form-control" name="age" id="age" value="<%=user.getAge() %>" readonly="readonly">
						</div>
					
					</div>
					
					<div class="mb-3">
						<label for="gender">성별</label>
						<br>
						<% if( user.getGender() == 0 ) { 
						%>
						<input type="radio" name="gender" id="gender" value=0 checked="checked">남자
						<input type="radio" name="gender" id="gender" value=1>여자
						<% } else { %>
						<input type="radio" name="gender" id="gender" value=0>남자
						<input type="radio" name="gender" id="gender" value=1 checked="checked">여자
						<% } %>
					</div>
					
					<div class="mb-3">
						<label for="email">이메일</label>
						<input type="email" class="form-control" name="email" id="email" value="<%=user.getEmail() %>" readonly="readonly">
					</div>
					
					<div class="mb-3">
						<label for="regi_date">가입날짜</label>
						<%
							Date date = new Date();
							String dateToStr = DateFormatUtils.format(user.getRegi_date(), "yyyy-MM-dd");
						%>
						<input type="text" class="form-control" name="regi_date" id="regi_date" value="<%=dateToStr %>" readonly="readonly">
					</div>
					
					<div class="mb-3"></div>
					<input class="btn btn-outline-success" type="submit" value="회원정보 수정">
					<button class="btn btn-outline-warning" type="button" onclick="changePwd()">비밀번호 변경</button>
					<button class="btn btn-secondary" type="button" onclick="logout()">로그아웃</button>
				</form>
				
				<br><br><br>
				
				
				<div class="boardIcon">
					<div>
						문의내역 <br>
						<a href="contact.do?choice=writer&search=<%=user.getId() %>">
							<img class="qna" src="image/question.png">
						</a>
					</div>
					<%-- <div>
						<p>영화리뷰</p> <br>
						<a href="moviereply.do?choice=writer&search=<%=user.getId() %>">
							<img class="review" src="image/reviewboard.png">
						</a>
					</div> --%>
					<div>
						자유게시판 <br>
						<%-- <a href="moviebbs.do?choice=writer&search=<%=user.getId() %>"> --%>
						<a href="bbslist.do?choice=writer&search=<%=user.getId()%>">
							<img class="free" src="image/freeboard.png">
						</a>
					</div>

				</div>
				
				<br><br><br>
				
			</div>
		</div>
	</div>


<script type="text/javascript">
/* 비밀번호 변경 */
function changePwd() {
	location.href = "changePwd.do";
}

/* 로그아웃 */
function logout() {
	if(confirm("로그아웃 하시겠습니까?") ==  true) {
		location.href = "logout.do";
	}
	else {
		alert("로그아웃을 취소하였습니다.");
		return false;
	}
}
</script>

</body>
</html>