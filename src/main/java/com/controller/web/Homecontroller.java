package com.controller.web;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.dto.DonationDTO;
import com.service.IDonationService;
import com.service.impl.DonationServiceimpl;

@Controller(value = "homeControll")
public class Homecontroller {
	@Autowired
	private IDonationService donationService;
 



	@RequestMapping(value = "/trang-chu", method = RequestMethod.GET)
	public ModelAndView homePage(@RequestParam("page") int page, @RequestParam("limit") int limit,
			
			HttpServletRequest request, HttpSession session) throws UnsupportedEncodingException {
		request.setCharacterEncoding("UTF-8");
		DonationDTO model_d = new DonationDTO();
		model_d.setPage(page);
		model_d.setLimit(limit);
		ModelAndView mav = new ModelAndView("/public/home");
	
		Pageable pageable =new PageRequest(page - 1, limit);
		model_d.setListResult(donationService.findALL(pageable));
		model_d.setTotalItem(donationService.getTotalItem());
		model_d.setTotalPage((int) Math.ceil((double) model_d.getTotalItem() / model_d.getLimit()));
	    
	
		mav.addObject("model_donate", model_d);
		
		return mav;
	}

	@RequestMapping(value = "/dang-nhap", method = RequestMethod.GET)
	public ModelAndView loginPage(HttpServletRequest request, HttpSession session) throws UnsupportedEncodingException {
		request.setCharacterEncoding("UTF-8");
		ModelAndView mav = new ModelAndView("login");

		return mav;
	}
	@RequestMapping(value = "/dang-xuat", method = RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("UTF-8");
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null) {
			new SecurityContextLogoutHandler().logout(request, response, auth);
			
			
		}
		System.out.println(auth);
		return new ModelAndView("redirect:/trang-chu");
	}

	
}
