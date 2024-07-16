package org.zerock.controller;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.zerock.domain.BookVO;
import org.zerock.domain.User;
import org.zerock.service.BookService;
import org.zerock.service.EmailService;
import org.zerock.service.UserService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@AllArgsConstructor    
public class BookController {
	 	@Autowired
	    private BookService bookService; 
	 	@Autowired
	 	private UserService userService;
	 	@Autowired
	    private EmailService emailService;
	    
	 	// 로그인 후 예약 버튼 눌렀을 때
	    @GetMapping("/book") 
	    public String goBooking() {
	        return "book";
	    }
	    
	    // 체크해서 고르고 예약하기 버튼 눌렀을 때
	    @GetMapping("/goBook")
	    public String showBooking(HttpServletRequest request, Model model) {
	    	log.info(this);
	    	
	    	HttpSession session = request.getSession();
	    	 
	    	String mem_id = (String) session.getAttribute("mem_id");
	    	
	    	if (mem_id == null) {
	            // 로그인되어 있지 않으면 로그인 페이지로 리다이렉트
	            return "loginForm";
	        }
		            
	    	 User user = userService.getUserInfo(mem_id);
		            
	    	 model.addAttribute("user", user);	
		            
		            String branch = request.getParameter("branch");
		            String checkin = request.getParameter("from");
		            String checkout = request.getParameter("to");
		            String person = request.getParameter("person");
		            String roomtype = request.getParameter("roomtype");
		            //String roomName = request.getParameter("roomName");
		            String charge = request.getParameter("charge");

		            model.addAttribute("branch", branch);
		            model.addAttribute("checkin", checkin);
		            model.addAttribute("checkout", checkout);
		            model.addAttribute("person", person);
		            model.addAttribute("roomtype", roomtype);
		            //model.addAttribute("roomName", roomName);
		            model.addAttribute("charge", charge);
	        // 모델에 데이터를 추가하고 book_detail 페이지로 이동
	        return "book_detail";
	    }	 
	    
	    // 예약 완료 하기, db저장
	    @PostMapping("/checkBook") 
	    public String booking(HttpServletRequest request, BookVO book, User user, Model model)throws MessagingException  {
	    	HttpSession session = request.getSession();	  
	    	String mem_id = (String) session.getAttribute("mem_id");
	    	 // 세션에서 가져온 mem_id를 BookVO 객체에 설정
	        book.setMem_id(mem_id);
	        String book_no = RandomStringUtils.randomAlphanumeric(10);
	        book.setBook_no(book_no);
	       
	        try {
	            // 예약 서비스 호출
	            bookService.booking(book);
	            
	            // 예약 완료 되면 이메일 전송 
	            user = userService.getUserInfo(mem_id);	   		    
		    	book = bookService.read(book_no);			   		     		    		  
		   	    emailService.sendBookingEmail(user.getMem_email(), book);
	        } catch (Exception e) {
	            model.addAttribute("error", "예약을 완료하는 중 오류가 발생했습니다.");
	            return "errorPage"; // 예약 실패 시 처리할 페이지로 이동
	        }
	   	        
	   	         return "afterLogin";
	    }
	    
	    // 마이페이지에서 예약 조회 하기
	    @GetMapping("/bookCheck")
	    public String bookCheck(HttpServletRequest request, User user, Model model, BookVO book) {
	    	HttpSession session = request.getSession();
	    	 
	    	String mem_id = (String) session.getAttribute("mem_id");
	    	 user = userService.getUserInfo(mem_id);
	  
	    	 model.addAttribute("user", user);
	    	 model.addAttribute("bookList", bookService.getBook(mem_id));
	//    	 model.addAttribute("book_cancel",  bookService.getCanceledBook(mem_id));
		            
	    	return "BookCheck";
	    }
	    
	    // 상세조회 하기
	    @GetMapping("/readView")
	    public String read(HttpServletRequest request, Model model, BookVO book, User user) {
	    	HttpSession session = request.getSession();
	    	 
	    	String mem_id = (String) session.getAttribute("mem_id");
		            
	    	model.addAttribute("user", userService.getUserInfo(mem_id));
	    	model.addAttribute("read", bookService.read(book.getBook_no()));
	    	return "BookCheckView";
	    }
	    
	    // 예약 취소 하기
	    @PostMapping("/cancelBook") 
	    public String cancelBook(HttpServletRequest request,BookVO book, User user) {       
	    	
	    	HttpSession session = request.getSession();
	    	 
	    	String mem_id = (String) session.getAttribute("mem_id");
	    	user = userService.getUserInfo(mem_id);
	    	String book_no = request.getParameter("book_no");
	    	bookService.cancelBook(book_no);
	    	
	    	// 예약 취소 메일 보내기 위해 예약된 정보를 가져옴
	    	book = bookService.read(book_no);
	    	
	    	 // 이메일 전송
	   	    emailService.sendCancelEmail(user.getMem_email(), book);
	   	    	   	  	   	    
	    	return "bookCancel";
	    }
	    
	    @GetMapping("/goMain")
	    public String goMain (HttpServletRequest request) {
	    	//HttpSession session = request.getSession();
	    	 
	    	//String mem_id = (String) session.getAttribute("mem_id");
	    	return "afterLogin";
	    }
}
