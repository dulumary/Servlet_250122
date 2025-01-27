<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
</head>
<body>

<%
	int cm = Integer.parseInt(request.getParameter("cm"));

	// 	변환할 단위 모두
	// 인치, 피트, 야드, 미터
	// inch, feet, yard, meter
	
	String[] units = request.getParameterValues("unit");
	
	String result = "";
	
	for(int i = 0; i < units.length; i++) {
		
		if(units[i].equals("inch")) {
			double inch = cm * 0.39;
			result += inch + "in<br>";
		} else if(units[i].equals("feet")) {
			double yard = cm * 0.010936133;
			result += yard + "ft<br>";
		} else if(units[i].equals("yard")) {
			double feet = cm * 0.032808399;
			result += feet + "yd<br>";
		} else if(units[i].equals("meter")) {
			double meter = cm / 100.0;
			result += meter + "m<br>";
		}
	}
	
%>

	<div class="container">
		<h1>변환결과</h1>
		<h3><%= cm %>cm</h3>
		<hr>
		<h3>
			<%= result %>
		</h3>
	</div>

	<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
</body>
</html>