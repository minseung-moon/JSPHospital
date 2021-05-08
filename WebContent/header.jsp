<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>정보처리산업기사</title>
<style>
	* {
		margin : 0;
		padding : 0;
		box-sizing : border-box;
	}
	a {
		text-decoration: none;
		color : #000;
	}
	ul {
		list-style: none;
	}
	table {
		border-collapse: collapse;
		text-align: center;
		margin : 0 auto;
	}
	table, th, td {
		border: 1px solid #000;
	}
	table td {
		padding : 5px 10px;
	}
	
	header, footer {
		text-align: center;
		background-color: #e06960;
	}
	header h1, footer {
		padding : 25px 0;
	}
	header ul {
		background-color: #d6918b;
		display: flex;
	}
	header li a {
		display: inline-block;
		padding : 5px 10px;
	}
	
	#main {
		padding : 15px 0;
		min-height: 90vh;
	}
	#main h2 {
		text-align: center;
	}
</style>
</head>
<body>
	<header>
		<h1>(과정평가형 정보처리산업기사)진단검사 프로그램 Ver 2020-04</h1>
		<nav>
			<ul>
				<li><a href="./selectPatient.jsp">환자조회</a></li>
				<li><a href="./insertResult.jsp">검사결과 입력</a></li>
				<li><a href="./selectResult.jsp">검사결과 조회</a></li>
				<li><a href="./selectCityResult.jsp">지역별 검사건수</a></li>
				<li><a href="./index.jsp">홈으로</a></li>
			</ul>
		</nav>
	</header>	
</body>
</html>