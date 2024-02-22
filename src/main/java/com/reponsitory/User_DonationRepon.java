package com.reponsitory;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.entity.User_DonationEntity;
@Repository
public interface User_DonationRepon extends JpaRepository<User_DonationEntity, Long> {

}
