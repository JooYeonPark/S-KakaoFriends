package com.kakaoix.mall.member;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/member")
@Slf4j
public class MemberController {
	
	@Autowired
	MemberService memberService;
	
	/** 회원가입 화면 */
	@GetMapping("/regist")
	public String registView() {
		return "member/regist";
	}
	
	/** 회원가입 실행 */
	@PostMapping("/regist")
	public String regist(Member member, Model model) throws SQLException{
		memberService.insert(member);
		model.addAttribute("id", member.getId());
		
		return "member/result";
	}
	
	/** 아이디 중복 확인 */
	@GetMapping("/checkId")
	public @ResponseBody String checkID(String id){
		Member mem = memberService.selectById(id);
		
		if(mem == null) {
			return "possible";
		}
		return "impossible";
	}
	
	/** 로그인 화면 */
	@GetMapping("/login")
	public String loginView() {
		return "member/login";
	}
	
	/** 로그인 실행 */
	@PostMapping("/login")
	public String login(HttpServletRequest request, RedirectAttributes ra, Member member) {
		HttpSession session = request.getSession();
		Member mem = memberService.isMember(member);
		
		if(mem == null) {
			ra.addFlashAttribute("msg", "ERROR");
			return "redirect:/member/login";
		}
		
		//아이디와 비밀번호가 존재할 때, 로그인 처리
		ra.addFlashAttribute("msg", "SUCCESS");
		session.setAttribute("memberNo", member.getMemberNo()); //세션에 member no값  넣기
		return "redirect:/";
	}
	
}
