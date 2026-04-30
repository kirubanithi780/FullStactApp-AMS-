package com.salemtech.asset_management_system.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.salemtech.asset_management_system.entity.Users;
import com.salemtech.asset_management_system.repository.UserRepo;
import com.salemtech.asset_management_system.utils.JwtUtil;
import com.salemtech.asset_management_system.utils.LoginRequest;

@Service
public class LoginService {
	
	@Autowired
	private UserRepo userRepo;
	
	@Autowired
	private JwtUtil jwt;

//	public String loginRequest(LoginRequest log) {
//		
//	}
//	 
	
}
