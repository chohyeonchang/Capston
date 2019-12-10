<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css/default.css" rel="stylesheet" type="text/css">
<link href="css/resultpage.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Sunflower:300&display=swap" rel="stylesheet"/>
<title>Insert title here</title>
</head>
<body>
	<%
		String search = (String) request.getAttribute("search");
		String location = (String) request.getAttribute("location");
	%>
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
		<h2>'<%=location%>'의&nbsp;'<%=search%>'에 대한 검색결과나 리뷰가 없습니다.</h2>
	</div>
	
</body>
</html>