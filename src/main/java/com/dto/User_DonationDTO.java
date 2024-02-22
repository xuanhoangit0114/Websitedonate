package com.dto;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import com.entity.DonationEntity;
import com.entity.UserEntity;

public class User_DonationDTO {

	private Long id;

	
	private String created;
	

	private int money;
	
	
	private String name;
	
	
	private int status;
	
	
	private String text;
	private String code;
	
	
	private int id_user;
	

	private String id_donate;
private Integer page;
	
	private Integer limit;
	
	private Integer totalPage;
	
	private Integer totalItem;
	private List<User_DonationDTO> listResult = new ArrayList<>();
	
	
	
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public List<User_DonationDTO> getListResult() {
		return listResult;
	}
	public void setListResult(List<User_DonationDTO> listResult) {
		this.listResult = listResult;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
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
