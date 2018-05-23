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
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<!--로고  -->
			<a class="navbar-brand" href="index.jsp">
				<img src="image/로고/홈로고.png" style="width:250px;height: 35px;">
			</a>	
		</div>
		
	<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
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

				
				</ul>
			</li>
		</ul>
							
		<ul class="nav navbar-nav"> 
			<li class="dropdown">
				<a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">음식별</a>
				<ul class="dropdown-menu">
					<li><a href="/Food_Truck/tru?command=select&target_no=6">Main dish</a></li>
		            <li><a href="/Food_Truck/tru?command=select&target_no=7">Drink</a></li>
		            <li><a href="/Food_Truck/tru?command=select&target_no=8">Desert</a></li>
				</ul>				
			</li>
		</ul>
		<ul class= "nav navbar-nav navbar-right">
			<li class="dropdown">
					<a href="#" class="dropdown-toggle"
						data-toggle = "dropdown" role = "button" aria-haspopup="true"
						aria-expanded="false">로그인<span class="carat"></span></a>
					<ul class="dropdown-menu">
					<li id="login" >
    				<div id="login-content">
       				<form >
       				   <fieldset id="inputs" >
           					 <input id="username" type="text" class="form-control" placeholder="아이디" name="userID" maxlength="20">   
           					 <input id="password" type="password" class="form-control" placeholder="비밀번호" name="userPassword" maxlength="20">
         			   </fieldset>
          				<fieldset id="actions">
         				   <input type="submit" id="submit" value="로그인" >
         			    </fieldset>
         			    <fieldset id="actions">
         				    <%@ include file="GoogleLogin/GoogleLogin.jsp" %>
         			    </fieldset>
         			    <fieldset id="actions">
         				  <a href="JoinForm.jsp">회원가입</a>
         			    </fieldset>
      			    </form>
   				  </div>                     
  			  </li>
			</ul>
		</li>
	</ul>
	</div>
</nav>
<!--네비게이션 바 종료  -->	

<!--네비게이션바 패딩 주기.  -->
<div style="height:30px;"></div>


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

<!-- 검색창 종료  -->
<!-- search-bar 시작 -->
      <div class="input-group"
         style="width:25%; padding-bottom:15px">
         <input type="text"
            style="border: 2px solid #E8B94D;" onkeyup="enterkey();"
            class="form-control" id="search" placeholder="예)단대,홍대,건대,강남,동대문">
         <span class="input-group-btn" style="padding-left: 10px;">
            <button class="btn btn-secondary" type="button"
               style="font-weight:600;background: #E8B94D;" onclick="input()">찾기</button>
         </span>
      </div>
<!-- search-bar 종료 -->
		
		
 <!--지도 api  -->	
	<div class="container" id="map" style="width:100%;  height:500px;inline-block;text-align: center;border: 2px solid #7e1515;"> 
	 
	<script>
	/* request 객체값 받기  */
	
	var truckName = [
        <%
           String[] truckName = (String[]) request.getAttribute("truckname");      
           for(int i=0; i<truckName.length; i++) {
              out.println("'"+truckName[i]+"',");
           }
        %>
     ];
	
	var truckNo = [
         <%
            String[] truckNo = (String[]) request.getAttribute("truckno");      
            for(int i=0; i<truckNo.length; i++) {
               out.println("'"+truckNo[i]+"',");
            }
         %>
      ];
	
	var truckLat = [
			<%
				String[] truckLat = (String[]) request.getAttribute("trucklat");		
				for(int i=0; i<truckLat.length; i++) {
					out.println("'"+truckLat[i]+"',");
				}
			%>
		];

	var truckLong = [
			<%
				String[] truckLong = (String[]) request.getAttribute("trucklong");
				for(int i=0; i<truckLong.length; i++) {
					out.println("'"+truckLong[i]+"',");
				}
			%>
		];
	
	var locationLat = [
		<%
			String[] locationLat = (String[]) request.getAttribute("locationlat");		
			for(int i=0; i<locationLat.length; i++) {
				out.println("'"+locationLat[i]+"',");
			}
		%>
	];

	var locationLong = [
		<%
			String[] locationLong = (String[]) request.getAttribute("locationlong");
			for(int i=0; i<locationLong.length; i++) {
				out.println("'"+locationLong[i]+"',");
			}
		%>
	];
	
	var truckphoto = [
	      <%
	         String[] truckphoto = (String[]) request.getAttribute("truckphoto");
	         for(int i=0; i<truckphoto.length; i++) {
	            out.println("'"+truckphoto[i]+"',");
	         }
	      %>
	   ];
	
	/*초기 위치 */
	   var HOME_PATH = window.HOME_PATH || '.';
	    
	    var map = new naver.maps.Map('map', {
	        center: new naver.maps.LatLng(locationLat[0], locationLong[0]),
	        zoom: 10
	    });
	   
	   
	    var markers = [];
	    var infoWindows=[];
	    
	    
	    //마커 모양 크기
	    for (var i = 0; i <truckLat.length; i++ ) 
	    {
	       // 위도 경도 동적으로 받기
	       var position = new naver.maps.LatLng(
	           truckLat[i], truckLong[i]);

	       var marker = new naver.maps.Marker({
	           map: map,
	           position: position,
	           icon: {
	               url: HOME_PATH +'/image/marker.png',
	               size: new naver.maps.Size(50, 52),
	                anchor: new naver.maps.Point(25, 26),
	               origin: new naver.maps.Point(0,0)
	              },
	          });
	    
	       // 마커 클릭시 이벤트 
	       
	         var contentString = [
	           	 '<div class="iw_inner">'+
	              '   <h5 style="color:#E8B94D;font-weight:700;">'+truckName[i]+'</h5>'+
	              '<DIV style="border-top:1px solid; border-bottom:2px groove black; border-left:1px solid; border-right:2px groove black;margin-bottom:1px;color:black;background-color:white; width:auto; height:auto;">'+
	        	 '<span style="color: #000000 !important;display: inline-block;font-size: 12px !important;font-weight:bold !important;letter-spacing: -1px !important;white-space: nowrap !important; padding: 2px 2px 2px 2px !important">' +
	        	 '<DIV><img src="'+truckphoto[i]+'" width="100" height="100">'+ '</div>' +
	              '<form method="post" action="/Food_Truck/tru?command=select2&target_no='+truckNo[i]+' align = "center"> <input type="hidden" name="target_title""소개소개소개<br/><input type="submit" style="background-color:white;color:#E8B94D" value="상세정보"></DIV>'
	       		  +'<span></div>'
	          ].join('');
	         
	      var infoWindow = new naver.maps.InfoWindow({
	         content: contentString,
	          maxWidth: 140,
	          backgroundColor: "#fff",
	          borderColor: "#E8B94D",
	          borderWidth: 5,
	          anchorSize: new naver.maps.Size(30, 30),
	          anchorSkew: true,
	          anchorColor: "#eee",
	          pixelOffset: new naver.maps.Point(20, -20)
	          });
	       markers.push(marker);
	       infoWindows.push(infoWindow);
	    }
	    
	    naver.maps.Event.addListener(map, 'idle', function() {
	        updateMarkers(map, markers);
	    });

	    function updateMarkers(map, markers) {

	        var mapBounds = map.getBounds();
	        var marker, position;

	        for (var i = 0; i < markers.length; i++) {

	            marker = markers[i]
	            position = marker.getPosition();

	            if (mapBounds.hasLatLng(position)) {
	                showMarker(map, marker);
	            } else {
	                hideMarker(map, marker);
	            }
	        }
	    }

	    function showMarker(map, marker) {

	        if (marker.setMap()) return;
	        marker.setMap(map);
	    }

	    function hideMarker(map, marker) {

	        if (!marker.setMap()) return;
	        marker.setMap(null);
	    }

	    // 해당 마커의 인덱스를 seq라는 클로저 변수로 저장하는 이벤트 핸들러를 반환합니다.
	    function getClickHandler(seq) {
	        return function(e) {
	            var marker = markers[seq],
	                infoWindow = infoWindows[seq];

	            if (infoWindow.getMap()) {
	                infoWindow.close();
	            } else {
	                infoWindow.open(map, marker);
	            }
	        }
	    }

	    for (var i=0, ii=markers.length; i<ii; i++) {
	        naver.maps.Event.addListener(markers[i], 'click', getClickHandler(i));
	    }

	    function map_change(temp) 
	      {
	           if (temp== '홍대' ||temp== '홍익대학교'||temp== '홍익')
	           {
	              var hong= new naver.maps.LatLng(37.552727,126.924179);
	              map.setCenter(hong);
	              map.setZoom(10);
	           }
	           
	           
	           else if (temp== '단대' ||temp== '단국대학교')
	          {
	             var hong= new naver.maps.LatLng(37.3203690, 127.1288260);
	            map.setCenter(hong);
	            map.setZoom(10);
	          }
	          
	             
	           else if (temp== '건대' ||temp== '건국대학교')
	          {
	             var hong= new naver.maps.LatLng(37.5402090, 127.0731570);
	             map.setCenter(hong);
	             map.setZoom(10);
	          }
	          
	           else if (temp== '동대문' ||temp== '동대')
	          {
	             var hong= new naver.maps.LatLng(37.5718160, 127.0113760);
	            map.setCenter(hong);
	            map.setZoom(10);
	          }
	          
	           else if (temp== '강남' ||temp== '강남역')
	          {
	            var hong= new naver.maps.LatLng(37.4973860, 127.0240040);
	             map.setCenter(hong);
	            map.setZoom(10);
	          }
	           
	           else 
	           {
	             alert("다시 입력해 주세요.");
	           }
	                   
	       };

	   </script>
	   </div>
<!-- 지도 api 종료 -->



<!-- 사진 테이블 -->

<div class="row" style="padding-bottom:10px;padding-top:10px">
<c:forEach var="tru" items="${requestScope.list}">
<div class="col-md-3 col-sm-6 mb-4" style="text-align:center;padding-top:30px">
      <a href="/Food_Truck/tru?command=select2&target_no=${tru.truck_no}"><img src="${tru.truck_photo }"></a>
      <h4 style="color:#E8B94D;font-weight:900;">${tru.truck_name}</h4>

    
   </div>
</c:forEach>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</body>
</html>﻿