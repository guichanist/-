<%@page import="org.w3c.dom.ranges.DocumentRange"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=8lsxgt1dtRT5FUhkTnAk&submodules=geocoder"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1">

<!--이홈페이지에 기본적인 디자인으로 bootstrap을 사용하겠다 -->
<link rel="stylesheet" href = "css/bootstrap.css?ver=8">


<title>Food Track</title>
</head>


<body>



		<!--네비게이션바 가림막 방지 -->
<div style="height: 51px"></div>
		
		
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
				<img src="image/로고/메인로고.png" style="height: 30px;">
				</a>
			</div>

			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li class="dropdown">
					<a href="#" class="dropdown-toggle"
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


		<!-- 중앙 로고 -->
<div style="height: 300px; text-align: center; padding-top: 30px">
	<img src="image/로고/TRUCK_LOGO.png" style="height: 100%; max-height: 250px;">
</div>




		<!-- 검색창 구현  -->
<script>

function enterkey() {
    if (window.event.keyCode == 13) {

         // 엔터키가 눌렸을 때 실행할 내용
         input();
         document.getElementById("search").reset();
    }
}

var temp=null;

function input(){
   var input = document.getElementById("search").value; 
   temp = input;
   
   if (temp== '단대' ||temp== '단국대학교')
   {
      location.href="/Food_Truck/tru?command=select&target_no=1";
   }
   
   else if (temp== '건대' ||temp== '건국대학교')
   {
      location.href="/Food_Truck/tru?command=select&target_no=2";
   }
   
   else if (temp== '홍대' ||temp== '홍익대학교'||temp== '홍익')
   {
      location.href="/Food_Truck/tru?command=select&target_no=3";
   }
   
   else if (temp== '강남' ||temp== '강남역')
   {
      location.href="/Food_Truck/tru?command=select&target_no=4";
   }
   
   else if (temp== '동대문' ||temp== '동대')
   {
      location.href="/Food_Truck/tru?command=select&target_no=5";
   }
   
   else
   {
      alert("다시 입력해 주세요.");
   }
   
}
</script>

<!-- 검색창  -->
      <div class="input-group"
         style="width: 30%; left: 35%; padding-top: 20px; padding-bottom: 20px;">
         <input type="text"
            style="border: 2px solid #E8B94D;" onkeyup="enterkey();"
            class="form-control" id="search" placeholder="예)단대,홍대,건대,강남,동대문">
         <span class="input-group-btn" style="padding-left: 10px;">
            <button class="btn btn-secondary" type="button"
               style="font-weight:600;background: #E8B94D;" onclick="input()">찾기</button>
         </span>
      </div>
<!-- 검색창 종료 -->




<!--지도 api  -->
<div class="container" id="map" style="width: 50%; height: 250px; inline-block; text-align: center; border: 2px solid #7e1515;">
<script>
		/*초기 위치  */
		var position = new naver.maps.LatLng(37.321547, 127.126943);
		/* 홍대 임의 마커 */
		var hongik_1 = new naver.maps.LatLng(37.55281, 126.924093);
		var hongik_2 = new naver.maps.LatLng(37.551088,126.923144);
		
		 var map = new naver.maps.Map('map', {
		     center: position,
		     zoom: 10
		 });
		 var HOME_PATH = window.HOME_PATH || '.';
		 
		 //마커 모양 크기
		 var markerOptions = {
		          position: position,
		          map: map,
		          icon: {
		              url: HOME_PATH +'/image/marker.png',
		              size: new naver.maps.Size(50, 52),
		              origin: new naver.maps.Point(0, 0),
		              anchor: new naver.maps.Point(25, 26)
		          }
		      };
		 
		 var markerOptions1 = {
		         position: hongik_1,
		         map: map,
		         icon: {
		             url: HOME_PATH +'/image/marker.png',
		             size: new naver.maps.Size(50, 52),
		             origin: new naver.maps.Point(0, 0),
		             anchor: new naver.maps.Point(25, 26)
		         }
		     };
		 var markerOptions2 = {
		         position: hongik_2,
		         map: map,
		         icon: {
		             url: HOME_PATH +'/image/marker.png',
		             size: new naver.maps.Size(50, 52),
		             origin: new naver.maps.Point(0, 0),
		             anchor: new naver.maps.Point(25, 26)
		         }
		     };
		 var marker = new naver.maps.Marker(markerOptions);
		 var marker_1 = new naver.maps.Marker(markerOptions1);
		 var marker_2 = new naver.maps.Marker(markerOptions2);
		 map.addOverlay(marker);
		 map.addOverlay(marker_1);
		 map.addOverlay(marker_2);  
		 
		 	//마커 클릭시 이동
		      var marker = new naver.maps.Marker(markerOptions);
		 naver.maps.Event.addListener(map, 'click', function(e) {
		     marker.setPosition(e.coord);
		 });
		 
		
		 function map_change(temp) {
		     if (temp== '홍대' ||temp== '홍익대학교'||temp== '홍익'){
		     var hong= new naver.maps.LatLng(37.552727,126.924179);
		     	map.setCenter(hong);
		     	map.setZoom(10);
		     }
		 };
		
		 
	</script>
</div>
<!-- 지도 api 종료  -->




	<!-- js파일참조-->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>


</body>
</html>
