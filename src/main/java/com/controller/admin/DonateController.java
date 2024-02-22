package com.controller.admin;

import java.io.UnsupportedEncodingException;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import com.service.IDonationService;
@Controller(value="donate_admin")
public class DonateController {
	
	
	@Autowired
	private IDonationService donationService;
	@RequestMapping(value = "/quan-tri/donate", method = RequestMethod.GET)
	public ModelAndView homePage(@RequestParam("page") int page, @RequestParam("limit") int limit,
			HttpServletRequest request, HttpSession session) throws UnsupportedEncodingException {
		request.setCharacterEncoding("UTF-8");
		DonationDTO model_d = new DonationDTO();
		model_d.setPage(page);
		model_d.setLimit(limit);
		ModelAndView mav = new ModelAndView("/admin/donation");
		Pageable pageable = new PageRequest(page-1 , limit);
		model_d.setListResult(donationService.findALL(pageable));
		model_d.setTotalItem(donationService.getTotalItem());
		model_d.setTotalPage((int) Math.ceil((double) model_d.getTotalItem() / model_d.getLimit()));
	    
	
		mav.addObject("model_d", model_d);
		
		return mav;
	}
	
	@RequestMapping(value = "/quan-tri/end_donate", method = RequestMethod.POST)
	public ModelAndView LockUser(@RequestParam("id") String id,HttpServletRequest request, HttpSession session) throws UnsupportedEncodingException {
		request.setCharacterEncoding("UTF-8");
		System.out.println(id);
		donationService.endState(id);

		return new ModelAndView("redirect:/quan-tri/donate?page=1&limit=100");
	}
	@RequestMapping(value = "/quan-tri/close_donate", method = RequestMethod.POST)
	public ModelAndView unLockUser(@RequestParam("id") String id,HttpServletRequest request, HttpSession session) throws UnsupportedEncodingException {
		request.setCharacterEncoding("UTF-8");
		donationService.closeState(id);

		return new ModelAndView("redirect:/quan-tri/donate?page=1&limit=100");
	}
	
	@RequestMapping(value = "/quan-tri/delete-donate", method = RequestMethod.POST)
	public ModelAndView DeletedUser(@RequestParam("id") String id,HttpServletRequest request, HttpSession session) throws UnsupportedEncodingException {
		request.setCharacterEncoding("UTF-8");
		donationService.delete(id);

		return new ModelAndView("redirect:/quan-tri/donate?page=1&limit=100");
	}
	
	@RequestMapping(value = "/quan-tri/add_donate",method = RequestMethod.POST)
	public ModelAndView addPage(HttpSession session,HttpServletRequest request,HttpServletResponse response,
			@RequestParam("code") String code,@RequestParam("name") String name
			,@RequestParam("start") String start,@RequestParam("end") String end,
			@RequestParam("tochuc") String tochuc,
			@RequestParam("sdt") String sdt,@RequestParam("goal") int goal,@RequestParam("noidung") String noidung,@RequestParam("banner") String banner
			,@RequestParam("image") String image) throws UnsupportedEncodingException {	
		request.setCharacterEncoding("UTF-8");
		  ZonedDateTime zonedDateTime = ZonedDateTime.now();
		  DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy");
		  String datenow = zonedDateTime.format(formatter);
		  
		DonationDTO model =new DonationDTO();
		
		model.setCode(code);
		model.setName(name);
		model.setStart_date(start);
		model.setEnd_date(end);
		model.setStatus(1);
		model.setOrganization_name(tochuc);
		model.setPhone_number(sdt);
	    model.setGoal(goal);
	    model.setImage(image);
	    model.setBanner(banner);
	    model.setCreated(datenow);
	    model.setDecription(noidung);
		System.out.println(model.toString());
		donationService.save(model);	
		
		return new ModelAndView("redirect:/quan-tri/donate?page=1&limit=100");
}
	@RequestMapping(value = "/quan-tri/update_donate",method = RequestMethod.POST)
	public ModelAndView upadatePage(HttpSession session,HttpServletRequest request,HttpServletResponse response,@RequestParam("id") String id,
			@RequestParam("code") String code,@RequestParam("name") String name
			,@RequestParam("start") String start,@RequestParam("end") String end,
			@RequestParam("tochuc") String tochuc,
			@RequestParam("sdt") String sdt,@RequestParam("goal") int goal,@RequestParam("money") int money,@RequestParam("status") int status,@RequestParam("noidung") String noidung,@RequestParam("banner") String banner
			,@RequestParam("image") String image) throws UnsupportedEncodingException {	
		request.setCharacterEncoding("UTF-8");
		  ZonedDateTime zonedDateTime = ZonedDateTime.now();
		  DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy");
		  String datenow = zonedDateTime.format(formatter);
		  
		DonationDTO model =new DonationDTO();
		Long id_i=Long.parseLong(id);
		model.setId(id_i);
		model.setCode(code);
		model.setName(name);
		model.setStart_date(start);
		model.setEnd_date(end);
		model.setStatus(status);
		model.setOrganization_name(tochuc);
		model.setPhone_number(sdt);
	    model.setGoal(goal);
	    model.setImage(image);
	    model.setBanner(banner);
	    model.setCreated(datenow);
	    model.setDecription(noidung);
	    model.setMoney(money);
		
		donationService.save(model);	
		
		return new ModelAndView("redirect:/quan-tri/donate?page=1&limit=100");
}


}
