<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.marondal.common.MysqlService" %>
<%@ page import="java.sql.ResultSet" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 목록</title>
</head>
<body>
<%
	MysqlService mysqlService = new MysqlService();

	mysqlService.connect();
	
	ResultSet resultSet = mysqlService.select("SELECT * FROM `new_user` ORDER BY `id` DESC");
%>

	<h3>사용자 목록</h3>
	
	<table border="1">
		<thead>
			<tr>
				<th>이름</th>
				<th>이메일</th>
				<th>자기소개</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>유재석</td>
				<td>yu@gmail.com</td>
				<td>안녕하세요 국민 MC 유재석 입니다.</td>
			</tr>
			<tr>
				<td>조세호</td>
				<td>jo@naver.com</td>
				<td>상당히 반갑습니다!</td>
			</tr>
		</tbody>
	</table>

</body>
</html>