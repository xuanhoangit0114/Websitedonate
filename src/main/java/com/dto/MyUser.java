package com.dto;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

public class MyUser extends User {

	
	private static final long serialVersionUID = -6814087210676313219L;

	public MyUser(String user_name, String password, boolean enabled, boolean accountNonExpired,
			boolean credentialsNonExpired, boolean accountNonLocked,
			Collection<? extends GrantedAuthority> authorities) {
		super(user_name, password, enabled, accountNonExpired, credentialsNonExpired, accountNonLocked, authorities);
	}
	
	private String full_name;
	private Long  id;
	public String getFullName() {
		return full_name;
	}

	public void setFullName(String fullName) {
		this.full_name = fullName;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}
	
}