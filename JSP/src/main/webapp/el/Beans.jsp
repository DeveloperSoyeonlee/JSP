<%@page import="com.itwillbs.test.Phone0"%>
<%@page import="com.itwillbs.test.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<h1>Beans.jsp</h1>
		
		[jsp]
		<%
		
		// request 영역 저장
		// request.setAttribute("Person", Person); 으로 보냈음
		Person p = (Person) request.getAttribute("Person");
		
	
		
		
		%>
		
		이름 : <%=p.getName() %>
		나이 : <%=p.getAge() %>
		
		<%
		 	Phone0 iPhone = p.getP();
		%>
		
		휴대폰 모델명 : <%=p.getP().getModel() %>
		휴대폰 모델명 : <%=iPhone.getModel()%>
		
		전화번호 : <%=p.getP().getTel() %>
		전화번호 : <%=iPhone.getTel() %>
		
		<hr>
		[el] set/get메서드 없이 변수명으로 호출<br>
		${requestScope.Person.name }<br> = person.getName();
		${requestScope.Person.age }<br>
		${requestScope.Person}<br> 
		${requestScope.Person.p}<br> <!-- .p라는 객체정보 필요/person타입의 객체p에 접근해야함. -->
		${requestScope.Person.p.model}<br> <!-- .p라는 객체정보 필요 -->
		${requestScope.Person.p.tel}<br>
		${person.p.tel}<br> <!-- scope 생략가능 -->
<%-- 	${reqeustScope.person.Phone0.model } --%>
		
		
		
		
		
		
</body>
</html>