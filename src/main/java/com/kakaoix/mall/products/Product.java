package com.kakaoix.mall.products;

import java.util.List;

import com.kakaoix.mall.Image.Image;

import lombok.Data;

@Data
public class Product {
	
	private long productNo;
	
	private String name;
	
	private int price;
	
	/** 상품 설명 */
	private String description;
	
	/** 메인 이미지 경로 */
	private String mainImage;
	
	/** 서브 이미지들 */
	private List<Image> images;
	
	public Product() { }

	public Product(long productNo, String name, int price, String mainImage) {
		this.productNo = productNo;
		this.name = name;
		this.price = price;
		this.mainImage = mainImage;
	}
	
}
