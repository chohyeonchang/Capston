<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="kr.ac.skuniv.springmvc.dto.History"%>
<%@page import="kr.ac.skuniv.springmvc.dto.Member"%>
<%@page import="kr.ac.skuniv.springmvc.dao.MemberMapper"%>
<!DOCTYPE html>
<html>
<head>
<link href="css/hello.css" rel="stylesheet" type="text/css">
<link href="css/default.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Sunflower:300&display=swap" rel="stylesheet"/>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String id = (String) request.getAttribute("id");
	Member member = (Member) request.getAttribute("member");
	List<History> historyList = (List<History>) request.getAttribute("historyList");

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
				<li><a href="/hello" accesskey="1">검색</a></li>
				<li><a href="#" accesskey="2" id="history">최근 본 음식점</a></li>
				<li><a href="/chart" accesskey="3">검색기록 차트</a></li>
				<li><a href="/favorite" accesskey="4">즐겨찾기</a></li>
				<li><a href="/logout" accesskey="5">로그아웃</a></li>
			</ul>
		</div>
	</div>
</div>

	<div id="wrapper2" align="center">
	<br>
		<h2>UPDATE MEMBER</h2>
		<br>
		<form action="updatecheck" method="post">
			<label>이름 : </label><input type="text" id="name" name="name" value="<%=member.getName() %>"/><br>
			<label>이메일 : </label><input type="email" id="email" name="email" value="<%=member.getEmail() %>" /><br>
			<label>비밀번호 : </label><input type="password" id="password" name="password" value="<%=member.getPassword() %> "/><br><br>
			<input class="button" type="submit" value="정보수정" /><br><br>
			<input class="button" type="button" onClick="location.href='hello'" value="취소"/>
		</form>
		</div>
</body>
</html>