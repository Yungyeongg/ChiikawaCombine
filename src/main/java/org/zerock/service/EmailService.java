package org.zerock.service;

import org.zerock.domain.BookVO;

public interface EmailService {
	
	 public void sendBookingEmail(String mem_email, BookVO book);
	 
	 public void sendCancelEmail(String mem_email, BookVO book);
	 
	 public String buildEmailContent(BookVO book);
	 
	 public String cancelEmailContent(BookVO book);
}
