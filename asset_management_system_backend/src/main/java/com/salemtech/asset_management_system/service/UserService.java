package com.salemtech.asset_management_system.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Service;

import com.salemtech.asset_management_system.entity.Users;
import com.salemtech.asset_management_system.repository.UserRepo;

@Service
public class UserService {
	@Autowired
	private UserRepo userRepo;

	public void addUser(Users user) {
		String hashedPassword = BCrypt.hashpw(user.getPassword(), BCrypt.gensalt(12));
		user.setPassword(hashedPassword);
		userRepo.save(user);
	}

	public List<Users> getAllUsers() {
		return userRepo.findAll();
	}

	public void addUserApp(Users user) {
		user.setRole("Employee");
		userRepo.save(user);
	}

	public Users getUserByEmail(String email) {
		
		return userRepo.findByEmail(email);
	}
	
	
}
