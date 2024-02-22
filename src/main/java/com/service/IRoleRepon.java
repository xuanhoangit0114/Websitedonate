package com.service;

import java.util.List;

import org.springframework.data.domain.Pageable;

import com.dto.RoleDTO;

public interface IRoleRepon {
	
	List<RoleDTO> findALL(Pageable pageable);
	int getTotalItem();
	RoleDTO FindbyID(Long id);
	RoleDTO save(RoleDTO dto);
	RoleDTO update(RoleDTO dto);
	void delete(long[] ids);

}
