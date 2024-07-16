package org.zerock.domain;

import java.text.NumberFormat;

//import java.text.NumberFormat; // 숫지를 가격으로 ,붙이는 객체

import lombok.Data;

@Data
public class BookVO {
	private String book_no;
	private String mem_id;
	private String checkin;
	private String checkout;
	private int person;
	private String book_date;
	private String book_cancel;
	private String breakfast;
	private String branch;
	private String roomtype;
	private String payment_op;
	private String payment;
	private Long charge;
	
	 // 해당 메서드: charge(가격)을 쉼표(,)가 있는 문자열 형식으로 반환
    public String getFormattedCharge() {
        NumberFormat formatter = NumberFormat.getNumberInstance();
        return formatter.format(this.charge);
    }
}
