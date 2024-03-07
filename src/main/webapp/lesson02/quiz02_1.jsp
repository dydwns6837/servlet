<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quiz02_1</title>
</head>
<body>
	<h1> 현재시간은
	<%= request.getParameter("time") %> 입니다.
	</h1>
	
	<h1> 현재날짜는
	<%= request.getParameter("date") %> 입니다.
	</h1>
</body>
</html>