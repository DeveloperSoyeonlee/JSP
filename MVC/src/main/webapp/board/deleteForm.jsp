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
         <form action="./BoardDeleteAction.bo?pageNum=${param.pageNum }" method="post"> <!-- pageNum�� �ƿ� ��� �����ϱ� ���� �ȼ��ܵ��Ǵµ� �� �������ѹ��� �ּ��ٿ� �Ѱ��ְ� �������� �� ����ִ¾ֵ��̶� �Ѱ���-->
            <input type="hidden" name="bno" value="${param.bno }"> <!-- ��� �����ϱ� form�� �־ �Ѿ���°�. -->
            ��й�ȣ <input type="password" name="pass">
            <input type="submit" value="�����ϱ�">      
         </form>
      </fieldset>
      
</body>
</html>