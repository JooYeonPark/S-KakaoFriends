package com.kakaoix.mall.products;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProductService {
	
	@Autowired
	ProductMapper productMapper;
	
	/** 페이지별로 리스트 반환 */
	public List<Product> selectByPage(int page){
		return productMapper.selectByPage(page);
	}
	
	public Product selectByProductNo(long productNo){
		return productMapper.selectByProductNo(productNo);
	}
}
