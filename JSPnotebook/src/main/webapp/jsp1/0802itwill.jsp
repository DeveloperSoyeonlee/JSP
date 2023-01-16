<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>itwill.jsp</h1>

	<%
		// 전달된 데이터(파라미터)를 저장
 		String name = request.getParameter("name"); // 출력만 함! 가져오기도 해야함
 		String tel = request.getParameter("tel"); 
	
	%>
	
		이름: <%=name %><br>
		전화번호: <%=tel %><br>
		         
		         
</body>
</html>