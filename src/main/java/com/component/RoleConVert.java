package com.component;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;

import com.dto.RoleDTO;
import com.dto.UserDTO;
import com.entity.RoleEntity;
import com.entity.UserEntity;
@Component
public class RoleConVert {

	
	public RoleDTO toDTO(RoleEntity entity) {
		RoleDTO dto=new RoleDTO();
		List<UserDTO>  USERdto=new ArrayList<UserDTO>();
		dto.setId(entity.getId());
		dto.setRole_name(entity.getRole_name());
		dto.setUsers(USERdto);
		
		return dto;
	}
	public RoleEntity toEntity(RoleDTO dto) {
		RoleEntity entity=new RoleEntity();
		List<UserEntity>  Uentity=new ArrayList<UserEntity>();
		entity.setId(dto.getId());
		entity.setRole_name(dto.getRole_name());
		entity.setUsers(Uentity);
		
		return entity;
	}
}
