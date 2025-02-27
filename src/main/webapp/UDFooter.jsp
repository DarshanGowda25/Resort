<%@page import="com.MVC.Model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
footer {
	height: auto;
	width: 100%;
	z-index: 100;
	background-color: #efefef;
	margin-top: 30px;
	cursor: pointer;
}

.footer-container * {
	all: unset;
	display: revert;
	font-family: inherit;
}

.footer-container {
	height: 80px;
	width: 100%;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
}

.footer-container .part1 {
	height: 50%;
	width: 100%;
	display: flex;
	flex-direction: row;
	justify-content: center;
	align-items: center;
	font-size: smaller;
	color: #4D4D4F;
}

.footer-container .part1 * {
	text-decoration: none;
	padding-left: 10px;
	padding-right: 10px;
	border-left: 1px solid gray;
}

.footer-container .part1 p:first-of-type {
	border-left: none;
}

.footer-container .part2 {
	height: 50%;
	width: 100%;
	display: flex;
	flex-direction: row;
	justify-content: center;
	align-items: center;
	color: #4D4D4F;
	font-size: smaller;
}

.footer-container .part2 * {
	text-decoration: none;
	padding-left: 10px;
	padding-right: 10px;
}

.footer-container .part2 .AdminLogin a {
	text-transform: none;
	color: #D1AE6c;
}
</style>
<body>
	<div class="footer-container">
		<div class="part1">
			<p>HERITAGE GOLF & RESORT SPA</p>
			<p>RESERVATION CONTACT : +91-8310592220</p>
		</div>
		<div class="part2">
			<p>© 2020 Heritage Golf Resorts and Spa</p>
			<a href="">PRIVACY & COOKIE POLICY</a> <a href="">TERMS &
				CONDITION</a>
				

			<div class="AdminLogin">
		
				<p>
					Employe :<a href="adminLogin.jsp">login!</a>
				</p>
			
			</div>


		</div>
</body>
</html>