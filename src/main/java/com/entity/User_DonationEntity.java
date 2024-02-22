package com.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name="user_donation")
public class User_DonationEntity {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@Column(name="created")
	private String created;
	
	@Column(name="money")
	private int money;
	
	@Column(name="name")
	private String name;
	
	@Column(name="status")
	private int status;
	
	@Column(name="text")
	private String text;
	
	@Column(name="id_user")
	
	private int id_user;
	
	@Column(name="id_donate")
	private String id_donate;
	
	@Column(name="code")
	private String code;
	
	
	
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getCreated() {
		return created;
	}
	public void setCreated(String created) {
		this.created = created;
	}
	public int getMoney() {
		return money;
	}
	public void setMoney(int money) {
		this.money = money;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public int getId_user() {
		return id_user;
	}
	public void setId_user(int id_user) {
		this.id_user = id_user;
	}
	public String getId_donate() {
		return id_donate;
	}
	public void setId_donate(String id_donate) {
		this.id_donate = id_donate;
	}
	
	
	
	
}
