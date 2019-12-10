<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="kr.ac.skuniv.springmvc.dto.Food"%>
<%@page import="kr.ac.skuniv.springmvc.dao.FoodMapper"%>
<%@page import="kr.ac.skuniv.springmvc.dto.History"%>
<!DOCTYPE html>
<html>
<head>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3955b4b28824c21ed210a9090f98390d&libraries=services"></script>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/resultpage.css" rel="stylesheet" type="text/css">
<link href="css/default.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Sunflower:300&display=swap" rel="stylesheet">
<link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900" rel="stylesheet" />
</head>
<body>
	<%
		List<Food> foodList = (List<Food>) request.getAttribute("foodList");
		String location = (String) request.getAttribute("location");
		String search = (String) request.getAttribute("search");
		int listSize = (int) request.getAttribute("listSize");
		List<History> historyList = (List<History>) request.getAttribute("historyList");
		List<Integer> foodresultcount = (List<Integer>) request.getAttribute("foodresultcount");
	%>
	
<div id="popup">
		<div id="popmenu">
				<%
				if (historyList != null) {
					for (History list : historyList) {
				%>
				
				<h3><a href="/detail?search=<%=list.getSearch_food()%>&location=<%=list.getAddress()%>"><%=list.getSearch_food()%></a></h3>
				<h5>&nbsp;&nbsp;(<%=list.getAddress()%>)</h5><br>
				<%
					}
				}
				
				%>
			</div>
			<div class="exit">Exit</div>
		</div>

<script>	
$(document).ready(function(){
           $("#history").click(function(){
                 	$("#popup").fadeIn();
                });
                $(".exit").click(function(){
                 	$("#popup").fadeOut();
               	});
});
</script>	
	
<div id="header-wrapper">
	<div id="header" class="container">
		<div id="logo">
			<h1><a>FoodTrip</a></h1>
			<span>in <a rel="nofollow">SEOUL</a></span>
		</div>
		<div id="menu">
			<ul>
				<li><a href="/hello" accesskey="1">뒤로</a></li>
				<li><a href="/hello" accesskey="2">검색</a></li>
				<li><a href="#" accesskey="3" id="history">최근 본 음식점</a></li>
				<li><a href="/chart" accesskey="4">검색기록 차트</a></li>
				<li><a href="/favorite" accesskey="5">즐겨찾기</a></li>
				<li><a href="/logout" accesskey="6">로그아웃</a></li>
			</ul>
		</div>
	</div>
</div>

	<div id="logo">
	<br><br>
		<h2>'<%=location%>'의&nbsp;'<%=search%>' 모범음식점</h2>

	</div>
	
<script type="text/javascript" src="./js/drawingmap.js"></script>
<script type="text/javascript" src="./js/geoLocation.js"></script>
<script>
  	function init(){
     	geoloction();
  	}
  	init();
</script>

<div id="map_canvas" style="width: 335px; height: 350px; float: left; border: solid gray 2px; margin : 30px;"></div>


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
                              content: '<div style="width:150px; text-align:center; padding:6px; font-weight:bold; color:blue;">' + name_search + '</div>'
                          });
                          infowindow.open(map, marker);
                          // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                          map.setCenter(coords);
                          
                      }
                      
                      kakao.maps.event.addListener(marker, 'click', function() {
                          location.href ="detail?search="+name_search+"&location=<%=location%>";
                    });
                      
                      	if(document.getElementById("site_addr_rd")!=null && document.getElementById("name")!=null){
	                      	document.getElementById("site_addr_rd").remove();
	                      	document.getElementById("name").remove();
                      	}
                  });
      }
      function tdclick(index){
    	  var geocoder = new daum.maps.services.Geocoder();
          var addr_search = document.getElementById("site_addr_rd"+index).value;
          var name_search = document.getElementById("name"+index).value;
          
          geocoder.addressSearch(addr_search, function (result, status) {
              if (status === daum.maps.services.Status.OK) {
                  var coords = new daum.maps.LatLng(result[0].y, result[0].x);
          		  map.setCenter(coords);
              }
          });
      }
</script>

	<table class="foodList">
		<tr>
			<th>음식점이름</th>
			<th>주소</th>
		</tr>
		<%
			int index=0;
			if (foodList != null) {
				for (Food list : foodList) {
		%>
		<tr>
			<td><a href="/detail?search=<%=list.getUpso_nm()%>&location=<%=location%>"><%=list.getUpso_nm()%></a></td>
			<td onclick="tdclick(<%=index%>)"><%=list.getSite_addr_rd()%></td>
			<input type="hidden" id="site_addr_rd<%=index%>"
				value="<%=list.getSite_addr_rd()%>">
			<input type="hidden" id="name<%=index%>"
				value="<%=list.getUpso_nm()%>">
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

<script type="text/javascript">
$(function() {
    $('.foodList td').mouseover(function(){
       $(this).addClass('selectedRow');
    }).mouseout(function() {
       $(this).removeClass('selectedRow');
    });
 });
</script>	

<div style="width: 335px; height: 325px; float: left; margin-left:30px; background-color:white; border: 2px solid gray;">
		<canvas id="myChart"></canvas>
</div>

<script>
var ctx = document.getElementById("myChart").getContext('2d');

var total = <%=foodresultcount.get(0).intValue()%> + <%=foodresultcount.get(1).intValue()%> + <%=foodresultcount.get(2).intValue()%>
				+<%=foodresultcount.get(3).intValue()%>+<%=foodresultcount.get(4).intValue()%>

var myChart = new Chart(ctx, {
    type: 'pie',
    data: {
        labels: ["한식","중국식","일식","경양식","기타",
					],
        datasets: [{
            label: "검색",
            data: [Math.round((<%=foodresultcount.get(0).intValue()%>/total)*100), Math.round((<%=foodresultcount.get(1).intValue()%>/total)*100),Math.round((<%=foodresultcount.get(2).intValue()%>/total)*100),
            	Math.round((<%=foodresultcount.get(3).intValue()%>/total)*100),Math.round((<%=foodresultcount.get(4).intValue()%>/total)*100),
            	],
            backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',           
            ],
            borderColor: [
            	   'rgba(255, 99, 132, 1)',
                   'rgba(54, 162, 235, 1)',
                   'rgba(255, 206, 86, 1)',
                   'rgba(75, 192, 192, 1)',
                   'rgba(153, 102, 255, 1)',
            ],
            borderWidth: 1,
        }]
    },
    options: {
    	title:{
    		display: true,
    		text : "분류별 모범음식점 현황(%)",
    		position : 'bottom',
    		fontColor : "black",
    		fontSize : 27,
    		fontFamily : "Sunflower",
    		padding : 20,
    		fontStyle : 'bold',
    	},
    	legend: {
    		labels:{				// lable 설정
    			fontColor: "black",
    			fontSize: 15,
    			fontFamily : "Sunflower",
    			fontStyle : 'bold',
    			padding : 20,
    			fontStyle : 'bold',
    		}
    	},
        maintainAspectRatio: true, 
        scales: {
            yAxes: [{
                ticks: {			// y축 설정
                	display : false,
                }
            }],
            xAxes: [{
        		ticks: {			// x축 설정
        			display : false,
        		}            	
            }]                                    
        }
    }
});
</script>	
	
</body>
</html>

	