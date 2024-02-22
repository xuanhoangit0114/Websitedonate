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

import com.component.UserConvert;
import com.dto.DonationDTO;
import com.dto.UserDTO;
import com.entity.DonationEntity;
import com.entity.UserEntity;
import com.reponsitory.UserRepon;
import com.service.IUserService;
@Service
public class UserServiceimpl implements IUserService{
  
	@Autowired
	private UserConvert userConvert;
	
	@Autowired
	private UserRepon userRepon;
	
    @PersistenceContext
	    private EntityManager entityManager;

		@Override
		public List<UserDTO> findALL(Pageable pageable) {
			List<UserDTO> users= new ArrayList<>();
			List<UserEntity> entites= userRepon.findAll(pageable).getContent();
			for (UserEntity item: entites) {
				UserDTO DTO= userConvert.toDTO(item);
			
				users.add( DTO);
			}
			return users;
		}
	@Override
	public int getTotalItem() {
		
		return (int) userRepon.count();
	}

	
	public UserDTO FindbyID(Long id) {
		UserDTO dto=new UserDTO();
		UserEntity entity=userRepon.findOne(id);
		 dto= userConvert.toDTO(entity);
		return dto;
	}
	
	@Override
	 public String getLastId() {
	        String jpql = "SELECT CONVERT(MAX(id), CHAR) FROM user";
	        Query query = entityManager.createNativeQuery(jpql);
	       String id=  (String) query.getSingleResult();
	       return id.toString();
	    }
	@Override
	 @Transactional
	    public void inserttoReRole(String id) {
		 String sql = "INSERT INTO user_role  VALUES (:id, 2)";
	        entityManager.createNativeQuery(sql)
	                .setParameter("id", id)
	                
	                .executeUpdate();
		
	    }
	@Override
	 @Transactional
	    public void inserttoReRoleADMIN(String id) {
		 String sql = "INSERT INTO user_role  VALUES (:id, 1)";
	        entityManager.createNativeQuery(sql)
	                .setParameter("id", id)
	                
	                .executeUpdate();
		
	    }
	@Override
	@Transactional
	public UserDTO save(UserDTO dto) {
		 UserEntity entites=new UserEntity();
	        
	        entites=userConvert.toEntity(dto);
			return userConvert.toDTO(userRepon.save(entites));
		
	}

	@Override
	public UserDTO update(UserDTO dto) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	@Transactional
	public void delete(String id) {
		 String sql = "DELETE FROM user_role WHERE userid=:id";
	        entityManager.createNativeQuery(sql)
	                .setParameter("id", id)
	                
	                .executeUpdate();
	        String sql2 = "DELETE FROM user WHERE id=:id";
	        entityManager.createNativeQuery(sql2)
	                .setParameter("id", id)
	                
	                .executeUpdate();
		
	}
	@Override
	@Transactional
	public void lockUser(String id) {
		 String sql = "UPDATE user SET status = 2 WHERE id=:id";
	        entityManager.createNativeQuery(sql)
	                .setParameter("id", id)
	                
	                .executeUpdate();
		
	}
	@Override
	@Transactional
	public void unlockUser(String id) {
		 String sql = "UPDATE user SET status = 1 WHERE id=:id";
	        entityManager.createNativeQuery(sql)
	                .setParameter("id", id)
	                
	                .executeUpdate();
		
	}
	@Override
	public List<UserDTO> findByphone_number(String phonenumber ,Pageable pageable) {
		List<UserEntity> entites=userRepon.findByphonenumber(phonenumber,pageable) ;
		List<UserDTO> users= new ArrayList<>();
		for (UserEntity item: entites) {
			UserDTO DTO= userConvert.toDTO(item);
		
			users.add( DTO);
		}
		return users;
	}
	@Override
	public UserEntity findOneByUserName(String name) {
		
		return userRepon.findOneByUserName(name);
	}

}
