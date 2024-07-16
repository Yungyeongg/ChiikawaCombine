package org.zerock.service;

import java.util.List;

import org.zerock.domain.BookVO;

public interface BookService {
	
	public void booking(BookVO book);
	
	public BookVO read(String book_no);
	
	public List<BookVO> getBook(String mem_id);
	
	public void cancelBook(String book_no);
	
	public int getBookedCount(BookVO book);
	
	public String getCanceledBook(String mem_id);
}