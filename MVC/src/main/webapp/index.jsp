<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
			<h1>index.jsp</h1>
			<!-- http://localhost:8088/MVC/board -->
			* 프로젝트의 시작지점
			* MVC프로젝트 사용하면서 실행가능한 유일한 jsp파일
			  (이제 jsp파일을 직접 실행할 일 없음.직접실행하면 잘못가는 것)
			  ( => url에 ~~~.jsp 페이지 주소가 나오면 잘못 실행한 것 => 페이지이동이 잘 되는지 판단기준이 됨)
			  
			  
			  <%
// 			  	response.sendRedirect("./board");
// 			  	response.sendRedirect("./test.bo"); //BoardFrontController 에서 @WebServlet("*.bo")로 설정했을때 잘되는지 확인
// 			  	response.sendRedirect("./BoardWrite.bo"); //.이 없는 주소로 호출하는 이유? 
			  	response.sendRedirect("./BoardList.bo"); 
			  	
			  
			  %>
</body>
</html>