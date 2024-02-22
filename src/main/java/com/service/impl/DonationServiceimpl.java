package com.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.component.DonationConvert;
import com.dto.DonationDTO;
import com.entity.DonationEntity;
import com.reponsitory.DonnationRepon;
import com.service.IDonationService;
@Service
public class DonationServiceimpl implements IDonationService{

	@Autowired
	private DonnationRepon donnationRepon;
	@Autowired
	private DonationConvert donationConvert;
	@PersistenceContext
	    private EntityManager entityManager;
	
	@Override
	public List<DonationDTO> findALL(Pageable pageable) {
		List<DonationDTO> donations = new ArrayList<>();
		
		List<DonationEntity> entites= donnationRepon.findAll(pageable).getContent();
		for (DonationEntity item: entites) {
			DonationDTO DTO= donationConvert.toDTO(item);
		
			donations.add( DTO);
		}
		return donations;
	}

	@Override
	public int getTotalItem() {
		return (int) donnationRepon.count();
	}

	@Override
	public DonationDTO FindbyID(Long id) {
		DonationDTO dto=new DonationDTO();
		DonationEntity entity=donnationRepon.findOne(id);
		 dto= donationConvert.toDTO(entity);
		return dto;
	}

	@Override
	@Transactional
	public DonationDTO save(DonationDTO dto) {
     DonationEntity entites=new DonationEntity();
     
        entites=donationConvert.toEntity(dto);
		return donationConvert.toDTO(donnationRepon.save(entites));
	}

	@Override
	public DonationDTO update(DonationDTO dto) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	@Transactional
	public void delete(String id) {
		 String sql = "DELETE FROM donation WHERE id=:id";
	        entityManager.createNativeQuery(sql)
	                .setParameter("id", id)
	                
	                .executeUpdate();
	    
		
	}
	@Override
	@Transactional
	public void closeState(String id) {
		 String sql = "UPDATE donation SET status = 3 WHERE id=:id";
	        entityManager.createNativeQuery(sql)
	                .setParameter("id", id)
	                
	                .executeUpdate();
		
	}
	@Override
	@Transactional
	public void endState(String id) {
		 String sql = "UPDATE donation SET status = 4 WHERE id=:id";
	        entityManager.createNativeQuery(sql)
	                .setParameter("id", id)
	                
	                .executeUpdate();
		
	}

}
