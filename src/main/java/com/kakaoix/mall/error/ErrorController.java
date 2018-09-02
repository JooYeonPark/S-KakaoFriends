package com.kakaoix.mall.error;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/error")
public class ErrorController {

	@RequestMapping("/404page")
	public String redirect404() {
		return "redirect:/error/404";
	}
	
	@RequestMapping("/404")
	public String error404() {
		return "error/404";
	}
	
	@RequestMapping("/500page")
	public String redirect500() {
		
		return "redirect:/error/500";
	}
	
	@RequestMapping("/500")
	public String error500() {
		return "error/500";
	}
	
	@RequestMapping("/400page")
	public String redirect400() {
		return "redirect:/error/400";
	}
	
	@RequestMapping("/400")
	public String error400() {
		return "error/400";
	}
	
}
