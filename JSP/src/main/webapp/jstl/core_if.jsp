<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
			<h1>core_if.jsp</h1>
			
<%-- 		<c:if test="${조건식작성}"></c:if> --%>
<!-- 				조건식이 참일 때 실행코드 -->
<%-- 		<c:if test=""></c:if> --%>
			
			
			<c:set var="tmp" value="100"/>
			<!--  tmp 변수의 값이 100인지 아닌지 판단 -->
			
			<c:if test="${ tmp == 100 }">
				변수의 값은 100!<br>
			</c:if>
			<c:if test="${ tmp != 100 }">
				변수의 값은 100이 아니다!<br>
			</c:if>
			
				
			<b>num1 = 100, num2=300 둘중에 더 큰값을 찾아서 출력</b><br>
			
			<c:set var="num1" value="100" />
			<c:set var="num2" value="300" />
			<c:if test="${ num1<num2 }">
				${ num2}값이 더 크다!<br>
			</c:if>
			<c:if test="${num1>num2 }">
				${ num1}값이 더 크다!<br>
			</c:if>

			
			
			
			
			<h2> c:choose switch-case와 유사함</h2>
<%-- 		<c:choose> --%>
<%-- 			<c:when test="${ 조건식 }"> --%>
				
<%-- 			</c:when> --%>
<%-- 			<c:when test=${ 조건식 }"> --%>
				
<%-- 			</c:when> --%>
<%-- 			<c:otherwise> --%>
<!-- 				그외 나머지 -->
<%-- 			</c:otherwise> --%>
<%-- 		</c:choose> --%>
			
			
			
			
			<b>tmp 변수가 양수, 음수, 0인지 판단</b><br>
			
			<c:set var="tmp" value="1" />
			<c:choose>
				<c:when test="${tmp > 0 }">
						${tmp }값은 양수! <br>
				</c:when>
				<c:when test="${tmp < 0 }">
						${tmp }값은 음수! <br>
				</c:when>
				<c:when test="${tmp == 0 }">
						${tmp }값은 0! <br>
				</c:when>
				<c:otherwise>
						${tmp }값은 정수가 아니다!<br>
				</c:otherwise>
			</c:choose>
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
</body>
</html>