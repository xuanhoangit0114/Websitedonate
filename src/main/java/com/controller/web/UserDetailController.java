package com.controller.web;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.dto.UserDTO;
import com.service.IUserService;

@Controller(value="userControll")
public class UserDetailController {
	@Autowired
	private IUserService iUserService;
	
	
	@RequestMapping(value = "/user",method = RequestMethod.GET)
	public ModelAndView donatePage(HttpSession session,@RequestParam("id") Long id) {
		UserDTO model=iUserService.FindbyID(id);
		ModelAndView mav=new ModelAndView("/public/user");
		session.setAttribute("user", model);
		
		return mav;
	}
	@Autowired	
	private PasswordEncoder aencoder;
	
	@RequestMapping(value = "/update_userdetails",method = RequestMethod.POST)
	public ModelAndView upadatePage(HttpSession session,HttpServletRequest request,HttpServletResponse response,@RequestParam("idUser") String id,
			@RequestParam("fullname") String fullName,@RequestParam("email") String email
			,@RequestParam("address") String address,@RequestParam("username") String userName,
			@RequestParam("phone_number") String phoneNumber,
			@RequestParam("idRole") String idRole,@RequestParam("password") String passwword) throws UnsupportedEncodingException {	
		request.setCharacterEncoding("UTF-8");
		
		UserDTO model =new UserDTO();
		Long id_i=Long.parseLong(id);
		model.setId(id_i);
		UserDTO models=iUserService.FindbyID(id_i);
		model.setPhone_number(phoneNumber);
		model.setUserName(userName);
		model.setFull_name(fullName);
		model.setAddress(address);
		model.setStatus(1);
		model.setRole_id(idRole);
		model.setEmail(email);
		System.out.println("string do dai:"+passwword.length());
		if(passwword.length()==0) { model.setPassword(models.getPassword());}
		else{model.setPassword(aencoder.encode(passwword));}
		System.out.println(model.toString());
		iUserService.save(model);	
	
		return new ModelAndView("redirect:/user?id="+id);
}
	

}
