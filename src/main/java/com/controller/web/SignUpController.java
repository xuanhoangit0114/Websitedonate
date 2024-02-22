package com.controller.web;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.component.RoleConVert;
import com.dto.RoleDTO;
import com.dto.UserDTO;
import com.entity.RoleEntity;
import com.entity.UserEntity;
import com.service.IUserService;

@Controller(value = "signupControll")

public class SignUpController {
	
	@Autowired
	
	private PasswordEncoder encoder;
	
	@Autowired 
	private IUserService service;
	
	
	
	@RequestMapping(value = "/dang-ki",method = RequestMethod.GET)
	public String donatePage(HttpSession session) {
		
	
		
		return "/signup";
	}
	
	@Autowired
	private RoleConVert conVert;
	 

	@RequestMapping(value = "/acction-dang-ki",method = RequestMethod.POST)
	public ModelAndView savedonatePage(HttpSession session,HttpServletRequest request,HttpServletResponse response,@RequestParam("username") String username,
			@RequestParam("password") String password,@RequestParam("passwordre") String passwordre
			,@RequestParam("address") String address,@RequestParam("fullname") String fullname,@RequestParam("number_phone") String number_phone
			, RedirectAttributes redirectAttributes) {
		try {
			response.setContentType("text/html;charset=UTF-8");
			  String idconvert=null;
			request.setCharacterEncoding("UTF-8");
			UserEntity userentity=service.findOneByUserName(username);
			if(userentity != null) {
				
				
				redirectAttributes.addFlashAttribute("mess4",  "Tài khoản này đã tồn tại");
				return new ModelAndView("redirect:/dang-ki");
			}
			else {
			RoleDTO roledto=new RoleDTO(2L,"USER");
			RoleEntity eRoleEntity=conVert.toEntity(roledto);
			List<RoleEntity> list_roles=new ArrayList<RoleEntity>();
		    list_roles.add(eRoleEntity);
			UserDTO model =new UserDTO();
			model.setPhone_number(number_phone);
			model.setUserName(username);
			model.setFull_name(fullname);
			model.setAddress(address);
			model.setStatus(1);
			model.setRole_id("2");
		    String id= service.getLastId() ;
		   
		   if(id != null) {
			   System.out.println(id);
				  
			   int number = Integer.parseInt(id);
			   int idplus=number+1;
			   idconvert=Integer.toString(idplus);
		   }
		   else if(id == null) { 
			   idconvert ="1";
		   
		   }
			model.setEntity(list_roles);
		
			if(password.equals(passwordre)) {
				System.out.println(idconvert);
			model.setPassword(encoder.encode(password));
		
			service.save(model);
			
			service.inserttoReRole(idconvert);
			redirectAttributes.addFlashAttribute("mess3",  "Đăng kí thành công!");
			
			return new ModelAndView("redirect:/dang-ki");
			}
			else {
				System.out.println(service);
				redirectAttributes.addFlashAttribute("mess1", "Mật khẩu nhập lại không khớp!");
				return new ModelAndView("redirect:/dang-ki");
			}
			}
			
		} catch (UnsupportedEncodingException e) {
			
			e.printStackTrace();
		}
		
	  
		 
		
		return new ModelAndView("redirect:/dang-ki");
		
	}

}
