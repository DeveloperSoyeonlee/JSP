<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js" integrity="sha512-aVKKRRi/Q/YV+4mjoKBsE4x3H+BkegoM/em46NNlCqNTmUYADjBbeNefNxYV7giUp0VxICtqdrbqU7iVaeZNXA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script type="text/javascript">
    $(document).ready(function(){
    	// 선택자
    	$('h2').css('color', 'RED'); // 태그선택자
    	$('*').css('color','blue'); // * - 전체(모든요소)
    	$('.title1').css('color','orange'); // . - 클래스
    	$('#title2').css('color','pink'); // # - 아이디
    	
    	/*jQuery  - 아이디값 가져오기*/
    	//alert($('input').val());
    	
    	// 데이터 넣기
    	$('input').val('아이티윌'); // 인풋안에 정보.. 뭐 ?
    	alert($('input').val());
    	
    	// 비밀번호 넣기 - 12345 입력
//     	$('input').val('12345'); // 구현안됨.둘다 바뀜
    	// => 해결 : 태그에 선택자 주기
//     	$('input.pw').val('12345');
    	$('input[type=password]').val('123456789');
//     	alert($('input.pw').val());
    	alert($('input.[type=password]').val());
    	
    	// 위치탐색 선택자
    	$('tr:odd').css('background','red');
    	$('tr:even').css('background','blue');
    	$('tr:first').css('background','yellow');
    	
    });
    
    /* js - 아이디값 가져오기
    document.폼태그명.요소명.value*/
    
    
    
    $(document).css
</script>

</head>
<body>
	<h1>test2.jsp</h1>
	
	<h2 class="title1">제목1</h2>
	<h2 id="title2">제목2</h2>
	
	<form action="">
		아이디 : <input type="text" name="id"><br>
		비밀번호 : <input type="password" name="pw"><br>
	</form>
	<hr>
	
	<table border="1">
	   <tr>
	   	   <td>1</td>
	   	   <td>2</td>
	   	   <td>3</td>
	   </tr>
	   <tr>
	   	   <td>1</td>
	   	   <td>2</td>
	   	   <td>3</td>
	   </tr>
	   <tr>
	   	   <td>1</td>
	   	   <td>2</td>
	   	   <td>3</td>
	   </tr>
	   <tr>
	   	   <td>1</td>
	   	   <td>2</td>
	   	   <td>3</td>
	   </tr>
	</table>
	
	

</body>
</html>