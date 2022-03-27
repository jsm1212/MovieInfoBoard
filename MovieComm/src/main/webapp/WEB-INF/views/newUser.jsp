<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
</head>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<style>
body {
  margin: 0;
  padding: 0;
  background-color: silver;
  height: 100px;
}
#login .container #login-row #login-column #login-box {
  margin-top: 120px;
  max-width: 600px;
  height: 600px;
  border: 1px solid #9C9C9C;
  background-color: #EAEAEA;
}
#login .container #login-row #login-column #login-box #login-form {
  padding: 20px;
}
#login .container #login-row #login-column #login-box #login-form #register-link {
  margin-top: 75px;
}
</style>
<body>
    <div id="login">
        <h3 class="text-center text-white pt-5">MultiCampus Team 7</h3>
        <div class="container">
            <div id="login-row" class="row justify-content-center align-items-center">
                <div id="login-column" class="col-md-6">
                    <div id="login-box" class="col-md-12">
                        <form id="login-form" class="form" action="" method="post">
                            <h3 class="text-center text-info">Welcome To Movie Site!</h3>
                            <div class="form-group">
                                <label for="username" class="text-info">아이디</label><br>
                                <input type="text" name="username" id="username" class="form-control" placeholder="아이디를 입력하세요" required>
                            </div>
                            <div class="form-group">
                                <label for="password" class="text-info">패스워드</label><br>
                                <input type="text" name="password" id="password" class="form-control" placeholder="비밀번호를 입력하세요" required>
                            </div>
                            <div class="form-group">
                                <label for="password2" class="text-info">패스워드 확인</label><br>
                                <input type="text" name="password2" id="password2" class="form-control" placeholder="한번 더 비밀번호를 입력하세요" required>
                            </div>
                            <div class="form-group">
                                <label for="email" class="text-info">이메일</label><br>
                                <input type="email" name="email" id="email" class="form-control" placeholder="email@example.com" required>
                            </div>
                            <div class="form-group">
                                <label for="phone" class="text-info">휴대전화</label><br>
                                <input type="text" name="phone" id="phone" class="form-control" placeholder="전화번호를 입력하세요 ( - 없이)" required>
                            </div>
                            <div id="register-link" class="text-center">
								<button>
									<a class="text-info" href="home" >
										취소하기			
									</a>
								</button>
								<button>
									가입하기
								</button>  
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>