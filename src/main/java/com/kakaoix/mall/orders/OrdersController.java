package com.kakaoix.mall.orders;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.kakaoix.mall.member.Member;
import com.kakaoix.mall.member.MemberService;
import com.kakaoix.mall.products.Product;

@Controller
public class OrdersController {
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	OrdersService ordersService;
	
	/** 이미지파일 업로드 경로 */
	@Value("${file.upload.directory}")
	String uploadDir;
	
	/** 주문정보, 사용자 정보를 가져와  주문화면으로 넘김 */
	@PostMapping("/orders")
	public String order(int quantity, long productNo, String name, String mainImage, 
			Model model, @SessionAttribute long memberNo, int price, int total) 
					throws IOException {
		
		Member mem = memberService.selectByMemberNo((long)memberNo);
		model.addAttribute("member",mem);
		
		model.addAttribute("product", new Product(productNo, name, price, mainImage));
		model.addAttribute("quantity",quantity);
		model.addAttribute("dir",uploadDir);
		model.addAttribute("total", total);
		
		return "orders/order";
	}
	
	
	@GetMapping("/orders/{start}/{end}")
	public String listByDate(@PathVariable("start") String start, @PathVariable("end") String end, 
			@SessionAttribute long memberNo, Model model) {
		
		//정확한 날짜 검색을 위해 시간을 붙임
		end += " 23:59:59";
		
		OrdersDate ordersDate = new OrdersDate(memberNo, start, end);
		List<Orders> list = ordersService.selectByDate(ordersDate);
		
		model.addAttribute("list",list);
		model.addAttribute("dir", uploadDir);
		
		return "orders/ordersListComponent";
	}
	
	/** 주문을 처리 */
	@PostMapping("/orders/result")
	public String orderProcess(Orders order, Model model, @SessionAttribute long memberNo) throws SQLException{
		Member member = memberService.selectByMemberNo(memberNo);

		order.setMemberNo(member.getMemberNo());
		ordersService.insert(order);
		
		model.addAttribute("name", member.getName());
		model.addAttribute("order",order);
		
		return "orders/result";
	}
	
	@GetMapping("/orders/result")
	public String orderResultView() {
		return "redirect:/orders/result";
	}
	
	@GetMapping("/orders/list")
	public String ordersList() {
		return "orders/list";
	}
	
	/** 주문항목 자세히 보기 화면 */
	@GetMapping("/orders/listdetail")
	public String detail(long ordersNo, Model model) {
		Orders order = ordersService.selectByOrdersNo(ordersNo);
		model.addAttribute("order",order);
		
		return "orders/listdetail";
	}
}
