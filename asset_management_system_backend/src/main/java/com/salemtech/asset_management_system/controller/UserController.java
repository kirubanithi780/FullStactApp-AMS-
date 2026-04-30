package com.salemtech.asset_management_system.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.salemtech.asset_management_system.entity.Users;
import com.salemtech.asset_management_system.service.UserService;

//@CrossOrigin("*")
@RestController
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@PostMapping("/signin")
	public String addUser(@RequestBody Users user) {
		userService.addUser(user);
		return "signed sucess";
	}
	@GetMapping("/get")
	public List<Users> getAllUsers(){
		return userService.getAllUsers();
	}
	@PostMapping("/signup")
	public String addUserApp(@RequestBody Users user) {
		userService.addUserApp(user);
		return "added";
	}
	@GetMapping("/email/{email}")
	public Users getUserByEmail(@PathVariable String email) {
		return userService.getUserByEmail(email);
	}
}
