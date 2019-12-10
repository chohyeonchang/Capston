<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="kr.ac.skuniv.springmvc.dto.Cafe"%>
<%@page import="kr.ac.skuniv.springmvc.dao.CafeMapper"%>
<!DOCTYPE html>
<html>
<head>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3955b4b28824c21ed210a9090f98390d&libraries=services"></script>

<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/resultpage.css" rel="stylesheet" type="text/css">
<link href="css/default.css" rel="stylesheet" type="text/css">
<link
	href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900"
	rel="stylesheet" />

</head>
<body>
	<%
		List<Cafe> cafeList = (List<Cafe>) request.getAttribute("cafeList");
		String location = (String) request.getAttribute("location");
		int listSize = (int) request.getAttribute("listSize");
	%>
<div id="header-wrapper">
	<div id="header" class="container">
		<div id="logo">
			<h1><a>FoodTrip</a></h1>
			<span>in <a rel="nofollow">SEOUL</a></span>
		</div>
		<div id="menu">
			<ul>
				<li><a href="cafesearch" accesskey="0">Back</a></li>
				<li><a href="/hello" accesskey="1" title="">Restaurant</a></li>
				<li><a href="/cafesearch" accesskey="2" title="">Cafe</a></li>
				<li><a href="#" accesskey="5" id="history">History</a></li>
				<li><a href="/logout" accesskey="7">Logout</a></li>
			</ul>
		</div>
	</div>
</div>

	<div id="logo">
		<h2><a>Cafe Search Result for&nbsp;<u>(<%=location%>)</u></a></h2>
	</div>
	
<script type="text/javascript" src="./js/drawingmap.js"></script>
<script type="text/javascript" src="./js/geoLocation.js"></script>
<script>
  	function init(){
     	geoloction();
  	}
  	init();
</script>

<div id="map_canvas" style="width: 600px; height: 400px; float: left;"></div>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3955b4b28824c21ed210a9090f98390d&libraries=services"></script>

<script>
      function GoMap(index) {
          //주소-좌표 변환 객체를 생성
                  var geocoder = new daum.maps.services.Geocoder();
                  var addr_search = document.getElementById("site_addr_rd"+index).value;
                  var name_search = document.getElementById("name"+index).value;

                  geocoder.addressSearch(addr_search, function (result, status) {
                      // 정상적으로 검색이 완료됐으면
                      if (status === daum.maps.services.Status.OK) {
                          var coords = new daum.maps.LatLng(result[0].y, result[0].x);
                          // 결과값으로 받은 위치를 마커로 표시합니다
                          var marker = new daum.maps.Marker({
                              map: map,
                              position: coords
                          });
                          // 인포윈도우로 장소에 대한 설명을 표시합니다
                          var infowindow = new daum.maps.InfoWindow({
                              content: '<div style="width:150px;text-align:center;padding:6px 0;">' + name_search + '</div>'
                          });
                          infowindow.open(map, marker);
                          // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                          map.setCenter(coords);
                      }
                      
                      
                      	if(document.getElementById("site_addr_rd")!=null && document.getElementById("name")!=null){
	                      	document.getElementById("site_addr_rd").remove();
	                      	document.getElementById("name").remove();
                      	}
                  });
      } 
</script>

	<div id="wrapper2">
	<table>
		<tr>
			<th>업소이름</th>
			<th>주소</th>			
		</tr>
		<%
			int index=0;
			if (cafeList != null) {
				for (Cafe list : cafeList) {
		%>
		<tr>
			<td><%=list.getName()%></td>
			<td><%=list.getAddress()%></td>
			<input type="hidden" id="site_addr_rd<%=index%>"
				value="<%=list.getAddress()%>">
			<input type="hidden" id="name<%=index%>"
				value="<%=list.getName()%>">
		</tr>
		
		<script>
				for(var i=0; i<=<%=listSize%>; i++){
					GoMap(<%=index%>);
				}
		</script>
		<%
				index++;
				}
			}
		%>
	</table>
	
</div>
<div id="wrapper2">
	<div id="welcome" class="container">
		<div class="title">
			<h2>Welcome to my website</h2>
		</div>
		<p>My website&nbsp;&nbsp;offers a variety of food information.</p><br>
		<strong>Have a nice day :)</strong>
	</div>
</div>

	
</body>
</html>

	