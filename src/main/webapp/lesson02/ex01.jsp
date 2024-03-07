<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp</title>
</head>
<body>
	<!-- html의 주석: 소스보기에서 보임-->
	<%-- jsp의 주석: 소스보기에서 보이지 않음 --%>
	
	<%
		// java 문법 시작
		// scriptlet
		
		int sum = 0;
		for (int i = 1; i <= 10; i++) {
			sum += i;
		}
	%>
	
	<b>합계:</b>
	<input type="text" value="<%= sum %>">
	
	<%!
		// 선언문 - 클래스 같은 느낌 field나 method 간단한 거 가능
		
		// field
		private int num = 100;
		
		// method
		public String getHelloWorld() {
			return "Hello World";
		}
	%>
	
	<br>
	<%= num + 200 %>
	<br>
	<%= getHelloWorld() %>
	
	<!-- 1번 -->
	<%!
		public int sigma(int N) {
			int sum = 0;
			for (int i = 1; i <= N; i++){
				sum += i;
			} return sum;
		} 
	%>
	<br>
	<%= "1부터 50까지의 합은" + sigma(50) + "입니다." %>
	
	<!-- 2번 -->
	<% int[] scores = {81, 90, 100, 95, 80}; 
		int sum1 = 0;
		for (int i = 0; i < scores.length; i++) {
			sum1 += scores[i];
		}  
	%>
	<br> <%= "평균 점수는" + (double)sum1 / scores.length + " 입니다." %>
	
	<!-- 3번 -->
	<!-- import 단축키: import 하고싶은곳 뒤에 커서를 두고 ctrl + space -->
	<%
	List<String> scoreList = Arrays.asList(new String[]{"X", "O", "O", "O", "X", "O", "O", "O", "X", "O"});
	int count = 0;
	for (int i = 0; i < scoreList.size(); i++) {
		if (scoreList.get(i).equals("O") == true) {
			count += 100 / scoreList.size();
		}
	}
	%>
	<br> <%= "채점 결과는" + count + "점입니다." %>
	<!-- 4번 -->
	<% String birthDay = "20010820"; 
		String year = birthDay.substring(0, 4);
		int age = 2024 - Integer.parseInt(year);
	%>
	<br> <%= age %>
</body>
</html>