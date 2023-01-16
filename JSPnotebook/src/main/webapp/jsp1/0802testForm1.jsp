<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<h1>0802testForm1.jsp</h1>
	<fieldset>
	<legend>폼태그</legend>
	<h3> 정보를 입력받아서 전달(subit)하는 태그</h3>
		<form action="0802itwill.jsp" method="get">
				이름: <input type="text" name="name"><br>
				전화번호 : <input type="text" name="tel">
				<input type="submit" value="입력하기">
				
				
		</form>
	</fieldset>
	
</body>
</html>