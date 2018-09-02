package com.kakaoix.mall.products;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProductService {
	
	@Autowired
	ProductMapper productMapper;
	
	public List<Product> selectByPage(int page){
		return productMapper.selectByPage(page);
	}
	
	public Product selectByProductNo(long productNo){
		return productMapper.selectByProductNo(productNo);
	}
}
