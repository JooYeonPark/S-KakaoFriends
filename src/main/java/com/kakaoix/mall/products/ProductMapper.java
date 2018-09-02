package com.kakaoix.mall.products;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface ProductMapper {

	public List<Product> selectByPage(int page);

	public Product selectByProductNo(long productNo);
	
}
