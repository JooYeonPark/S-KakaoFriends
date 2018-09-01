package com.kakaoix.mall.orders;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OrdersService {
	
	@Autowired
	OrdersMapper ordersMapper;

	public void insert(Orders order) {
		ordersMapper.insert(order);
	}
	
	public List<Orders> selectByDate(OrdersDate ordersDate){
		return ordersMapper.selectByDate(ordersDate);
	}
	
}
