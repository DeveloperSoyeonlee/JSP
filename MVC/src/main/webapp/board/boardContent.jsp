<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<h1>boardContent.jsp</h1>
		
		
		<table border=1>
			<tr>
				<td>글번호</td>			
				<td>${requestScope.dto.bno}</td>
				<td>조회수</td>			
				<td>${dto.readcount}</td>
			</tr>
			<tr>
				<td>작성자</td>			
				<td>${dto.name}</td>
				<td>작성일</td>			
				<td>${dto.date}</td>
			</tr>			
			<tr>
				<td>제목</td>
				<td colspan="3">${dto.subject}</td>
			</tr>
			<tr>
				<td>내용</td>
				<td colspan="3">${dto.content}</td>
			</tr>		
			<tr>
				<td>첨부파일</td>
				<td colspan="3">${dto.file}</td>
			</tr>	
			
			<tr>
				<td colspan="4">
					<input type="button" value="수정" 
						onClick="location.href='./BoardUpdate.bo?bno=${dto.bno}&pageNum=${pageNum}';">
					<input type="button" value="삭제" 
						onClick="location.href='./BoardDelete.bo?bno=${dto.bno}&pageNum=${pageNum}';" >
					<input type="button" value="답글" 
						onClick="location.href='./BoardReWrite.bo?bno=${dto.bno}&pageNum=${pageNum}&re_ref=${dto.re_ref}&re_seq=${dto.re_seq}&re_lev=${dto.re_lev}';">
					<input type="button" value="목록" 
						onClick="location.href='./BoardList.bo?pageNum=${pageNum}';">
				</td>
			</tr>		
		</table>
		
		${dto.re_ref}
		${dto.re_seq }
		${dto.re_lev }
		
</body>
</html>