package com.itwillbs.action;

import java.io.IOException;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



// 컨트롤러 => 서블릿으로만들기 (상속해서)
//@WebServlet("/board2")
@WebServlet("*.bo") //앞에 주소가 무엇이든지 ~~~.bo 의 형태면 다 가능
					//
public class BoardFrontController extends HttpServlet {
	
	
	protected void doProcess (HttpServletRequest request, // 컨트롤러 안에있는 매서드
			HttpServletResponse response) throws ServletException, IOException {
		System.out.println("BoardFrontController - doProcess() 호출");
		System.out.println(" GET / POST 방식 상관없이 한번에 처리");


			//http://localhost:8088/MVC/board
			//////////////////////////// 1. 가상주소 계산단계//////////////////////////////////////
		    // 가상주소 (내가지정한것 (ex).bo)
			// URL => 웹실행 주소
			// URI => URL - (프로토콜, IP, PORT번호)
//			System.out.println(request.getRequestURI());
//			System.out.println(request.getRequestURL());
			String requestURI = request.getRequestURI();
			System.out.println(" C : (1단계시작) 가상주소 계산 시작-----------------");
			System.out.println(" C : requestURL : "+requestURI); // C : 컨트롤러
			
			String ctxPath = request.getContextPath(); // 프로젝트경로
			System.out.println(" C : ctxPath : " + ctxPath);
			
//			requestURI.substring(0);\
//			System.out.println(requestURI.substring(4));
			String command = requestURI.substring(ctxPath.length());
			System.out.println(" C : command : " + command);
			
			System.out.println(" C : (1단계끝) 가상주소 계산 완료-------------------");
			
			//////////////////////////// 1. 가상주소 계산단계//////////////////////////////////////
			
			
			
			
			
			
			//////////////////////////// 2. 가상주소매핑///////////////////////////////////////////
			// 실제주소 (ex).jsp/.css/.html)
			System.out.println(" C : (2단계시작) 가상주소 매핑 시작-----------------");
			
			Action action = null; // 미리변수 선언해놓고 밑에선 선언없이 사용
			ActionForward forward = null; //전역변수로 빼놓기 -> if문에 가져다쓰기
			
			if(command.equals("/BoardWrite.bo")) { // 같은지 비교
				System.out.println(" C : /BoardWrite.bo 호출");
				System.out.println("[패턴1] DB사용 x, view페이지 이동"); //DB사용없이 바료 뷰페이지로 이동할 수 있게 함
				
				forward = new ActionForward();
				forward.setPath("./board/writeForm.jsp"); //목적지
				forward.setRedirect(false); //주소에는 jsp나오면안됨! -> false
				
				
			}  else if (command.equals("/BoardWriteAction.bo")) { // .의 의미는 프로젝트 이름이므로 2단계부터는 .이없는 /부터의 가상주소만?얻어와야햠?뭔소리
																  // 흰화면이떴는데도 콘솔에 안뜨면? 보통 다 이 주소문제임. .이 이없어야함..?ㅋㅋ
				System.out.println(" C : /BoardWriteAction.bo 호출");
				System.out.println(" C : [패턴2] DB사용 0, 페이지이동(화면전환)"); // 그냥 적었을때 콘솔에서 리로드 뜬다. 서버동작하는방법?. 제일좋은 습관은 작업전 서버 중지 후 작업작성후 서버실행. 결과보는것
																				  // WritheAction -> List
				
				// BoardWriteAction() 객체생성
				// 강한 결함(결합도가 높다 = 이 코드가 잘못되면 다른 코드에 영향을 줄 수 있다)
				//BoardWriteAction bwa = new BoardWriteAction();
				
				// 약한결합 (결합도가 낮다)
				action = new BoardWriteAction(); // 다형성을 구현한것
				
				
				try {
//				forward = bwa.execute (request, response); // 강한결합 주석하면서 레퍼런스없어졌으므로 밑에처럼바꿔줌
				forward = action.execute (request, response); // BoardWriteAction 인터페이스에서 가져오는..?
				
				} catch (Exception e) {
					e.printStackTrace();
				}
				
				
			}  // BoardWriteAction.bo
			else if (command.equals("/BoardList.bo")) {
				System.out.println(" C : /BoardList.bo");
				System.out.println(" C : [패턴3]DB사용O, view출력(이동)");		
				
				// BoardListAction 객체 생성  (= 디비를 사용한다는 의미)
				action = new BoardListAction(); // 다형성을 의미
				
				try {// 나를 부르는 애가 예외를 처리해라 
					forward = action.execute(request, response); //forward에는 항상 티켓정보가 있을 것
				} catch (Exception e) {
					e.printStackTrace();
				} 
				//?????????????????????????????????????????
			}// BoardList.bo
			
			else if(command.equals("/BoardContent.bo"))	{
				System.out.println(" C : /BoardContent.bo 호출");
				System.out.println(" C : [패턴3]DB사용O, view출력(이동)");	
				
				// BoardContentAction 객체 생성
				action = new BoardContentAction(); //예외발생하기때문에 트라이캐치안에 넣기
				
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
				
				
			} //BoardContent.bo
			
			else if(command.equals("/BoardUpdate.bo")) {
				System.out.println(" C : /BoardUpdate.bo 호출");
				System.out.println(" C : [패턴3]DB사용O, view출력(이동)");	
				
				
				//BoardUpdateAction 객체 생성
				action = new BoardUpdateAction();
				
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
				
				
			} // BoardUpdate.bo
			
			else if(command.equals("/BoardUpdateProAction.bo")) {
				System.out.println( " C : BoardUpdateAction.bo 호출");
				System.out.println( " C : [패턴2] DB사용 0, 페이지이동(화면전환)");
				
				// BoardUpdateAction 객체 생성
				action = new BoardUpdateProAction();
				
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
				
				
			} // BoardUpdateAction
			
	          else if(command.equals("/BoardDelete.bo")) {
	              System.out.println("C : /BoardDelete.bo 호출");
	              System.out.println("C : [패턴1] DB 사용 X, view 페이지로 이동"); // 삭제버튼눌렀을때 바로 deleteForm으로 넘어갈뿐이니까 패턴1사용
	           
	              forward = new ActionForward();
	              forward.setPath("./board/deleteForm.jsp");
	              forward.setRedirect(false);
	           } //BoardDelete
	         
	          
	          
	          else if(command.equals("/BoardDeleteAction.bo")) {
	              System.out.println("C : /BoardDeleteAction.bo 호출");
	              System.out.println("C : [패턴2] DB 사용 O, 페이지 이동(화면 전환)");
	              
	              // BoardDeleteAction 객체 생성
	              action = new BoardDeleteAction();
	              try {
	                forward = action.execute(request, response);
	                // forward 쓰는 이유? 다형성 구현....
	                // 형태는 같지만 실행하는 동작들이 다 다름
	             } catch (Exception e) {
	                e.printStackTrace();
	             }
	              
	           }// BoardDeleteAction
	         
	           
	           
	           else if(command.equals("/BoardReWrite.bo")) {
		          System.out.println("C : /BoardReWrite.bo 호출");
		          System.out.println("C : [패턴1] DB 사용 X, view 페이지로 이동");
		          
		          forward = new ActionForward();
		          forward.setPath("./board/reWriteForm.jsp");
		          forward.setRedirect(false); // 포워딩이유 : 현재 실행되는 주소는 .bo이나 실제이동주소는 .jsp 이기때문에 , 주소는 안바뀌면서 화면은 바뀌는 포워딩사용
		          
		          
	           } //BoardReWrite
			
			
	           else if(command.equals("/BoardReWriteAction.bo")) {
	        	   System.out.println("C : /BoardReWriteAction.bo 호출");
	        	   System.out.println("C : [패턴2] DB 사용 O, 페이지 이동(화면 전환)");
	        	   
	        	   //BoardReWriteAction() 객체 -execute()
	        	   action = new BoardReWriteAction();
		        	   try {
		        		   forward = action.execute(request, response);
	//					forward = new BoardReWriteAction().execute(request, response); // 이렇게 사용할 수 있지만 안쓰는게 좋음.
																					   // 1. 강한결합이므로 (업캐스팅안함)
																					   // 2. 가비쥐다.. 나쁜코드임 ..냄새나는.. , 1번만 쓰고 사용할 수 없음. 메모리만 차지함. 동작은하지만 문제있다.
																					   // 	 => 나쁜코드 호출 형태(가비지 생성) 
																	        		   // 2줄짜리 쓰는 이유 
		        		   															   // 1. 약한결합으로 만들기위해   
																
					} catch (Exception e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();
			 															
		        	
		           }
	           }//BoardReWriteAction
			
	           else if(command.equals("/BoardFileWrite.bo")) {
	        	   System.out.println("C : /BoardFileWrite.bo 호출");
			       System.out.println("C : [패턴1] DB 사용 X, view 페이지로 이동");
			       
			       forward = new ActionForward();
			       forward.setPath("./board/fWriteForm.jsp");
			       forward.setRedirect(false);
	        	   
	           }//BoardFileWrite.bo
			
			
			
	           else if(command.equals("/BoardFileWriteAction.bo")) {
	        	   System.out.println("C : /BoardFileWriteAction.bo 호출");
	        	   System.out.println("C : [패턴2] DB 사용 O, 페이지 이동(화면 전환)");
	        	   
	        	   
	        	   // BoardFileWriteAction() 객체 생성
	        	   action = new BoardFileWriteAction();
	        	   
	        	   try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
	        	   
	           }//BoardFileWriteAction.bo
			
			
			System.out.println(" C : (2단계끝) 가상주소 매핑 완료-------------------"); // 부산역가서 티켓만끊은 격
			//////////////////////////// 2. 가상주소매핑///////////////////////////////////////////
			
			
			
			
			
			
			
			//////////////////////////// 3. 페이지 이동///////////////////////////////////////////
			System.out.println(" C : (3단계시작) 페이지이동 시작-------------------"); // 부산역가서 티켓만끊은 격
			
			if(forward != null) { // 이동정보가 있을때(티켓이 있을때)
				if(forward.isRedirect()) { // true
					 System.out.println("C : 이동방식 : " + forward.isRedirect() + ", 주소:  " + forward.getPath() );
										   // forward에 어떻게 갈지 저장해놨으므로 불러오기. 
										   // 그자체로 true라는 뜻이기 때문에 굳이 == true라고 적을 필요 없음!
					response.sendRedirect(forward.getPath());
				}else { //false
					 System.out.println("C : 이동방식 : " + forward.isRedirect() + ", 주소:  " + forward.getPath() );
					
					RequestDispatcher dis
						= request.getRequestDispatcher(forward.getPath());
					
					dis.forward(request, response); //호출
				}
				
			}
			
			System.out.println(" C : (3단계끝) 페이지이동 완료---------------------"); // 부산역가서 티켓만끊은 격
			
	        
			//////////////////////////// 3. 페이지 이동///////////////////////////////////////////
			
			
	
	}// doProcess
	
	
	
	// http://localhost:8088/MVC/board (web.xml 매핑)
	// http://localhost:8088/MVC/board2 (어노테이션)
	
	// alt shift s + v
	@Override
	protected void doGet(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		System.out.println("\n\n BoardFrontController - doGet() 호출");
		doProcess(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		System.out.println("\n\n BoardFrontController - doPost() 호출");
		doProcess(request, response);
	}

	
		
}
