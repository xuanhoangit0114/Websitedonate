package com.reponsitory;

import java.util.List;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.entity.UserEntity;
@Repository
public interface UserRepon extends JpaRepository<UserEntity, Long>{
	UserEntity findOneByUserNameAndStatus(String name, int status);
	List<UserEntity>  findByphonenumber(String phonenumber,Pageable pageable);
	UserEntity findOneByUserName(String name);
}
