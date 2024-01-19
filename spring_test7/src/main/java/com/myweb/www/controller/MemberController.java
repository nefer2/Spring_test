package com.myweb.www.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ezen.www.security.MemberVO;
import com.myweb.www.service.MemberService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/member/*")
@Controller
@RequiredArgsConstructor

public class MemberController {
	
	private final MemberService msv;
	
	@GetMapping("/register")
	public void register() {}

	@PostMapping("/register")
	public String insert(MemberVO mvo) {
		int isOk = msv.insert(mvo);
		return "index";
	}
	
	@GetMapping("/login")
	public void login() {}
	
	@PostMapping("/login")
	public String login(HttpServletRequest request, RedirectAttributes re) {
		re.addAttribute("email" , request.getAttribute("email"));
		re.addAttribute("errMsg", request.getAttribute("errMsg"));
		return "index";
	}
	
	
	
	
	
	
}
