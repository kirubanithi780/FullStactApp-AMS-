package com.salemtech.asset_management_system.service;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.salemtech.asset_management_system.entity.Assets;
import com.salemtech.asset_management_system.entity.Assignment;
import com.salemtech.asset_management_system.entity.Users;
import com.salemtech.asset_management_system.repository.AssetRepo;
import com.salemtech.asset_management_system.repository.AssignmentRepo;
import com.salemtech.asset_management_system.repository.UserRepo;

@Service
public class AssignmentService {
	
	@Autowired
	private AssignmentRepo assignmentRepo;
	@Autowired
	private UserRepo userRepo;
	@Autowired
	private AssetRepo assetRepo;

	public void addAssign(Integer userId, Integer assetId) {
		Assignment assign=new Assignment();
		Users user=userRepo.getReferenceById(userId);
		Assets asset=assetRepo.getReferenceById(assetId);
		asset.setStatus("assigned");
		assign.setAsset(asset);
		assign.setUser(user);
		assign.setAssignedDate(LocalDate.now());
		assignmentRepo.save(assign);
		
		
	}

	public List<Assignment> getAssignById(Integer id) {
		return assignmentRepo.findAllByUserId(id);
	}

	public void removeAssign(Integer assignId,Integer assetId) throws Exception {
		Assets asset=assetRepo.findById(assetId).orElseThrow(()->new Exception("User not found"));
		asset.setStatus("available");
		assignmentRepo.deleteById(assignId);
	}

}
