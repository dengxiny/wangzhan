package com.ssm.control;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainControl {

	@RequestMapping(value="/jsp/toRegist.do")
	public String toRegist(HttpServletRequest request){
		return  "redirect:/jsp/regist.jsp";
	}
	@RequestMapping(value="/jsp/toForget.do")
	public String toForget(HttpServletRequest request){
		return  "redirect:/jsp/forget.jsp";
	}
	
	@RequestMapping(value="/jsp/toLogin.do")
	public String toLogin(HttpServletRequest request){
		return  "redirect:/jsp/login.jsp";
	}
	@RequestMapping(value="/jsp/toHome.do")
	public String toHome(HttpServletRequest request){
		return  "jsp/Home";
	}
	
}
