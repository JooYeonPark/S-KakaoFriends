package com.kakaoix.mall.products;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j

public class ProductController {
	
	@Autowired
	ProductService productService;
	
	@Value("${file.upload.directory}")
	String uploadDir;
	
	@GetMapping("/products")
	public String productView(long productNo, Model model) {
		Product product = productService.selectByProductNo(productNo);
		model.addAttribute("product", product);
		model.addAttribute("dir", uploadDir);
		
		return "products/product";
	}
	
	
	@GetMapping("/products/list")
	public String list(int page, Model model) {
		List<Product> lists = productService.selectByPage(page);
		model.addAttribute("list", lists);
		model.addAttribute("dir", uploadDir);
		
		log.info("ProductController list");
		for (Product product : lists) {
			log.info("{}", product);
		}
		return "products/list";
	}
}
