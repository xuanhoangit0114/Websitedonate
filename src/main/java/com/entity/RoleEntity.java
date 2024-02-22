package com.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
@Entity
@Table(name="role")
public class RoleEntity {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@Column(name="role_name")
	private String role_name;

	
	
	
	public RoleEntity(Long id, String role_name) {
	
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

	public List<UserEntity> getUsers() {
		return users;
	}

	public void setUsers(List<UserEntity> users) {
		this.users = users;
	}

	public void setRole_name(String role_name) {
		this.role_name = role_name;
	}
	
	
	@ManyToMany(mappedBy = "roles")

    private List<UserEntity> users = new ArrayList<>();

	public RoleEntity() {
	
	}

	public RoleEntity(Long id) {
	
		this.id = id;
	}
	
    
}
