<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900" rel="stylesheet" />
<link href="css/default.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/fonts.css" rel="stylesheet" type="text/css" media="all" />
<link href="https://fonts.googleapis.com/css?family=Sunflower:300&display=swap" rel="stylesheet"/>

</head>
<body>
<div id="header-wrapper">
	<div id="header" class="container">
		<div id="logo">
			<h1><a>FoodTrip</a></h1>
			<span>in <a rel="nofollow">SEOUL</a></span>
		</div>
		<div id="menu">
			<ul>
				<li><a href="/hello" accesskey="1">검색</a></li>
			</ul>
		</div>
	</div>
</div>




<div align="center" id="wrapper2">
	<br>
	<h3>로그인 및 회원가입</h3><br><br><br><br>
	<form action="logincheck" method="post">
		<input type="text" name="id" placeholder="아이디 입력"><br><br>
		<input type="password" name="password" placeholder="비밀번호 입력"/><br><br><br>
		<input class="button" type="submit" value="로그인" /><br><br>
		<input class="button" type="button" onClick="location.href='register'" value='회원가입'></button>
	</form>

</div>
</body>
</html>
