package com.controller.web;

import java.io.UnsupportedEncodingException;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.dto.DonationDTO;
import com.dto.User_DonationDTO;
import com.service.IDonationService;
import com.service.IUser_DonationService;
@Controller(value="donenateControll")
public class DonateController {
	@Autowired(required = true)
	private IDonationService donationServiceimpl;
	
	@Autowired
	private IUser_DonationService user_donateserviceimpl;
	
	@RequestMapping(value = "/donate",method = RequestMethod.GET)
	public ModelAndView donatePage(HttpSession session,@RequestParam("id") Long id) {
		DonationDTO model=donationServiceimpl.FindbyID(id);
		ModelAndView mav=new ModelAndView("/public/detail");
		session.setAttribute("donate", model);
		List<User_DonationDTO> list=user_donateserviceimpl.findByDonate_id(id);
		session.setAttribute("user_donate", list);
		
		int size=list.size();
		session.setAttribute("size", size);
		System.out.println(model);
		return mav;
	}
	

	@RequestMapping(value = "/donate_success",method = RequestMethod.POST)
	public ModelAndView savedonatePage(HttpSession session,HttpServletRequest request,HttpServletResponse response,@RequestParam("id_donate") String id,
			@RequestParam("name") String name_user,@RequestParam("text_send") String text,@RequestParam("code") String code
			,@RequestParam("idUser") int id_user,@RequestParam("money") int money
			) {
		try {
			
			response.setContentType("text/html;charset=UTF-8");			
			request.setCharacterEncoding("UTF-8");
			  ZonedDateTime zonedDateTime = ZonedDateTime.now();
			  DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy");
			  String datenow = zonedDateTime.format(formatter);
			User_DonationDTO model =new User_DonationDTO();
			model.setMoney(money);
			model.setText(text);
			model.setName(name_user);
			model.setCreated(datenow);
			model.setId_user(id_user);
			model.setStatus(1);
			model.setId_donate(id);
			model.setCode(code);
			System.out.println(model.getText());
			System.out.println(model);
			user_donateserviceimpl.save(model);
		} catch (UnsupportedEncodingException e) {
			
			e.printStackTrace();
		}
		
	  
		 
		
		return new ModelAndView("redirect:/trang-chu?page=1&limit=5");
		
	}
	

}
