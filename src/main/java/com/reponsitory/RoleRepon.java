package com.reponsitory;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.entity.RoleEntity;
@Repository
public interface RoleRepon extends JpaRepository<RoleEntity, Long>{

}
