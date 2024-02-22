package com.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.component.User_DonationConvert;
import com.dto.DonationDTO;
import com.dto.User_DonationDTO;
import com.entity.DonationEntity;
import com.entity.User_DonationEntity;
import com.reponsitory.User_DonationRepon;
import com.service.IUser_DonationService;



@Service
public class User_DonationServiceimpl implements IUser_DonationService{

	@Autowired
	private User_DonationConvert convert;
	
	@Autowired
	private User_DonationRepon repon;
	
	@PersistenceContext
    private EntityManager entityManager;
	
	@Override
	public List<User_DonationDTO> findALL(Pageable pageable) {
		  List<User_DonationDTO> user_donations = new ArrayList<>();
	        List<User_DonationEntity> resultList = repon.findAll(pageable).getContent();
	        for (User_DonationEntity item: resultList) {
	        	User_DonationDTO DTO= convert.toDTO(item);
			
				user_donations.add(DTO);
			}
		return user_donations;
	}

	@Override
	public int getTotalItem() {
		return (int) repon.count();
	}

	@Override
	public User_DonationDTO FindbyID(Long id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	@Transactional
	public User_DonationDTO save(User_DonationDTO dto) {
		 User_DonationEntity entites=new User_DonationEntity();
	     
	        entites=convert.toEntity(dto);
			return convert.toDTO(repon.save(entites));
	}

	@Override
	public User_DonationDTO update(User_DonationDTO dto) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void delete(long[] ids) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<User_DonationDTO> findByDonate_id(Long id) {
		  String sql = "SELECT * FROM user_donation WHERE id_donate = :id";
	        Query query = entityManager.createNativeQuery(sql, User_DonationEntity.class);
	        query.setParameter("id", id);

	        // Lấy kết quả truy vấn
	        List<User_DonationDTO> user_donations = new ArrayList<>();
	        List<User_DonationEntity> resultList = query.getResultList();
	        for (User_DonationEntity item: resultList) {
	        	User_DonationDTO DTO= convert.toDTO(item);
			
				user_donations.add(DTO);
			}
		return user_donations;
	}
	@Override
	@Transactional
	public void checkBill(String id) {
		 String sql = "UPDATE user_donation SET status = 2 WHERE id=:id";
	        entityManager.createNativeQuery(sql)
	                .setParameter("id", id)
	                
	                .executeUpdate();
		
	}
	@Override
	@Transactional
	public void uncheckBill(String id) {
		 String sql = "UPDATE user_donation SET status = 1 WHERE id=:id";
	        entityManager.createNativeQuery(sql)
	                .setParameter("id", id)
	                
	                .executeUpdate();
		
	}

}
