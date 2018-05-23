<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    
<%@ page import="jsp.member.model.MemberBean" %>  
 
<html>
<head>

<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=8lsxgt1dtRT5FUhkTnAk&submodules=geocoder"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1">

<!--이홈페이지에 기본적인 디자인으로 bootstrap을 사용하겠다 -->
<link rel="stylesheet" href = "css/bootstrap.css?ver=3">



    <title>회원가입 처리 JSP</title>
   
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
	
    <%-- JoinForm.jsp에서 입력한 정보를 넘겨 받아 처리한다. --%>
    <%
 
    request.setCharacterEncoding("UTF-8");
 
%>


    <%-- 자바빈 관련 액션태그 사용 --%>
    <jsp:useBean id="memberBean" class="jsp.member.model.MemberBean" />
    <jsp:setProperty property="*" name="memberBean"/>    
    
    <div id="wrap">
        <br><br>
        <b><font size="5" color="#E8B94D">회원가입 정보를 확인하세요.</font></b>
        <br><br>
        <font color="blue"><%=memberBean.getName() %></font>님 가입을 축하드립니다.
        <br><br>
        
        <%-- 자바빈에서 입력된 값을 추출한다. --%>
        <table>
            <tr>
                <td id="title">아이디</td>
                <td><%=memberBean.getId() %></td>
            </tr>
                        
            <tr>
                <td id="title">비밀번호</td>
                <td><%=memberBean.getPassword() %></td>
            </tr>
                    
            <tr>
                <td id="title">이름</td>
                <td><%=memberBean.getName() %></td>
            </tr>
                    
            <tr>
                <td id="title">별명</td>
                <td><%=memberBean.getnick()%></td>
            </tr>
                    
            <tr>
                <td id="title">생일</td>
                <td>
                    <%=memberBean.getBirthyy() %>년 
                    <%=memberBean.getBirthmm() %>월 
                    <%=memberBean.getBirthdd() %>일
                </td>
            </tr>
                    
            <tr>
                <td id="title">이메일</td>
                <td>
                    <%=memberBean.getMail1() %>@<%=memberBean.getMail2() %>
                </td>
            </tr>
                    
            <tr>
                <td id="title">휴대전화</td>
                <td><%=memberBean.getPhone() %></td>
            </tr>
            <tr>

        </table>
        
        <br>
        <input type="button" style="background-color:#E8B94D;color:white" value="확인">
    </div>
</body>

	<!-- js파일참조-->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
   
   
</html>



