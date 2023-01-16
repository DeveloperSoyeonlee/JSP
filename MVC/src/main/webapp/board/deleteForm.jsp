<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
   <h1>deleteForm.jsp(MVC)</h1>

      <fieldset>
         <form action="./BoardDeleteAction.bo?pageNum=${param.pageNum }" method="post"> <!-- pageNum은 아예 디비에 없으니까 굳이 안숨겨도되는데 ㅜ 페이지넘버만 주소줄에 넘겨주고 나머지는 다 디비에있는애들이라서 넘거쥼-->
            <input type="hidden" name="bno" value="${param.bno }"> <!-- 디비에 있으니까 form에 넣어서 넘어오는것. -->
            비밀번호 <input type="password" name="pass">
            <input type="submit" value="삭제하기">      
         </form>
      </fieldset>
      
</body>
</html>