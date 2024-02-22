package com.component;

import org.springframework.stereotype.Component;

import com.dto.User_DonationDTO;
import com.entity.User_DonationEntity;
@Component
public class User_DonationConvert {
	
	public User_DonationDTO toDTO(User_DonationEntity entity) {
		User_DonationDTO dto=new User_DonationDTO();
		dto.setId(entity.getId());
		dto.setCreated(entity.getCreated());
		dto.setMoney(entity.getMoney());
		dto.setText(entity.getText());
		dto.setId_user(entity.getId_user());
		dto.setId_donate(entity.getId_donate());
		dto.setStatus(entity.getStatus());
		dto.setName(entity.getName());
		dto.setCode(entity.getCode());
		
		return dto;
	}
	public User_DonationEntity toEntity(User_DonationDTO dto) {
		User_DonationEntity entity=new User_DonationEntity();
		entity.setId(dto.getId());
		entity.setCreated(dto.getCreated());
		entity.setMoney(dto.getMoney());
		entity.setText(dto.getText());
		entity.setId_user(dto.getId_user());
		entity.setId_donate(dto.getId_donate());
		entity.setStatus(dto.getStatus());
		entity.setName(dto.getName());
		entity.setCode(dto.getCode());
				
		return entity;
	}

}
