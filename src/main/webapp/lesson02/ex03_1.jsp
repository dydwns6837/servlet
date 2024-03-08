<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결과</title>
</head>
<body>
	<%
		String nickname = request.getParameter("nickname");
		String hobby = request.getParameter("hobby");
		String animal = request.getParameter("animal");
		String fruit = request.getParameter("fruit");
		String[] foodArr = request.getParameterValues("food"); // 선택 항목이 여러개 일때
	%>
	
	<table border="1">
		<tr>
			<th>별명</th>
			<td><%= nickname %></td>
		</tr>
		<tr>
			<th>취미</th>
			<td><%= hobby %></td>
		</tr>
		<tr>
			<th>선호하는 동물</th>
			<td><%= animal %></td>
		</tr>
		<tr>
			<th>선호하는 음식</th>
			<td>
				<%	// 향상된 for 문
				// 500 error 서버 에러, null 일 때 for 문을 돌리게되면 서버에러가남.
					if (foodArr != null) {
						String result = "";
						for (String food : foodArr) {
							result += food + ",";
						}
						// 민트초코,하와이안 피자,번데기, <- 마지막 , 없애는 알고리즘
						// 예) abc => ab 추출 substring(0, 3 - 1)
						result = result.substring(0, result.length() - 1);
						out.print(result);
					}
				%>
			</td>
		</tr>
		<tr>
			<th>좋아하는 과일</th>
			<td><%= fruit %></td>
		</tr>
	</table>
</body>
</html>