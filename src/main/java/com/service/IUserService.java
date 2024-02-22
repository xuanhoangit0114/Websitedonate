package com.service;

import java.util.List;

import org.springframework.data.domain.Pageable;

import com.dto.UserDTO;
import com.entity.UserEntity;

public interface IUserService {
	List<UserDTO> findALL(Pageable pageable);
	int getTotalItem();
	UserDTO FindbyID(Long id);
	UserDTO save(UserDTO dto);
	UserDTO update(UserDTO dto);
	void delete(String id);
	void inserttoReRole(String id) ;
	public void inserttoReRoleADMIN(String id);
	public String getLastId();
	public void lockUser(String id);
	public void unlockUser(String id);
	List<UserDTO> findByphone_number(String phone_number,Pageable pageable);
	UserEntity findOneByUserName(String name);
}
