package com.api;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.dto.DonationDTO;
import com.service.IDonationService;
import com.service.IUser_DonationService;


@RestController(value = "billAPIOfAdmin")
public class BillAPI {
	@Autowired
	private IUser_DonationService service;
	@Autowired(required = true)
	private IDonationService donationServiceimpl;
	@PostMapping("/api/check_bill")
	public ResponseEntity<String> checkBill(@RequestParam("id") String id,@RequestParam("money") int moneycheck,HttpServletRequest request, HttpSession session) throws UnsupportedEncodingException {
		request.setCharacterEncoding("UTF-8");
		System.out.println(id);
		service.checkBill(id);
		Long id_onedonate=Long.parseLong(id);
		DonationDTO dto=donationServiceimpl.FindbyID(id_onedonate);
		DonationDTO dto_input=new DonationDTO();
		dto_input.setId(id_onedonate);
		dto_input.setCode(dto.getCode());
		dto_input.setDecription(dto.getDecription());
		dto_input.setEnd_date(dto.getEnd_date());
		dto_input.setGoal(dto.getGoal());
		dto_input.setStart_date(dto.getStart_date());
	    dto_input.setName(dto.getName());
	    dto_input.setPhone_number(dto.getPhone_number());
	    dto_input.setCreated(dto.getCreated());
	    dto_input.setMoney(dto.getMoney()+moneycheck);	
	    dto_input.setStatus(dto.getStatus());
        dto_input.setOrganization_name(dto.getOrganization_name());
        donationServiceimpl.save(dto_input);
        return ResponseEntity.ok("Check successful!");
	}

}
