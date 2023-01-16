<%@page import="java.util.ArrayList"%>
<%@page import="com.itwillbs.db.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<h1>boardList.jsp</h1>
		<!-- 전달된 정보 확인 
		request안 저장된 것 확인하기 
		1) jsp 코드 2) EL코드-->
		
<%-- 	[JSP] <%=request.getAttribute("boardListAll")%> --%>
<%-- 	[EL] ${requestScope.boardListAll } --%>

		<h3><a href="./BoardWrite.bo">글쓰기</a></h3>
		<h3><a href="./BoardFileWrite.bo">파일업로드 글쓰기</a></h3>


		<h3> 전체 글 개수 : ${requestScope.totalCnt }개 </h3>
		<h3> 전체 글 개수 : ${totalCnt }개 </h3>
		
		<table border="1">
			<tr>
				<td>번호</td>
				<td>제목</td>
				<td>글쓴이</td>
				<td>조회수</td>
				<td>작성일</td>
				<td>ip</td>
			</tr>
			
			<c:forEach var="dto" items="${boardListAll }">
			<tr>	
				
				<td>${dto.bno }</td>
				<td>
					<c:if test="${dto.re_lev > 0 }"> <!-- 답글의 형태들만 선택하는 것! -->
						<img src="./img/level.gif" width="${dto.re_lev * 10}"> <!-- 상대경로 접근해야함. 절대경로는 안됨??? -->
						<img src="./img/re.gif">
					</c:if>
					<a href="./BoardContent.bo?bno=${dto.bno }&pageNum=${pageNum}">
						${dto.subject }</a>
						<c:if test="${dto.file != null }">
							<img src="./img/save.png" width="15" height="15">
								<!--  가상주소 앞 / 는 프로젝트 /// mvc에서는 직접경로로는 접근못해서 상대경로로 접근해야함. ********************
									  실제주소 앞 / 는 webapp  -->
															<!-- 1. 상대경로 -->
															
															<!-- 	기준 : 현재 웹페이지의 소속 폴더가 기준점 -->
															
															<!--         . : 현재 웹페이지가 소속된 폴더 -->
															
															<!--         .. : 현재 웹페이지의 부모 폴더 -->
															
															<!-- 	자식폴더명 : 현재 소속된 폴더의 자식 폴더 -->
															
															<!-- 	현재 위치를 '나'로 기준을 삼고 상대를 찾는 표현 -->
															
																	
															
															<!-- 2. 절대경로 -->
															
															<!-- 	기준 : 누구나 다 알고있는 동일한 위치를 기준으로 상대를 찾는 표현 -->
															
															<!-- 	'/' 기준 -> '/' 는 웹사이트의 루트 폴더 > "http://localhost:8090"  -->

	
						</c:if>
				</td>
				<td>${dto.name }</td>
				<td>${dto.readcount }</td>
				<td>${dto.date }</td>
				<td>${dto.ip }</td>
			</tr>
			</c:forEach>
			
			
		</table>
 		
 		
	  <c:if test="${totalCnt != 0}"> <!-- 올렸던 글의 갯수가 몇개인지 판단 -->
   
      <!-- 이전 -->   
      <c:if test="${startPage > pageBlock }">
         <a href = "./boardList.bo?pageNum=${startPage-pageBlock }">[이전]</a>
      </c:if>



  			<!-- 페이지번호(1,2,3...) -->
  			<c:forEach var="i" begin="${startPage }" end="${endPage}" step="1">
  				<a href="./BoardList.bo?pageNum=${i }">${i }</a>
	  		</c:forEach>
  			<!-- 다음 -->
  			<c:if test="${endPage < pageCount}">
  				<a href=".BoardList.bo?pageNum=${startPage+pageBlock }"> [다음]</a>
  			</c:if>
  		
	</c:if>
 		
		
</body>
</html>