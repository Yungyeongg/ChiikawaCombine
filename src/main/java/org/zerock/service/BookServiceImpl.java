package org.zerock.service;

import java.awt.print.Book;
import java.time.LocalDate;
import java.util.List;

import org.apache.commons.lang3.time.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.BookVO;
import org.zerock.mapper.BookMapper;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@AllArgsConstructor
@Service
public class BookServiceImpl implements BookService {
	
	@Autowired
    private BookMapper bookMapper;
	
	@Transactional //(rollbackFor = Exception.class)
	@Override
	public void booking(BookVO book) {
		 
//		// 예약한 날짜 범위 동안 각 날짜의 방 재고 감소
//        LocalDate checkin = book.getCheckin();
//        LocalDate checkout = book.getCheckout();
//        List<LocalDate> dates = DateUtils.getDatesBetween(checkin, checkout);
//        for (LocalDate date : dates) {
//            roomService.decreaseAvailableRooms(book.getBranch(), book.getRoomtype(), date);
//        }
        
		try {
			if (null == book.getBreakfast()) {
				book.setBreakfast("x");
				bookMapper.insertBook(book);
			} else {
				bookMapper.insertBook(book);
			}	
		} catch (Exception e) {
			e.printStackTrace();
		} 
	}
	
	@Transactional
	@Override
	public BookVO read(String book_no) {
		
		BookVO book = bookMapper.read(book_no);
		return  book;
	}
	
	@Transactional
	@Override
	public List<BookVO> getBook(String mem_id) {
		return bookMapper.getBook(mem_id);
	}
	
	@Transactional
	@Override
	public void cancelBook(String book_no) {
		 bookMapper.cancelBook(book_no);
	}
	
	@Transactional
	@Override
	public String getCanceledBook(String mem_id) {
		return bookMapper.getCanceledBook(mem_id);
	}


	@Override
	public int getBookedCount(BookVO book) {
		return bookMapper.getBookedCount(book);
	}
	
}
