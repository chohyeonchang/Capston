<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="kr.ac.skuniv.springmvc.dto.Food"%>
<%@page import="kr.ac.skuniv.springmvc.dto.History"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<link href="css/detailpage.css" rel="stylesheet" type="text/css">
<link href="css/default.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Sunflower:300&display=swap" rel="stylesheet"> 

<title>Insert title here</title>
</head>
<%
	String search = request.getParameter("search");
	String location = (String) request.getAttribute("location");
	List<Food> foodList = (List<Food>) request.getAttribute("foodList");
	List<History> historyList = (List<History>) request.getAttribute("historyList");
	List<String> titleList = (List<String>) request.getAttribute("titleList");
	List<String> descriptionList = (List<String>) request.getAttribute("descriptionList");
%>
<body>

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
				<h1>
					<a>FoodTrip</a>
				</h1>
				<span>in <a rel="nofollow">SEOUL</a></span>
			</div>
			<div id="menu">
				<ul>
					<li><a href="/hello" accesskey="1">검색</a></li>
					<li><a href="#" accesskey="2" id="history">최근 본 음식점</a></li>
					<li><a href="/chart" accesskey="3">검색기록 차트</a></li>
					<li><a href="/favorite" accesskey="4">즐겨찾기</a></li>
					<li><a href="/logout" accesskey="5">로그아웃</a></li>
				</ul>
			</div>
		</div>
	</div>
	<br><br><br><br>
		<table>
			<%
			if (foodList != null) {
				for (Food list : foodList) {
			%>	
			
			<tr>
				<th>주소</th>
				<td><%=list.getSite_addr_rd()%></td>
			</tr>
			<tr>
				<th>메인음식</th>
				<td><%=list.getMain_edf()%></td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><%=list.getUpso_site_telno()%></td>
			</tr>
			<tr>
				<th>길찾기</th>
				<td>
				<input type="button" class="button2" value="길찾기" onClick="location.href='https://map.kakao.com/link/search/<%=list.getUpso_nm()%>'"></td>
			</tr>
			<tr>
				<th>즐겨찾기에 추가</th>
				<td>
				<input type="button" class="button2" value="즐겨찾기" onClick="location.href='/addfavorites?name=<%=search%>&address=<%=location%>'">
				</td>
			</tr>
					 
			<%
				}
			}
		%>
		</table>
		<br>
			
		<div id="logo">
		<br>
			<h2>'<%=search%>'에 대한 리뷰</h2><br>
		</div>
		<table>
			<tr>
				<th>리뷰</th>
			</tr>
			
			<%
				for(int i=0; i<titleList.size(); i++)
				{
			%>
				<tr>
					<td><h2><%=titleList.get(i)%></h2><br>
					<%=descriptionList.get(i)%></td>
				</tr>

			<%
				}
			%>
		</table>

</body>
</html>