package com.kakaoix.mall.orders;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.kakaoix.mall.member.Member;
import com.kakaoix.mall.member.MemberService;
import com.kakaoix.mall.products.Product;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class OrdersController {
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	OrdersService ordersService;
	
	/** 이미지파일 업로드 경로 */
	@Value("${file.upload.directory}")
	String uploadDir;
	
	/** 주문정보, 사용자 정보를 가져와 order 화면으로 넘겨주는 역할 */
	@PostMapping("/orders")
	public String order(@RequestParam int quantity, @RequestParam long productNo,  @RequestParam String name,  @RequestParam int price,
			 @RequestParam String mainImage, Model model, HttpServletRequest request) throws JsonParseException, JsonMappingException, IOException {
		
		HttpSession session = request.getSession();
		Object memberNo = session.getAttribute("memberNo");
		
		//로그인 하지 않은 경우 로그인 처리
		if(memberNo == null) {
			return "redirect:/member/login";
		}
		
		Member mem = memberService.selectByMemberNo((long)memberNo);
		model.addAttribute("member",mem);
		
		model.addAttribute("product", new Product(productNo, name, price, mainImage));
		model.addAttribute("quantity",quantity);
		model.addAttribute("dir",uploadDir);
		
		return "orders/order";
	}
	
	/** 주문을 완료 */
	@PostMapping("/orders/process")
	public String orderProcess(Orders order, Model model, @SessionAttribute long memberNo) throws SQLException{
		Member member = memberService.selectByMemberNo(memberNo);

		order.setMemberNo(member.getMemberNo());
		log.info("order:{}",order);
		
		ordersService.insert(order);
		
		
		model.addAttribute("name", member.getName());
		model.addAttribute("order",order);
		
		return "orders/result";
	}
	
	@GetMapping("/orders/result")
	public String orderResultView() {
		return "orders/result";
	}
	
	@GetMapping("/orders/list")
	public String ordersList() {
		return "orders/list";
	}
	
	/** 날짜 범위 안의 주문 리스트 */
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
	
}
