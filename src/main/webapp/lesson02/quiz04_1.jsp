<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>길이 변환</title>
</head>
<body>
	<h1>길이 변환 결과</h1>
	<%
		int lengthChange = Integer.parseInt(request.getParameter("lengthChange"));
		out.print(lengthChange + "cm");
		String[] lengthArr = request.getParameterValues("length");
		
	%>
	<hr>
	<%	
		if (lengthArr != null) {
			for (int i = 0; i < lengthArr.length; i++) {
				if (lengthArr[i].equals("in")) {
					double length = lengthChange * 0.393701;
					out.print(length + " " +lengthArr[i]+ "<br>");
				} else if (lengthArr[i].equals("yd")) {
					double length = lengthChange * 0.0109361;
					out.print(length + "<br>");
				} else if (lengthArr[i].equals("ft")) {
					double length = lengthChange * 0.0328084;
					out.print(length + "<br>");
				} else if (lengthArr[i].equals("m")) {
					double length = lengthChange * 0.01;
					out.print(length);
				} 
			} 
		}
	%>
</body>
</html>