package com.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.dto.MyUser;
import com.service.impl.CustomUserDetailsService;

@RestController
public class UserAPI {
	
	@Autowired
	private CustomUserDetailsService service;
	@Autowired
	
	private PasswordEncoder encoder;
	
	@PostMapping("/api/login")
	public ResponseEntity<String> login(@RequestParam("username") String username, @RequestParam("password") String password) {
		

		    try {
		        UserDetails userDetails = service.loadUserByUsername(username);

		        // Thực hiện kiểm tra mật khẩu
		        if (encoder.matches(password, userDetails.getPassword())) {
		            // Mật khẩu đúng, tạo JWT hoặc cung cấp token xác thực
		        
		            return ResponseEntity.ok("Login successful!");
		        } else {
		            // Mật khẩu không đúng
		            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("Invalid password");
		        }
		    } catch (UsernameNotFoundException e) {
		        // Người dùng không tồn tại
		        return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("User not found");
		    }
	}
}
