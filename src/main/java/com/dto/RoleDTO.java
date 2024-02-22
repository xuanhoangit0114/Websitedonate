package com.dto;

import java.util.ArrayList;
import java.util.List;

import com.entity.UserEntity;

public class RoleDTO {
	
	private Long id;
	
	
	private String role_name;
	
	private List<UserDTO> users = new ArrayList<>();
	

	public RoleDTO() {
		
	}




	public RoleDTO(Long id, String role_name) {
	
		this.id = id;
		this.role_name = role_name;
	}




	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getRole_name() {
		return role_name;
	}

	public List<UserDTO> getUsers() {
		return users;
	}

	public void setUsers(List<UserDTO> users) {
		this.users = users;
	}

	public void setRole_name(String role_name) {
		this.role_name = role_name;
	}


	@Override
	public String toString() {
		return "RoleDTO [id=" + id + ", role_name=" + role_name + ", users=" + users + "]";
	}
	

   
	


}
