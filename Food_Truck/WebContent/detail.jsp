<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=8lsxgt1dtRT5FUhkTnAk&submodules=geocoder"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1">

<!--이홈페이지에 기본적인 디자인으로 bootstrap을 사용하겠다 -->
<link rel="stylesheet" href = "css/bootstrap.css?ver=8">

<title>푸드트랙 임시페이지</title>
</head>

<body>
<!--네비게이션바 가림막 방지 -->



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
            id="bs-example-navbar-collapse-1" >
            <ul class="nav navbar-nav">
               <li class="dropdown"><a href="#" class="dropdown-toggle"
                  data-toggle="dropdown" role="button" aria-haspopup="true"
                  aria-expanded="false">위치별</a>
                  <ul class="dropdown-menu">
                     <li><a href="/Food_Truck/tru?command=select">단국대학교</a></li>
                     <li><a href="/Food_Truck/tru?command=select">건국대학교</a></li>
                     <li><a href="/Food_Truck/tru?command=select">홍익대학교</a></li>
                     <li><a href="/Food_Truck/tru?command=select">강남</a></li>
                     <li><a href="/Food_Truck/tru?command=select">동대문</a></li>

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

<div class="row" style="padding-top:50px;">
   <!--트럭 사진 테이블  -->
   <div class="col-md-6" style="height:540px">
      <img class="img-fluid_Truck" src=" ${requestScope.truckphoto}">
   </div>
   <!-- 소개 및 메뉴 테이블  -->
   <div  class="col-md-6">
      <!-- 트럭이름 -->
      <div style="font-size:25px;color:#E8B94D;font-weight:900;padding-bottom:10px;">
         ${requestScope.truckname} 
      </div>
      <!-- 소개 -->
      <div >
         ${requestScope.truckintro}
      </div>
      
      <div style="font-size:25px;color:red;font-weight:900;padding-bottom:10px;padding-bottom:10px;padding-top:10px;">
         MENU
      </div>
      
       <div>
       <div class="row">
      <c:forEach var="tru2" items="${requestScope.list}">
       
         <!-- 메뉴들 -->
            <div class="col-md-6 mb-4">
               <img class="img-fluid_Menu" style="border: 2px solid #E8B94D"src="${tru2.menu_photo }">
               <p><font size="2em" color="red">${tru2.menu_name}</font>: ${tru2.menu_price}</p>
               <%-- <p><font size="2em" color="black"></font></p> --%>  
            </div>
         
      </c:forEach>
      </div>
      </div> 
      
   </div>
</div>


<div class="row" style="padding-top:10px">
   <div class="col-md-6">
      <div style="font-size:25px;color:#E8B94D;font-weight:900;padding-bottom:10px;">
         리뷰
      </div>
      <div>
         별점댓글
      </div>
   </div>
   <div class="col-md-6">
      <div style="font-size:25px;color:#E8B94D;font-weight:900;padding-bottom:10px;">
         찾아 오시는 길
      </div>
      <div class="container" id="map" style="width:100%;  height:250px;   inline-block;   text-align: center;border: 2px solid #7e1515;">
      </div>
</div>



<script>
      /*푸드트럭 위치  */
      var position = new naver.maps.LatLng(
         ${requestScope.trucklat}, ${requestScope.trucklong});
    	/* 홍대 임의 마커 */
      
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

       var marker = new naver.maps.Marker(markerOptions);

       map.addOverlay(marker);
   </script>
</div>



<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</body>
</html> 