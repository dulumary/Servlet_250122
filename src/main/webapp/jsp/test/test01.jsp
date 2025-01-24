<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Arrays" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 시작</title>
</head>
<body>

	<%
		int[] scores = {80, 90, 100, 95, 80};
		int sum = 0;
		for(int i = 0; i < scores.length; i++) {
			 sum += scores[i];
		}
		
		double average = sum / (double)scores.length;
	%>
	
	<h3>점수 평균은 <%= average %> 입니다.</h3>
	
	<%
		List<String> scoreList = Arrays.asList(new String[]{"X", "O", "O", "O", "X", "O", "O", "O", "X", "O"});
		int score = 100;
		for(String answer:scoreList) {
			if(answer.equals("X")) {
				score -= 100 / scoreList.size();
			}
		}
	%>
	
	<h3>채점 결과는 <%= score %>점 입니다.</h3>
	
	<%!
		// 1부터 n까지의 합을 구하는 기능
		public int sumAll(int number) {
			int sum = 0;
			for(int i = 1; i <= number; i++) {
				sum += i;
			}
			
			return sum;
		}
	%>
	
	<h3>1부터 50까지의 합은 <%= sumAll(50) %></h3>
	

</body>
</html>