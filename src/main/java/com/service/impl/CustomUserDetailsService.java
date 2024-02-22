package com.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.constant.SystemConstant;
import com.dto.MyUser;
import com.entity.RoleEntity;
import com.entity.UserEntity;
import com.reponsitory.UserRepon;
@Service
public class CustomUserDetailsService implements UserDetailsService {
	
	@Autowired
	private UserRepon userRepository;

	@Override
	public UserDetails loadUserByUsername(String user_name) throws UsernameNotFoundException {
		UserEntity userEntity = userRepository.findOneByUserNameAndStatus(user_name, SystemConstant.ACTIVE_STATUS);
		
		if (userEntity == null) {
			throw new UsernameNotFoundException("User not found");
		}
		List<GrantedAuthority> authorities = new ArrayList<>();
		for (RoleEntity role: userEntity.getRoles()) {
			authorities.add(new SimpleGrantedAuthority(role.getRole_name()));
		}
		MyUser myUser = new MyUser(userEntity.getUser_name(), userEntity.getPassword(), 
							true, true, true, true, authorities);
		myUser.setFullName(userEntity.getFull_name());
		myUser.setId(userEntity.getId());
		return myUser;
	}
	


}