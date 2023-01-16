<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp/0804practice.jsp</title>
</head>
<body>
	<h1>0804practice.jsp</h1>
	
	<fieldset>
	<form action="0804practice2.jsp" method="post">
	
	
	이름 : <input type="text" name="name" value=""placeholder="이름을 입력하세요"><br>
	전화번호 : <input type="text" name="tel" value="" ><br>
	비밀번호 : <input type="password" name="pass"><br>
	성별 : <input type="radio" name="gender" value="남">남자
		  <input type="radio" name="gender" value="여">여자<br>
		  <input type="submit" value="전송하기"><br>
		  
	취미 : <input type="checkbox" name="hobby" value="게임"> 게임
		  <input type="checkbox" name="hobby" value="운동"> 요리
		  <input type="checkbox" name="hobby" value="베이킹"> 베이킹<br>
		  
	강의장 : <select name="num">
			<option value = "">강의장을 선택하시오</option>
			<option value = "1">강의장1</option>
			<option value = "2">강의장2</option>
			<option value = "3">강의장3</option>
			<option value = "4">강의장4</option>
			<option value = "5">강의장5</option><br>
		  </select>
		  
		<textarea name="txt" row="20" cols="20"></textarea>
		<input type="submit" value="전송하기">
	
	</form>
	</fieldset>
</body>
</html>