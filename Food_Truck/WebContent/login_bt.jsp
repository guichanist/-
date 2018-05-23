<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>여기에 제목을 입력하십시오</title>
</head>
<body>

<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">로그인<span class="carat"></span></a>
						<ul class="dropdown-menu">
							<li id="login">
								<div id="login-content">
									<form>
										<fieldset id="inputs">
											<input id="username" type="text" class="form-control"
												placeholder="아이디" name="userID" maxlength="20"> <input
												id="password" type="password" class="form-control"
												placeholder="비밀번호" name="userPassword" maxlength="20">
										</fieldset>
										<fieldset id="actions">
											<input type="submit" id="submit" value="로그인">
										</fieldset>
										<fieldset id="actions">
											<%@ include file="GoogleLogin/GoogleLogin.jsp"%>
										</fieldset>
										<fieldset id="actions">
											<a href="JoinForm.jsp">회원가입</a>
										</fieldset>
									</form>
								</div>
							</li>
						</ul></li>
</body>
</html>