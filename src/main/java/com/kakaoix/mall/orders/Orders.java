package com.kakaoix.mall.orders;

import java.util.Date;

import com.kakaoix.mall.products.Product;

import lombok.Data;

@Data
public class Orders {
	
	private long ordersNo;
	
	private long memberNo;
	
	private long productNo;
	
	private Date date;
	
	private int totalPrice;
	
	private int qty;
	
	private String address;
	
	private String postcode;
	
	private String receiver;
	
	private String phone;
	
	private String message;
	
	/** 배송 상태 */
	private String deliverStatus;
	
	/** 결제 방법 */
	private String payment;
	
	/** 상품  */
	private Product product;
}
