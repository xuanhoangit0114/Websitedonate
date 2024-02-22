package com.controller.admin;

import java.io.UnsupportedEncodingException;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.dto.DonationDTO;
import com.dto.UserDTO;
import com.dto.User_DonationDTO;
import com.service.IDonationService;
import com.service.IUser_DonationService;

@Controller(value = "listdonate_admin")
public class BillController {
	@Autowired(required = true)
	private IDonationService donationServiceimpl;
	@Autowired
	private IUser_DonationService service;
	@RequestMapping(value = "/quan-tri/bill", method = RequestMethod.GET)
	public ModelAndView UserPage(@RequestParam("page") int page, @RequestParam("limit") int limit,
			HttpServletRequest request, HttpSession session) throws UnsupportedEncodingException {
		request.setCharacterEncoding("UTF-8");
		User_DonationDTO model_bill = new User_DonationDTO();
		
		model_bill.setPage(page);
		model_bill.setLimit(limit);
		ModelAndView mav = new ModelAndView("/admin/listdonate");
		Pageable pageable = new PageRequest(page-1 , limit);
		
		model_bill.setListResult(service.findALL(pageable));
	
	   model_bill.setTotalItem(service.getTotalItem());
	   model_bill.setTotalPage((int) Math.ceil((double) model_bill.getTotalItem() / model_bill.getLimit()));
	    

		mav.addObject("model_bill", model_bill);
		
		return mav;

	}
	@RequestMapping(value = "/quan-tri/check_bill", method = RequestMethod.POST)
	public ModelAndView checkBill(@RequestParam("id") String id,@RequestParam("id_donate") String id_donate,@RequestParam("money") int moneycheck,HttpServletRequest request, HttpSession session) throws UnsupportedEncodingException {
		request.setCharacterEncoding("UTF-8");
		System.out.println(id);
		service.checkBill(id);
		Long id_onedonate=Long.parseLong(id_donate);
		DonationDTO dto=donationServiceimpl.FindbyID(id_onedonate);
		DonationDTO dto_input=new DonationDTO();
		dto_input.setId(id_onedonate);
		dto_input.setCode(dto.getCode());
		dto_input.setDecription(dto.getDecription());
		dto_input.setEnd_date(dto.getEnd_date());
		dto_input.setGoal(dto.getGoal());
		dto_input.setStart_date(dto.getStart_date());
	    dto_input.setName(dto.getName());
	    dto_input.setImage(dto.getImage());
	    dto_input.setBanner(dto.getBanner());
	    dto_input.setPhone_number(dto.getPhone_number());
	    dto_input.setCreated(dto.getCreated());
	    dto_input.setMoney(dto.getMoney()+moneycheck);	
	    dto_input.setStatus(dto.getStatus());
        dto_input.setOrganization_name(dto.getOrganization_name());
        donationServiceimpl.save(dto_input);
		return new ModelAndView("redirect:/quan-tri/bill?page=1&limit=100");
	}
	@RequestMapping(value = "/quan-tri/un_check_bill", method = RequestMethod.POST)
	public ModelAndView unLockUser(@RequestParam("id") String id,@RequestParam("money") int moneycheck,@RequestParam("id_donate") String id_donate,HttpServletRequest request, HttpSession session) throws UnsupportedEncodingException {
		request.setCharacterEncoding("UTF-8");
		service.uncheckBill(id);
		Long id_onedonate=Long.parseLong(id_donate);
		DonationDTO dto=donationServiceimpl.FindbyID(id_onedonate);
		DonationDTO dto_input=new DonationDTO();
		dto_input.setId(id_onedonate);
		dto_input.setCode(dto.getCode());
		dto_input.setDecription(dto.getDecription());
		dto_input.setEnd_date(dto.getEnd_date());
		dto_input.setGoal(dto.getGoal());
		dto_input.setStart_date(dto.getStart_date());
	    dto_input.setName(dto.getName());
	    dto_input.setImage(dto.getImage());
	    dto_input.setBanner(dto.getBanner());
	    dto_input.setPhone_number(dto.getPhone_number());
	    dto_input.setCreated(dto.getCreated());
	    dto_input.setMoney(dto.getMoney()-moneycheck);	
	    dto_input.setStatus(dto.getStatus());
        dto_input.setOrganization_name(dto.getOrganization_name());
        donationServiceimpl.save(dto_input);
		return new ModelAndView("redirect:/quan-tri/bill?page=1&limit=100");
	}
	

}
