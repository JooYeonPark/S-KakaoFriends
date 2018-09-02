package com.kakaoix.mall.products;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
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
	public String list() {
		return "products/list";
	}
	
	@GetMapping("/products/list/{page}")
	public String productList(@PathVariable("page") int page, Model model) {
		List<Product> lists = productService.selectByPage(page*8);
		model.addAttribute("list", lists);
		model.addAttribute("dir", uploadDir);
		
		return "products/listComponent";
	}
}
