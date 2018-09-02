package com.kakaoix.mall.orders;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface OrdersMapper {

	public void insert(Orders order);

	public List<Orders> selectByDate(OrdersDate ordersDate);

	public Orders selectByOrdersNo(long ordersNo);

}
