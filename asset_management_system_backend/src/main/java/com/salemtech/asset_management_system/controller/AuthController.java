package com.salemtech.asset_management_system.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.salemtech.asset_management_system.entity.Users;
import com.salemtech.asset_management_system.repository.UserRepo;
import com.salemtech.asset_management_system.utils.JwtUtil;
import com.salemtech.asset_management_system.utils.LoginRequest;

//@CrossOrigin("*")
@RestController
@RequestMapping("/admin")
public class AuthController {

    @Autowired
    private UserRepo userRepo;

    @Autowired
    private JwtUtil jwt;

    @PostMapping("/login")
    public String loginRequest(@RequestBody LoginRequest log) { 
        Users user = userRepo.findByEmail(log.getEmail());
        
        if (user != null && BCrypt.checkpw(log.getPassword(), user.getPassword())
             && 
            "Admin".equalsIgnoreCase(user.getRole())) {
            
            return jwt.generateToken(user.getEmail());
        }

        return "invalid";
    }
    
    @PostMapping("/app/login")
    public boolean appLoginRequest(@RequestBody LoginRequest log) {
    	Users user=userRepo.findByEmail(log.getEmail());
    	if(user !=null && user.getPassword().equals(log.getPassword()) && "Employee".equalsIgnoreCase(user.getRole())) {
    		return true;
    		
    	}
    	return false;
    }
}
