<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/default.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/fonts.css" rel="stylesheet" type="text/css" media="all" />
<link href="https://fonts.googleapis.com/css?family=Sunflower:300&display=swap" rel="stylesheet"/>
</head>
<body>
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
					<li><a href="/" accesskey="0">뒤로</a></li>
					<li><a href="/hello" accesskey="1">검색</a></li>
				</ul>
			</div>
		</div>
	</div>
	<div id="wrapper2" align="center">
	<br>
		<h3>회원가입</h3>
		<br>
		
		<form action="memberInsert" method="post">
			<input type="text" name="id" placeholder="아이디 입력"/><br>
			<input type="text" name="name" placeholder="이름 입력"/><br> 
			<input type="email" name="email" placeholder="이메일 입력"/><br>
			<input type="password" name="password" placeholder="비밀번호 입력"/><br><br><br> <input class="button" type="submit"
				value="회원가입" /><br><br>
			<input class="button" type="button" onClick="location.href='/'" value="취소">
		</form>
</div>
</body>
</html>