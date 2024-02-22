package com.service;

import java.util.List;

import org.springframework.data.domain.Pageable;

import com.dto.User_DonationDTO;
import com.entity.User_DonationEntity;

public interface IUser_DonationService {
	List<User_DonationDTO> findALL(Pageable pageable);
	int getTotalItem();
	User_DonationDTO FindbyID(Long id);
	User_DonationDTO save(User_DonationDTO dto);
	User_DonationDTO update(User_DonationDTO dto);
	void delete(long[] ids);
	
	List <User_DonationDTO> findByDonate_id(Long id);
	public void checkBill(String id);
	public void uncheckBill(String id);
}
