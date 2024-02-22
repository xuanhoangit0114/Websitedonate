package com.reponsitory;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.entity.DonationEntity;
@Repository
public interface DonnationRepon extends JpaRepository<DonationEntity, Long>{


}
