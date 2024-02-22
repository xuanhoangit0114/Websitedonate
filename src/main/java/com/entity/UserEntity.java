package com.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityListeners;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import org.springframework.data.jpa.domain.support.AuditingEntityListener;

@Entity
@Table (name="user")
@EntityListeners(AuditingEntityListener.class)
public class UserEntity {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@Column(name="address")
	private String address;
	
	@Column(name="email")
	private String email;
	
	@Column(name="full_name")
	private String full_name;
	
	@Column(name="note")
	private String note;
	
	@Column(name="password")
	private String password;
	
	@Column(name="phonenumber")
	private String phonenumber;
	@Column(name="status")
	
	private int status;
	@Column(name="userName")
	private String userName;
	
	@Column(name="created")
	private String created;
	@Column(name="role_id")
	private String role_id;


	public String getRole_id() {
		return role_id;
	}



	public void setRole_id(String role_id) {
		this.role_id = role_id;
	}



	@ManyToMany(fetch = FetchType.LAZY,cascade = CascadeType.ALL)
	@JoinTable(name = "user_role", joinColumns = @JoinColumn(name = "userid"), 
								  inverseJoinColumns = @JoinColumn(name = "roleid"))
	
	
	private List<RoleEntity> roles = new ArrayList<>();

	public List<RoleEntity> getRoles() {
		return roles;
	}
    

	  
		public UserEntity(Long id) {
		
		this.id = id;
	}



		public String getUserName() {
		return userName;
	}



	public void setUserName(String userName) {
		this.userName = userName;
	}



		public UserEntity() {
			
		}


	public void setRoles(List<RoleEntity> roles) {
		this.roles = roles;
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
		return phonenumber;
	}

	public void setPhone_number(String phone_number) {
		this.phonenumber = phone_number;
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



	@Override
	public String toString() {
		return "UserEntity [id=" + id + ", address=" + address + ", email=" + email + ", full_name=" + full_name
				+ ", note=" + note + ", password=" + password + ", phone_number=" + phonenumber + ", status=" + status
				+ ", userName=" + userName + ", created=" + created + ", roles=" + roles
				+ ", donations=" ;
	}
	
	
}
