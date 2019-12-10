<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="kr.ac.skuniv.springmvc.dto.Food"%>
<%@page import="kr.ac.skuniv.springmvc.dao.FoodMapper"%>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<link
	href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900"
	rel="stylesheet" />
<link href="css/default.css" rel="stylesheet" type="text/css"
	media="all" />
<link href="css/fonts.css" rel="stylesheet" type="text/css" media="all" />
<link
	href="https://fonts.googleapis.com/css?family=Sunflower:300&display=swap"
	rel="stylesheet">
<title>Insert title here</title>
</head>
<body>
	<%
		List<Integer> addresscount = (List<Integer>) request.getAttribute("addresscount");
		List<String> rankinglist = (List<String>) request.getAttribute("rankinglist");
	%>

	<div id="header-wrapper">
		<div id="header" class="container">
			<div id="logo">
				<h1>
					<a>FoodTrip</a>
				</h1>
				<span>in <a rel="nofollow">SEOUL</a></span>
			</div>
			<div id="menu">
				<ul>
					<li><a href="/hello" accesskey="1">검색</a></li>
					<li><a href="/chart" accesskey="2">검색기록 차트</a></li>
					<li><a href="/favorite" accesskey="3">즐겨찾기</a></li>
				</ul>
			</div>
		</div>
	</div>
	<br>
	<br>
	<br>
	<div style="width: 800px; height: 350px; float: left">
		<canvas id="myChart" width="800px" height="500px"></canvas>
	</div>

	<script>
		var ctx = document.getElementById("myChart").getContext('2d');

		var myChart = new Chart(ctx, {
			type : 'bar',
			data : {
				labels : [ "강남구", "강동구", "강북구", "강서구", "관악구", "광진구", "구로구",
						"금천구", "노원구", "도봉구", "동대문구", "동작구", "마포구", "서대문구",
						"서초구", "성동구", "성북구", "송파구", "양천구", "영등포구", "용산구",
						"은평구", "종로구", "중구", "중랑구" ],
				datasets : [ {
					label : "검색횟수",
					data : [
	<%=addresscount.get(0).intValue()%>
		,
	<%=addresscount.get(1).intValue()%>
		,
	<%=addresscount.get(2).intValue()%>
		,
	<%=addresscount.get(3).intValue()%>
		,
	<%=addresscount.get(4).intValue()%>
		,
	<%=addresscount.get(5).intValue()%>
		,
	<%=addresscount.get(6).intValue()%>
		,
	<%=addresscount.get(7).intValue()%>
		,
	<%=addresscount.get(8).intValue()%>
		,
	<%=addresscount.get(9).intValue()%>
		,
	<%=addresscount.get(10).intValue()%>
		,
	<%=addresscount.get(11).intValue()%>
		,
	<%=addresscount.get(12).intValue()%>
		,
	<%=addresscount.get(13).intValue()%>
		,
	<%=addresscount.get(14).intValue()%>
		,
	<%=addresscount.get(15).intValue()%>
		,
	<%=addresscount.get(16).intValue()%>
		,
	<%=addresscount.get(17).intValue()%>
		,
	<%=addresscount.get(18).intValue()%>
		,
	<%=addresscount.get(19).intValue()%>
		,
	<%=addresscount.get(20).intValue()%>
		,
	<%=addresscount.get(21).intValue()%>
		,
	<%=addresscount.get(22).intValue()%>
		,
	<%=addresscount.get(23).intValue()%>
		,
	<%=addresscount.get(24).intValue()%>
		],
					backgroundColor : [ 'rgba(255, 99, 132, 1)',
							'rgba(54, 162, 235, 1)', 'rgba(255, 206, 86, 1)',
							'rgba(75, 192, 192, 1)', 'rgba(153, 102, 255, 1)',
							'rgba(255, 159, 64, 1)', 'rgba(255, 99, 132, 1)',
							'rgba(54, 162, 235, 1)', 'rgba(255, 206, 86, 1)',
							'rgba(75, 192, 192, 1)', 'rgba(153, 102, 255, 1)',
							'rgba(255, 159, 64, 1)', 'rgba(255, 159, 64, 1)',
							'rgba(255, 99, 132, 1)', 'rgba(54, 162, 235, 1)',
							'rgba(255, 206, 86, 1)', 'rgba(75, 192, 192, 1)',
							'rgba(153, 102, 255, 1)', 'rgba(255, 159, 64, 1)',
							'rgba(255, 159, 64, 1)', 'rgba(255, 159, 64, 1)',
							'rgba(255, 99, 132, 1)', 'rgba(54, 162, 235, 1)',
							'rgba(255, 206, 86, 1)', 'rgba(75, 192, 192, 1)'

					],
					borderColor : [ 'rgba(255, 99, 132, 3)',
							'rgba(54, 162, 235, 3)', 'rgba(255, 206, 86, 2)',
							'rgba(75, 192, 192, 2)', 'rgba(153, 102, 255,2)',
							'rgba(255, 159, 64, 2)', 'rgba(255, 99, 132, 2)',
							'rgba(54, 162, 235, 2)', 'rgba(255, 206, 86, 2)',
							'rgba(75, 192, 192, 2)', 'rgba(153, 102, 255,2)',
							'rgba(255, 159, 64, 2)', 'rgba(255, 159, 64, 2)',
							'rgba(255, 99, 132, 2)', 'rgba(54, 162, 235, 2)',
							'rgba(255, 206, 86, 2)', 'rgba(75, 192, 192, 2)',
							'rgba(153, 102, 255,2)', 'rgba(255, 159, 64, 2)',
							'rgba(255, 159, 64, 2)', 'rgba(255, 159, 64, 2)',
							'rgba(255, 99, 132, 2)', 'rgba(54, 162, 235, 2)',
							'rgba(255, 206, 86, 2)', 'rgba(75, 192, 192, 2)' ],
					borderWidth : 2,
					showLine : true,
				} ]
			},
			options : {
				responsive : false,
				title : {
					display : true,
					text : "사용자 검색 현황",
					position : 'bottom',
					fontColor : "black",
					fontSize : 20,
					fontFamily : "Sunflower",
					padding : 40,
				},
				legend : {
					labels : { // lable 설정
						fontColor : "black",
						fontSize : 11,
						fontFamily : "Sunflower",
						fontStyle : 'bold',
					}
				},
				maintainAspectRatio : true,
				scales : {
					yAxes : [ {
						ticks : { // y축 설정
							fontColor : "black",
							fontSize : 12,
							beginAtZero : true,
							max : 100,
							stepSize : 10,

						}
					} ],
					xAxes : [ {
						ticks : { // x축 설정
							fontColor : "black",
							fontSize : 11,
							fontFamily : "Sunflower",
							fontStyle : 'bold',
						}
					} ]
				}
			}
		});
	</script>

<div style="float:right; margin-right:100px;">
		<table style="text-align : center; width : 300px; height: 400px; border-collapse : collapse; font-weight : bold; color : Black; border : 2px solid gray;">
			<tr>
				<th>맛집랭킹 Top 10</th>
			</tr>
			<%
				int i=0;
				if (rankinglist != null) {
					for (String list : rankinglist) {
			%>

			<tr>
				<td>(<%=i+1%>위) <%=list.toString()%></td>
			</tr>
				
			<%
				i++;
				}
			}
			%>
		</table>
</div>

</body>
</html>