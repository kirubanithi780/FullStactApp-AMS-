package com.salemtech.asset_management_system.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.salemtech.asset_management_system.entity.Users;

@Repository
public interface UserRepo extends JpaRepository<Users, Integer> {

	Users findByEmail(String email);
	
}
