package com.kakaoix.mall;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import com.kakaoix.mall.products.Product;
import com.kakaoix.mall.products.ProductMapper;

import lombok.extern.slf4j.Slf4j;

@RunWith(SpringRunner.class)
@SpringBootTest
@Slf4j
public class ProductTest {
	@Autowired
	ProductMapper productMapper;	
	
	@Test
	public void selectByPage() {
		List<Product> lists = productMapper.selectByPage(0);
		log.info("list!!!!!");
		for (Product product : lists) {
			log.info("{}",product);
		}
	}
	
	@Test
	public void selectByProductNo() {
		Product product = productMapper.selectByProductNo(1);
		log.info("list!!!!!");
		log.info("{}",product);
		
	}
}
