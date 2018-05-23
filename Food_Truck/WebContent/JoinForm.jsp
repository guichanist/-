<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<%
 
    request.setCharacterEncoding("UTF-8");
 
%>


<head>

<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=8lsxgt1dtRT5FUhkTnAk&submodules=geocoder"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1">

<!--이홈페이지에 기본적인 디자인으로 bootstrap을 사용하겠다 -->
<link rel="stylesheet" href = "css/bootstrap.css?ver=8">


    <title>회원가입 화면</title>
    
</head>
<body>


<!--네비게이션바  -->
		<nav class="navbar navbar-fixed-top navbar-inverse">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
					aria-expended="false">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<!--로고  -->
				<a class="navbar-brand" href="index.jsp"> 
				<img src="image/로고/홈로고.png" style="width:250px;height: 35px;">
				</a>
			</div>

			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">위치별</a>
						<ul class="dropdown-menu">
							<li><a href="/Food_Truck/tru?command=select&target_no=1">단국대학교</a></li>
							<li><a href="/Food_Truck/tru?command=select&target_no=2">건국대학교</a></li>
							<li><a href="/Food_Truck/tru?command=select&target_no=3">홍익대학교</a></li>
							<li><a href="/Food_Truck/tru?command=select&target_no=4">강남</a></li>
							<li><a href="/Food_Truck/tru?command=select&target_no=5">동대문</a></li>


						</ul></li>
				</ul>

				<ul class="nav navbar-nav">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">음식별</a>
						<ul class="dropdown-menu">
							<li><a href="/Food_Truck/tru?command=select&target_no=6">Main dish</a></li>
		                     <li><a href="/Food_Truck/tru?command=select&target_no=7">Drink</a></li>
		                     <li><a href="/Food_Truck/tru?command=select&target_no=8">Desert</a></li>
						</ul></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
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
				</ul>
			</div>
		</nav>
		<!--네비게이션 바 종료  -->


    <!-- div 왼쪽, 오른쪽 바깥여백을 auto로 주면 중앙정렬된다.  -->

    <div id="wrap" style="padding-top:100px;">

        
        <form method="post" action="./JoinPro.jsp" style="border:5px solid #E8B94D">
            <table>
            	<tr>
     			   <font size="6" color="#E8B94D">회원가입</font>
            	</tr>
                <tr>
                <td id="title">아이디</td>
                    <td>
                        <input type="text" placeholder="아이디" name="id" maxlength="20">
                        <input type="button" style="background-color:#E8B94D;color:white" value="중복확인" >    
                    </td>
                </tr>
                        
                <tr>
                <td id="title">비밀번호</td>
                    <td>
                        <input type="password" placeholder="비밀번호"name="password" maxlength="15">
                    </td>
                </tr>
                
                <tr>
                    <td id="title">비밀번호 확인</td>
                    <td>
                        <input type="password" name="passwordcheck" maxlength="15">
                    </td>
                </tr>
                    
                <tr>
                    <td id="title">이름</td>
                    <td>
                        <input type="text" name="name" maxlength="40">
                    </td>
                </tr>
                    
                <tr>
                    <td id="title">별명</td>
                    <td>
                        <input type="text" name="nick" maxlength="40" >
                        
                    </td>
                </tr>
                    
                <tr>
                    <td id="title">생일</td>
                    <td>
                        <input type="text" name="birthyy" maxlength="4" placeholder="년(4자)" size="6" >
                        <select name="birthmm">
                            <option value="">월</option>
                            <option value="01" >1</option>
                            <option value="02" >2</option>
                            <option value="03" >3</option>
                            <option value="04" >4</option>
                            <option value="05" >5</option>
                            <option value="06" >6</option>
                            <option value="07" >7</option>
                            <option value="08" >8</option>
                            <option value="09" >9</option>
                            <option value="10" >10</option>
                            <option value="11" >11</option>
                            <option value="12" >12</option>
                        </select>
                        <input type="text" name="birthdd" maxlength="2" placeholder="일" size="4" >
                    </td>
                </tr>
                    
                <tr>
                    <td id="title">이메일</td>
                    <td>
                        <input type="text" name="mail1" maxlength="30">@
                        <select name="mail2">
                            <option>naver.com</option>
                            <option>daum.net</option>
                            <option>gmail.com</option>
                            <option>nate.com</option>                        
                        </select>
                    </td>
                </tr>
                    
                <tr>
                    <td id="title">휴대전화</td>
                    <td>
                        <input type="text" name="phone" />
                    </td>
                </tr>
                
            </table>
            <br>
            <input type="submit" style="background-color:#E8B94D;color:white" value="가입"/>  
            <input type="button" style="background-color:#E8B94D;color:white" value="취소">
        </form>
    </div>

</body>

	
	<!-- js파일참조-->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
   
</html>

