package com.kakaoix.mall.orders;

import lombok.Data;

/**
 *
 * @author Park Joo Yeon
 * @since 2018. 9. 1.
 * @see  주문 시작과 끝 날짜를 쉽게 관리하기 위한 model
 * 
 */

@Data
public class OrdersDate {
	
	private long memberNo;
	private String start;
	private String end;
	
	public OrdersDate(long memberNo, String start, String end) {
		this.memberNo = memberNo;
		this.start = start;
		this.end = end;
		
	}
}
