package com.component;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;

import com.dto.RoleDTO;
import com.dto.UserDTO;
import com.entity.RoleEntity;
import com.entity.UserEntity;

@Component
public class UserConvert {
	
	public UserDTO toDTO(UserEntity entity) {
		UserDTO dto=new UserDTO();
		List<RoleDTO> roledto=new ArrayList<RoleDTO>();
		dto.setId(entity.getId());
		dto.setAddress(entity.getAddress());
		dto.setEmail(entity.getEmail());
		dto.setFull_name(entity.getFull_name());
		dto.setPassword(entity.getPassword());
		dto.setNote(entity.getNote());
		dto.setStatus(entity.getStatus());
	
		dto.setUser_name(entity.getUserName());
		dto.setUserName(entity.getUserName());
		dto.setPhone_number(entity.getPhone_number());
		dto.setRoles(roledto);
		dto.setRole_id(entity.getRole_id());
		
		return dto;
	}
	public UserEntity toEntity(UserDTO dto) {
		UserEntity entity=new UserEntity();
		List<RoleEntity> roledentity=new ArrayList<RoleEntity>();
		entity.setId(dto.getId());
		entity.setAddress(dto.getAddress());
		entity.setEmail(dto.getEmail());
		entity.setFull_name(dto.getFull_name());
		entity.setPassword(dto.getPassword());
		entity.setNote(dto.getNote());
		entity.setStatus(dto.getStatus());
		entity.setRole_id(dto.getRole_id());
		entity.setUser_name(dto.getUserName());
		entity.setUserName(dto.getUserName());
		entity.setPhone_number(dto.getPhone_number());
		entity.setRoles(roledentity);
		
		return entity;
	}

}
