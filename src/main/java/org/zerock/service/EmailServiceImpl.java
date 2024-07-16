package org.zerock.service;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.zerock.domain.BookVO;

@Service
public class EmailServiceImpl implements EmailService {

	 @Autowired
	    public JavaMailSender mailSender;

	 	// 예약 후 확인 메일
	    public void sendBookingEmail(String mem_email, BookVO book) {
	       try {
	    	MimeMessage message = mailSender.createMimeMessage();
	        MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
	        
	        helper.setFrom("yun990217@gmail.com");
	        helper.setTo(mem_email);
	        helper.setSubject("치이카와 호텔 예약이 완료되었습니다.");
	        helper.setText(buildEmailContent(book), true);

	        mailSender.send(message);
	       } catch (MessagingException e) {
	    	  
	    	   e.printStackTrace();
	            // 또는 예외를 다시 throw할 수도 있음
	            throw new RuntimeException("Failed to send email", e);
	       }
	    }
	    
	    // 예약 취소 후 확인 메일
	    public void sendCancelEmail(String mem_email, BookVO book) {
		       try {
		    	MimeMessage message = mailSender.createMimeMessage();
		        MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
		        
		        helper.setFrom("yun990217@gmail.com");
		        helper.setTo(mem_email);
		        helper.setSubject("해당 예약이 취소되었습니다.");
		        helper.setText(cancelEmailContent(book), true);

		        mailSender.send(message);
		       } catch (MessagingException e) {
		    	  
		    	   e.printStackTrace();
		            // 또는 예외를 다시 throw할 수도 있음
		            throw new RuntimeException("Failed to send email", e);
		       }
		    }

	    public String buildEmailContent(BookVO book) {
	        // 예약 정보를 기반으로 이메일 내용을 생성
	        StringBuilder content = new StringBuilder();
	        content.append("<h1>예약 확인</h1>");
	        content.append("<p>예약 번호: ").append(book.getBook_no()).append("</p>");
	        content.append("<p>체크인: ").append(book.getCheckin()).append("</p>");
	        content.append("<p>체크아웃: ").append(book.getCheckout()).append("</p>");
	        content.append("<p>인원수: ").append(book.getPerson()).append("</p>");
	        content.append("<p>지점: ").append(book.getBranch()).append("</p>");
	        content.append("<p>룸 타입: ").append(book.getRoomtype()).append("</p>");
	        content.append("<p>총 금액: ").append(book.getFormattedCharge()).append("원</p>"); // 숫자에 , 붙은 문자열 반환 
	        content.append("<p>결제 방법: ").append(book.getPayment_op()).append("</p>");
	        content.append("<p>조식 추가: ").append(book.getBreakfast()).append("</p>");
	        return content.toString();
	    }
	    
	    public String cancelEmailContent(BookVO book) {
	    	// 예약 정보를 기반으로 이메일 내용을 생성
	        StringBuilder content = new StringBuilder();
	        content.append("<h1>예약 취소 확인</h1>");
	        content.append("<p>예약 번호: ").append(book.getBook_no()).append("</p>");
	        content.append("<p>체크인: ").append(book.getCheckin()).append("</p>");
	        content.append("<p>체크아웃: ").append(book.getCheckout()).append("</p>");
	        content.append("<p>인원수: ").append(book.getPerson()).append("</p>");
	        content.append("<p>지점: ").append(book.getBranch()).append("</p>");
	        content.append("<p>룸 타입: ").append(book.getRoomtype()).append("</p>");
	        content.append("<p>총 금액: ").append(book.getFormattedCharge()).append("원</p>"); // 숫자에 , 붙은 문자열 반환 
	        content.append("<p>결제 방법: ").append(book.getPayment_op()).append("</p>");
	        content.append("<p>조식 추가: ").append(book.getBreakfast()).append("</p>");
	        return content.toString();
	    }
}
