package com.bean;

import org.springframework.context.annotation.Bean;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;


public class EncodePassword {
	@Bean
	public PasswordEncoder encoder() {
	    return new BCryptPasswordEncoder();
	}

}
