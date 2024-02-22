package com.dto;

import java.util.ArrayList;
import java.util.List;

import com.entity.RoleEntity;

public class UserDTO {

	
	private Long id;
	
	
	private String address;
	

	private String email;
	
	
	private String full_name;
	
	
	private String note;
	

	private String password;
	
	
	private String phone_number;

	
	private int status;

	private String userName;
	

	private String created;
	

	private Integer page;
	
	private Integer limit;
	
	private Integer totalPage;
	
	private Integer totalItem;
	private String role_id;


	public String getRole_id() {
		return role_id;
	}



	public void setRole_id(String role_id) {
		this.role_id = role_id;
	}


	public Integer getPage() {
		return page;
	}



	public void setPage(Integer page) {
		this.page = page;
	}



	public Integer getLimit() {
		return limit;
	}



	public void setLimit(Integer limit) {
		this.limit = limit;
	}



	public Integer getTotalPage() {
		return totalPage;
	}



	public void setTotalPage(Integer totalPage) {
		this.totalPage = totalPage;
	}



	public Integer getTotalItem() {
		return totalItem;
	}



	public void setTotalItem(Integer totalItem) {
		this.totalItem = totalItem;
	}



	private List<RoleDTO> roles = new ArrayList<>();
	private List<RoleEntity> entity = new ArrayList<>();
	
	
	
	
	private List<UserDTO> listResult = new ArrayList<>();
		public List<RoleEntity> getEntity() {
		return entity;
	}



	public void setEntity(List<RoleEntity> entity) {
		this.entity = entity;
	}



		public String getUserName() {
		return userName;
	}



	public List<RoleDTO> getRoles() {
			return roles;
		}



		public void setRoles(List<RoleDTO> roles) {
			this.roles = roles;
		}



	public void setUserName(String userName) {
		this.userName = userName;
	}



		
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getFull_name() {
		return full_name;
	}

	public void setFull_name(String full_name) {
		this.full_name = full_name;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPhone_number() {
		return phone_number;
	}

	public void setPhone_number(String phone_number) {
		this.phone_number = phone_number;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getUser_name() {
		return userName;
	}

	public void setUser_name(String userName) {
		this.userName = userName;
	}

	public String getCreated() {
		return created;
	}

	public void setCreated(String created) {
		this.created = created;
	}




	public List<UserDTO> getListResult() {
		return listResult;
	}



	public void setListResult(List<UserDTO> listResult) {
		this.listResult = listResult;
	}



	@Override
	public String toString() {
		return "UserDTO [id=" + id + ", address=" + address + ", email=" + email + ", full_name=" + full_name
				+ ", note=" + note + ", password=" + password + ", phone_number=" + phone_number + ", status=" + status
				+ ", userName=" + userName + ", created=" + created + ", roles=" + roles + "]";
	}



	
}
