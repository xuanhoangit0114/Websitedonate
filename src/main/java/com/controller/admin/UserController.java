package com.controller.admin;

import java.io.UnsupportedEncodingException;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.component.RoleConVert;
import com.dto.RoleDTO;
import com.dto.UserDTO;
import com.entity.RoleEntity;
import com.service.IUserService;
@Controller(value="admin_user")
public class UserController {
	
	@Autowired
	private IUserService service;
	
	@RequestMapping(value = "/quan-tri/user", method = RequestMethod.GET)
	public ModelAndView UserPage(@RequestParam("page") int page,@RequestParam("phone_number_find") Optional<String>  phone_number, @RequestParam("limit") int limit,
			HttpServletRequest request, HttpSession session) throws UnsupportedEncodingException {
		request.setCharacterEncoding("UTF-8");
		UserDTO model_u = new UserDTO();
		model_u.setPage(page);
		model_u.setLimit(limit);
		ModelAndView mav = new ModelAndView("/admin/account");
		Pageable pageable = new PageRequest(page-1 , limit);
		if(phone_number.isPresent()) {
			model_u.setListResult(service.findByphone_number(phone_number.get(), pageable));
			System.out.println(model_u.toString());
		}
		else {
			model_u.setListResult(service.findALL(pageable));
		}
		model_u.setTotalItem(service.getTotalItem());
		model_u.setTotalPage((int) Math.ceil((double) model_u.getTotalItem() / model_u.getLimit()));
	    
	
		mav.addObject("model_u", model_u);
		
		return mav;

	}
	@RequestMapping(value = "/quan-tri/lock-user", method = RequestMethod.POST)
	public ModelAndView LockUser(@RequestParam("id") String id,HttpServletRequest request, HttpSession session) throws UnsupportedEncodingException {
		request.setCharacterEncoding("UTF-8");
		service.lockUser(id);

		return new ModelAndView("redirect:/quan-tri/user?page=1&limit=100");
	}
	@RequestMapping(value = "/quan-tri/unlock-user", method = RequestMethod.POST)
	public ModelAndView unLockUser(@RequestParam("id") String id,HttpServletRequest request, HttpSession session) throws UnsupportedEncodingException {
		request.setCharacterEncoding("UTF-8");
		  service.unlockUser(id);

		return new ModelAndView("redirect:/quan-tri/user?page=1&limit=100");
	}
	@RequestMapping(value = "/quan-tri/delete-user", method = RequestMethod.POST)
	public ModelAndView DeletedUser(@RequestParam("id") String id,HttpServletRequest request, HttpSession session) throws UnsupportedEncodingException {
		request.setCharacterEncoding("UTF-8");
		  service.delete(id);

		return new ModelAndView("redirect:/quan-tri/user?page=1&limit=100");
	}
	
	
	@Autowired
	
	private PasswordEncoder encoder;
	@RequestMapping(value = "/quan-tri/adduser",method = RequestMethod.POST)
	public ModelAndView saveuserPage(HttpSession session,HttpServletRequest request,HttpServletResponse response,@RequestParam("username") String username,
			@RequestParam("password") String password,@RequestParam("idRole") String id_role
			,@RequestParam("address") String address,@RequestParam("fullName") String fullname,
			@RequestParam("phoneNumber") String number_phone,
			@RequestParam("email") String email) throws UnsupportedEncodingException {	
		  ZonedDateTime zonedDateTime = ZonedDateTime.now();
		  DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy");
		  String datenow = zonedDateTime.format(formatter);
		request.setCharacterEncoding("UTF-8");
		UserDTO model =new UserDTO();
		model.setPhone_number(number_phone);
		model.setUserName(username);
		model.setFull_name(fullname);
		model.setAddress(address);
		model.setStatus(1);
		model.setCreated(datenow);
		model.setRole_id(id_role);
		model.setEmail(email);
	    String id= service.getLastId() ;
	     System.out.println(id);
	  
	   int number = Integer.parseInt(id);
	   int idplus=number+1;
	   String idconvert=Integer.toString(idplus);
	
		System.out.println(model.toString());
		
		model.setPassword(encoder.encode(password));
	
		service.save(model);
		if(id_role.equals("2")) {
		service.inserttoReRole(idconvert);}
		else if(id_role.equals("1") ){
			service.inserttoReRoleADMIN(idconvert);
		}
		return new ModelAndView("redirect:/quan-tri/user?page=1&limit=100");
}
	
	
	
	@Autowired	
	private PasswordEncoder aencoder;
	
	@RequestMapping(value = "/quan-tri/update_user",method = RequestMethod.POST)
	public ModelAndView upadatePage(HttpSession session,HttpServletRequest request,HttpServletResponse response,@RequestParam("iduser") String id,
			@RequestParam("fullName") String fullName,@RequestParam("email") String email
			,@RequestParam("address") String address,@RequestParam("userName") String userName,
			@RequestParam("phoneNumber") String phoneNumber,
			@RequestParam("idRole") String idRole,@RequestParam("password") String passwword) throws UnsupportedEncodingException {	
		request.setCharacterEncoding("UTF-8");
		UserDTO model =new UserDTO();
		Long id_i=Long.parseLong(id);
		model.setId(id_i);
		model.setPhone_number(phoneNumber);
		model.setUserName(userName);
		model.setFull_name(fullName);
		model.setAddress(address);
		model.setStatus(1);
		model.setRole_id(idRole);
		model.setEmail(email);
	    model.setPassword(aencoder.encode(passwword));
		System.out.println(model.toString());
		service.save(model);	
		if(idRole.equals("2")) {
			service.inserttoReRole(id);}
			else if(idRole.equals("1") ){
				service.inserttoReRoleADMIN(id);
			}
		return new ModelAndView("redirect:/quan-tri/user?page=1&limit=100");
}
}