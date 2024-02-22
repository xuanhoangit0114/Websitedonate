package com.service;

import java.util.List;

import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;

import com.dto.DonationDTO;

public interface IDonationService {
	
	List<DonationDTO> findALL(Pageable pageable);
	int getTotalItem();
	DonationDTO FindbyID(Long id);
	DonationDTO save(DonationDTO dto);
	DonationDTO update(DonationDTO dto);
	void delete(String id);
	public void closeState(String id);
	public void endState(String id);
}
