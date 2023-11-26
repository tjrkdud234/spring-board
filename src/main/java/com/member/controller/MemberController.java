package com.member.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.context.annotation.Bean;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.member.domain.MemberVO;
import com.member.service.MemberService;

@Controller
@RequestMapping("/member/")
public class MemberController {

	private static final Logger logger = Logger.getLogger(MemberController.class);

	@Inject
	MemberService service;

	@Bean
	BCryptPasswordEncoder passwordEncoder() {

		return new BCryptPasswordEncoder();
	}

	// 회원가입 GET
	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public void getSignup() throws Exception {
		logger.info("***get signup***");
	}

	// 회원가입 POST
	@RequestMapping(value = "/signup", method = RequestMethod.POST)
	public String postSignup(MemberVO vo) throws Exception {
		logger.info("***post signup***");
		String inputPass = vo.getPass();
		String pass = passwordEncoder().encode(inputPass);
		vo.setPass(pass);

		service.signup(vo);
		return "redirect:/";
	}

	// 로그인 get
	@RequestMapping(value = "/signin", method = RequestMethod.GET)
	public void getSignin() throws Exception {
		logger.info("get signin");
	}

	// 로그인 post
	@RequestMapping(value = "/signin", method = RequestMethod.POST)
	public String postSignin(MemberVO vo, HttpServletRequest req, RedirectAttributes rttr) throws Exception {
		logger.info("post signin");

		MemberVO login = service.signin(vo);
		HttpSession session = req.getSession();

		boolean passMatch = passwordEncoder().matches(vo.getPass(), login.getPass());

		if (login != null && passMatch) {
			session.setAttribute("login", login);
			System.out.println("login>>>" +  login);
		} else {
			session.setAttribute("login", null);
			rttr.addFlashAttribute("msg", false);
			return "redirect:/member/signin";
		}

		return "redirect:/";
	}

	// 로그아웃
	@RequestMapping(value = "signout", method = RequestMethod.GET)
	public String signout(HttpSession session) throws Exception {
		logger.info("***get logout***");
		service.signout(session);

		return "redirect:/";

	}
}
