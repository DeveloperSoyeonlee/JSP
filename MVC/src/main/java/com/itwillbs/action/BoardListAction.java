package com.itwillbs.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwillbs.db.BoardDAO;

public class BoardListAction implements Action {

   @Override
   public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
      System.out.println("M : BoardListAction_execute() 호출");
      
      // 게시판 전체 글 개수 확인....... DB 안에 글이 몇 개 있는지 확인
      // BoardDAO 객체 생성
      BoardDAO dao = new BoardDAO();
      int cnt = dao.getBoardCount();
      request.setAttribute("totalCnt", cnt);
      System.out.println("M : 전체 글 개수? " + cnt + "개");
      
      /////////////////////////////////////////////////////////////////////////////////////////////////////
      // 페이징 처리 (1)
      
      // 한 페이지에 보여줄 글의 개수
      int pageSize = 10;      // 한 번에 10개씩만 보여줄 것
      
      // http://localhost:8088/JSP/board/boardList.jsp?pageNum=2 
      // 서버가 켜진 상태에서 이 주석문을 누르면 링크를 통해 해당 페이지로 이동함....
      
      // 현 페이지가 몇 번째 페이지인지 확인
      String pageNum = request.getParameter("pageNum");
      if(pageNum == null){
      pageNum = "1";
      
      }
      
      // 시작행 번호를 계산하기   1   6   11   16.... (한 페이지에 글이 5개씩이니까!)
      int currentPage = Integer.parseInt(pageNum);      // parseInt()의 기능은 String타입의 숫자를 int타입으로 변환해줌
      int startRow = (currentPage-1) * pageSize + 1;
      
      // 끝행 번호를 계산하기      5   10   15   20....
      int endRow = currentPage * pageSize;
      
      /////////////////////////////////////////////////////////////////////////////////////////////////////

      // 디비에 있는 전체 글 리스트 가져오기
      ArrayList boardListAll = dao.getBoardList(startRow, pageSize);
      // System.out.println("M : " + boardListAll );
      // 실행 해보고 주석처리 해야하는 syso
      
      
      /////////////////////////////////////////////////////////////////////////////////////////////
      // 페이징 처리(2)
      
      
            // 총 페이지 = 글 개수(총량) / 페이지 당 출력   
            //   => 만약, 나머지가 있을 때 페이지 1개를 추가
            
            // 전체 페이지 수
            int pageCount = (cnt / pageSize) + (cnt % pageSize == 0? 0:1); // 삼항연산자..... 이게 모지
                                                   // A? t:f
            // 한 화면에 보여줄 페이지 수
            int pageBlock = 3;
            
            // 페이지 블럭의 시작번호      1~10page 사이의 글을 보고 있으면 제일 첫 번째 번호는 1임! 
            //                        11~20page 사이의 글을 보고 있으면? 11
            int startPage = ((currentPage - 1) / pageBlock) * pageBlock + 1;
            
            // 페이지 블럭의 끝번호
            int endPage = startPage + pageBlock - 1;
            
            if(endPage > pageCount){
               endPage = pageCount;

            }
      
            
      /////////////////////////////////////////////////////////////////////////////////////////////
      
      
      
      
      // 직접 출력 -> 위임 (view 한테 대신 출력 시킴.... .jsp 에서 출력!) 
      // Action -> jsp 페이지로 정보를 전달 (request 영역 객체에 저장)
      request.setAttribute("boardListAll", boardListAll);         // "boardListAll" 이름으로 boardListAll 저장!
      
      // ****** 어차피 저장할 거 담아보내는 곳에서 디비 호출을 하는 코드?
      // 용도가 조금 다름.... 위의 코드는 추가적으로 데이터를 더 담고 싶을 때! 
      // 아래 코드는 디비에서 받아온 정보를 그대로 토스를 하고 싶을 때 쓰기!
      // request.setAttribute("boardListAll", dao.getBoardList());
      
      // 페이징 처리 정보 저장
      request.setAttribute("pageNum", pageNum);
      request.setAttribute("totalCnt", cnt);
      request.setAttribute("pageCount", pageCount);
      request.setAttribute("pageBlock", pageBlock);
      request.setAttribute("startPage", startPage);
      request.setAttribute("endPage", endPage);
      
      
      
      // 페이지 이동 준비 (티켓 생성)
      // ./board/BoardList.jsp로 이동!
      ActionForward forward = new ActionForward();
      forward.setPath("./board/boardList.jsp");
      forward.setRedirect(false);         // request를 담아서 갈 거라서 forward 방식으로 이동할 것
      
      return forward;
   }


}