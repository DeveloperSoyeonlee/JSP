<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp1/0804practice2.jsp</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");

	String name = request.getParameter("name");
	String tel = request.getParameter("tel");
	String pass = request.getParameter("pass");
	String gender = request.getParameter("gender");
	
	String hobby1 = request.getParameter("hobby");
	String hobby2 = request.getParameter("hobby");
	String hobby3 = request.getParameter("hobby");
	
	String[] hobbys = request.getParameterValues("hobby");
	
	String num = request.getParameter("num");
	
//  해결해야할 것 : (1) hobby들 출력방법이해(for,if) / 


// 				(2)강의실선택해도 null나오는이유
// 				<select name="num">을
// 				<select type="num">으로 적어서 null뜸

%>

	<h3>이름 : <%=name %></h3>
	<h3>전화번호 : <%=tel %></h3>
	<h3>성별 : <%=gender %></h3>
	<h4>취미1 : <%=hobbys[0] %></h4>
	<h4>취미2 : <%=hobbys[1] %></h4>
	<h4>취미3 : <%=hobbys[2] %></h4>
	<h4>강의장 : <%=num %></h4>
	
	
</body>
</html>