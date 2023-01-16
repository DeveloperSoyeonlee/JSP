<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
		
		
<script>
		var IMP = window.IMP;   // 생략 가능
		IMP.init("imp26060646"); // 예: imp00000000 
		
		function requestPay() { // 얘만 호출하면 된다.
			IMP.request_pay({
			    pg : 'kakaopay',
			    pay_method : 'card', //생략 가능
			    merchant_uid: "order_no_0001", // 상점에서 관리하는 주문 번호
			    name : '주문명:결제테스트',
			    amount : 100,
			    buyer_email : 'iamport@siot.do',
			    buyer_name : '구매자이름',
			    buyer_tel : '010-1234-5678',
			    buyer_addr : '서울특별시 강남구 삼성동',
			    buyer_postcode : '123-456'
			}, function(rsp) { // callback 로직
				//* ...중략 (README 파일에서 상세 샘플코드를 확인하세요)... *//
				  if (rsp.success) {
		              // 결제 성공 시 로직,
		              alert('결제 성공!');
		          } else {
		              // 결제 실패 시 로직,
		              alert('결제 실패!');
		              console.log(rsp);
		          }
			});
		    }
		</script>

	
</head>
<body>
		<h1>importTest.jsp</h1>
		
		
		<button onclick="requestPay()">결제하기</button> <!-- 결제하기 버튼 생성 -->
</body>
</html>