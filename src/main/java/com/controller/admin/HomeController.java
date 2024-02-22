package com.controller.admin;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
@Controller(value = "admin")
public class HomeController {
	
	
	@RequestMapping(value = "/quan-tri/trang-chu", method = RequestMethod.GET)
	public ModelAndView loginPage(HttpServletRequest request, HttpSession session) throws UnsupportedEncodingException {
		request.setCharacterEncoding("UTF-8");
		ModelAndView mav = new ModelAndView("/admin/home");

		return mav;
	}

}
