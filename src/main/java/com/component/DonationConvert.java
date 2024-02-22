package com.component;

import org.springframework.stereotype.Component;

import com.dto.DonationDTO;
import com.entity.DonationEntity;

@Component
public class DonationConvert {
	
	public DonationDTO toDTO(DonationEntity entity) {
		DonationDTO dto=new DonationDTO();
		dto.setId(entity.getId());
		dto.setCode(entity.getCode());
		dto.setCreated(entity.getCreated());
		dto.setDecription(entity.getDecription());
		dto.setEnd_date(entity.getEnd_date());
		dto.setMoney(entity.getMoney());
		dto.setName(entity.getName());
		dto.setOrganization_name(entity.getOrganization_name());
		dto.setStart_date(entity.getStart_date());
		dto.setPhone_number(entity.getPhone_number());
		dto.setStatus(entity.getStatus());
		dto.setGoal(entity.getGoal());
		dto.setBanner(entity.getBanner());
		dto.setImage(entity.getImage());
		return dto;
	}
	public DonationEntity toEntity(DonationDTO dto) {
		DonationEntity entity=new DonationEntity();
		entity.setId(dto.getId());
		entity.setCode(dto.getCode());
		entity.setCreated(dto.getCreated());
		entity.setDecription(dto.getDecription());
		entity.setEnd_date(dto.getEnd_date());
		entity.setMoney(dto.getMoney());
		entity.setName(dto.getName());
		entity.setOrganization_name(dto.getOrganization_name());
		entity.setStart_date(dto.getStart_date());
		entity.setPhone_number(dto.getPhone_number());
		entity.setStatus(dto.getStatus());
		entity.setGoal(dto.getGoal());
		entity.setBanner(dto.getBanner());
		entity.setImage(dto.getImage());
		
		return entity;
	}

}
