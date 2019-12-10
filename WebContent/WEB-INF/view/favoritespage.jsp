<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="kr.ac.skuniv.springmvc.dto.History"%>
<%@page import="kr.ac.skuniv.springmvc.dto.Favorites"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/detailpage.css" rel="stylesheet" type="text/css">
<link href="css/default.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Sunflower:300&display=swap" rel="stylesheet">
</head>
<body>
<%
	String id = (String) request.getAttribute("id");
	List<History> historyList = (List<History>) request.getAttribute("historyList");
	List<Favorites> favoritesList = (List<Favorites>) request.getAttribute("favoritesList");
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
				<li><a href="/hello" accesskey="1">뒤로</a></li>
				<li><a href="/hello" accesskey="2">검색</a></li>
				<li><a href="#" accesskey="3" id="history">최근 본 음식점</a></li>
				<li><a href="/favorites" accesskey="4">즐겨찾기</a></li>
				<li><a href="/logout" accesskey="5">로그아웃</a></li>
			</ul>
		</div>
	</div>
</div>

<div id="wrapper2">
	<div id="logo">
	<br><br>
		<h2>
			'<%=id%>'님의 즐겨찾기
		</h2>
		<br>
	</div>
		<table class="favoritesList">
			<tr>
				<th>이름</th>
				<th>주소</th>
			</tr>
			<%
			if (favoritesList != null) {
				for (Favorites list : favoritesList) {
		%>
			
			<tr>
				<td><a href="/detail?search=<%=list.getName()%>&location=<%=list.getAddress()%>"><%=list.getName()%></a></td>
				<td><%=list.getAddress()%></td>
			</tr> 
			<%
				}
			}
		%>
		</table>
		</div>
		
<script type="text/javascript">
$(function() {
    $('.favoritesList td').mouseover(function(){
       $(this).addClass('selectedRow');
    }).mouseout(function() {
       $(this).removeClass('selectedRow');
    });
 });
</script>		
</body>
</html>