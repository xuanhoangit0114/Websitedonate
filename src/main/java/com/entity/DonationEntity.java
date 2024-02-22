package com.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
@Entity
@Table(name="donation")
public class DonationEntity {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	@Column(name="code")
	private String code;
	
	@Column(name="decription")
	private String decription;
	
	@Column(name="end_date")
	private String end_date;
	
	@Column(name="money")
	private int money;
	@Column(name="goal")
	private int goal;
	@Column(name="image")
	private String image;
	
	@Column(name="banner")
	private String banner;


	@Column(name="name")
	private String name;
	
	@Column(name="organization_name")
	private String organization_name;
	@Column(name="status")
	
	private int status;
	@Column(name="start_date")
	private String start_date;
	
	@Column(name="created")
	private String created;
	
	@Column(name="phone_number")
	private String phone_number;
	


	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getDecription() {
		return decription;
	}

	public void setDecription(String decription) {
		this.decription = decription;
	}

	public String getEnd_date() {
		return end_date;
	}

	public void setEnd_date(String end_date) {
		this.end_date = end_date;
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

	public String getOrganization_name() {
		return organization_name;
	}

	public void setOrganization_name(String organization_name) {
		this.organization_name = organization_name;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getStart_date() {
		return start_date;
	}

	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}

	public String getCreated() {
		return created;
	}
public DonationEntity(Long id) {
		
		this.id = id;
	}

	public DonationEntity() {
	
	}

	public void setCreated(String created) {
		this.created = created;
	}

	public String getPhone_number() {
		return phone_number;
	}

	public void setPhone_number(String phone_number) {
		this.phone_number = phone_number;
	}

	@Override
	public String toString() {
		return "DonationEntity [id=" + id + ", code=" + code + ", decription=" + decription + ", end_date=" + end_date
				+ ", money=" + money + ", name=" + name + ", organization_name=" + organization_name + ", status="
				+ status + ", start_date=" + start_date + ", created=" + created + ", phone_number=" + phone_number
				+ ", donations=" ;
	}

	
	public int getGoal() {
		return goal;
	}

	public void setGoal(int goal) {
		this.goal = goal;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getBanner() {
		return banner;
	}

	public void setBanner(String banner) {
		this.banner = banner;
	}
	

}
