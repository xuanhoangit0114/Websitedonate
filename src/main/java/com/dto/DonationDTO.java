package com.dto;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;

public class DonationDTO {
	private Long id;
	
	private String code;
	
	private String decription;
		
	private String end_date;
		
	
	private String image;
	

	private String banner;
	private int money;
		
	private String name;
		
	private String organization_name;
		
	private int status;
	
	private String start_date;
		
	private String created;
	private int goal;
	public int getGoal() {
		return goal;
	}

	public void setGoal(int goal) {
		this.goal = goal;
	}

	private String phone_number;
	
	private Integer page;
	
	private Integer limit;
	
	private Integer totalPage;
	
	private Integer totalItem;
   
	
	
	public DonationDTO(Long id) {
		
		this.id = id;
	}

	public DonationDTO() {
	
	}

	private List<DonationDTO> listResult = new ArrayList<>();

	public List<DonationDTO> getListResult() {
		return listResult;
	}

	public void setListResult(List<DonationDTO> listResult) {
		this.listResult = listResult;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getCode() {
		return code;
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

	public void setCreated(String created) {
		this.created = created;
	}

	public String getPhone_number() {
		return phone_number;
	}

	public void setPhone_number(String phone_number) {
		this.phone_number = phone_number;
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

	@Override
	public String toString() {
		return "DonationDTO [id=" + id + ", code=" + code + ", decription=" + decription + ", end_date=" + end_date
				+ ", money=" + money + ", name=" + name + ", organization_name=" + organization_name + ", status="
				+ status + ", start_date=" + start_date + ", created=" + created + ", phone_number=" + phone_number
				+ "]";
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
