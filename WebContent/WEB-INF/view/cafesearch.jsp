<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="kr.ac.skuniv.springmvc.dto.History"%>
<!DOCTYPE html>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<head>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<link href="css/hello.css" rel="stylesheet" type="text/css">
<link href="css/default.css" rel="stylesheet" type="text/css">

<title>Welcome</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link
	href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900"
	rel="stylesheet" />
</head>
<body>
<%
	List<History> historyList = (List<History>) request.getAttribute("historyList");
%>

<div id="popup">
		<div id="popmenu">
				<%
				if (historyList != null) {
					for (History list : historyList) {
				%>
				
				<h3><a href="/detail?search=<%=list.getSearch_food()%>&location=<%=list.getAddress()%>"><%=list.getSearch_food()%></a></h3>
				<h5>&nbsp;-&nbsp;<%=list.getAddress()%>(<%=list.getId()%>)</h5><br>
				<%
					}
				}
				
				%>
			</div>
			<div class="exit">Exit</div>
			<!-- 검색할때마다 DB에 저장하여 기록을 남긴 뒤 여기서 띄워줌 -->
			
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
				<li><a href="/hello" accesskey="1" title="">Restaurant</a></li>
				<li><a href="/cafesearch" accesskey="2" title="">Cafe</a></li>
				<li><a href="#" accesskey="5" id="history">History</a></li>
				<li><a href="/logout" accesskey="7">Logout</a></li>
			</ul>
		</div>
	</div>
</div>
<div id="wrapper2">
	<div class="search__container" align="center">
		<form method="post" action="/caferesult">
			<select id="location" name="location" class="search__input">
				<option value="도봉구">도봉구</option>
				<option value="동대문구">동대문구</option>
				<option value="동작구">동작구</option>
				<option value="은평구">은평구</option>
				<option value="강북구">강북구</option>
				<option value="강동구">강동구</option>
				<option value="강남구">강남구</option>
				<option value="강서구">강서구</option>
				<option value="금천구">금천구</option>
				<option value="구로구">구로구</option>
				<option value="관악구">관악구</option>
				<option value="광진구">광진구</option>
				<option value="종로구">종로구</option>
				<option value="중구">중구</option>
				<option value="중랑구">중랑구</option>
				<option value="마포구">마포구</option>
				<option value="노원구">노원구</option>
				<option value="서초구">서초구</option>
				<option value="서대문구">서대문구</option>
				<option value="송파구">송파구</option>
				<option value="성북구">성북구</option>
				<option value="성동구">성동구</option>
				<option value="양천구">양천구</option>
				<option value="영등포구">영등포구</option>
				<option value="용산구">용산구</option>
			</select><br>
			<input class="search__button" type="submit" value="검색"><br>
		</form>
	</div>
	</div>
</body>
</html>