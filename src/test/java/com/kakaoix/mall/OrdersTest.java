package com.kakaoix.mall;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import com.kakaoix.mall.orders.Orders;
import com.kakaoix.mall.orders.OrdersDate;
import com.kakaoix.mall.orders.OrdersService;

import lombok.extern.slf4j.Slf4j;

@RunWith(SpringRunner.class)
@SpringBootTest
@Slf4j
public class OrdersTest {
	
	@Autowired
	OrdersService ordersService;
	
	@Test
	public void insertOrders() {
		Orders order = new Orders();
		
		order.setMemberNo(1);
		order.setProductNo(1);
		order.setQty(1);
		order.setAddress("충북");
		order.setPostcode("12345");
		order.setReceiver("주연");
		order.setPhone("0101101010");
		order.setMessage("sdfsdffs");
		order.setDeliverStatus("배송중");
		
		ordersService.insert(order);
	}
	
	@Test
	public void selectAll() {
		OrdersDate ordersDate = new OrdersDate(1, "18/07/01","18/09/01");
		
		List<Orders> ordersList = ordersService.selectByDate(ordersDate);
		log.info("size:{}",ordersList.size());
		for (Orders orders : ordersList) {
			log.info("{}",orders);
		}
	}
	
	@Test
	public void selectByOrdersNo() {
		Orders order = ordersService.selectByOrdersNo((long)6);
		log.info("{}",order);
	}
	
}
