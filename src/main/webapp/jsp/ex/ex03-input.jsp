<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Post input</title>
</head>
<body>

	<form method="get" action="/jsp/ex/ex03.jsp">
		<label>닉네임 : </label><input type="text" name="nickname">
		
		<h3>좋아하는 동물을 하나 고르세요</h3>
		<label for="dogRadio">강아지</label><input type="radio" id="dogRadio" value="dog" name="animal">
		<label for="catRadio">고양이</label><input type="radio" id="catRadio" value="cat" name="animal">
		<label for="lionRadio">사자</label><input type="radio" id="lionRadio" value="lion" name="animal">
		
		<h3>좋아하는 과일을 하나 고르세요</h3>
		<select name="fruit">
			<option value="banana">바나나</option>
			<option value=strawberry>딸기</option>
			<option value="peach">복숭아</option>
		</select>
		
		<h3>좋아하는 음식을 모두 고르세요</h3>
		<label for="mintCheck">민트초코</label> <input type="checkbox" id="mintCheck" name="food" value="mint">
		<label for="pizzaCheck">하와이안피자</label><input type="checkbox" id="pizzaCheck" name="food" value="pizza">
		<label for="bugCheck">번데기</label><input type="checkbox" id="bugCheck" name="food" value="bug">
		
		
		<button type="submit">입력</button>
	</form>

</body>
</html>