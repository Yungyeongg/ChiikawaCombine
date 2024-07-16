package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.BookVO;

public interface BookMapper {
	
	public void insertBook(BookVO book);
	
	public BookVO read(String book_no);
	
	public List<BookVO> getBook(String mem_id);
	
	public void cancelBook(String book_no);
	
	public String getCanceledBook(String mem_id);
	
	public int getBookedCount(BookVO book);
}
