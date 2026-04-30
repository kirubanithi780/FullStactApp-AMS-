package com.salemtech.asset_management_system.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.salemtech.asset_management_system.entity.Assets;
import com.salemtech.asset_management_system.entity.Assignment;
import com.salemtech.asset_management_system.repository.AssetRepo;
import com.salemtech.asset_management_system.repository.AssignmentRepo;

@Service
public class AssetService {
	
	@Autowired
	private AssetRepo assetRepo;
	@Autowired
	private AssignmentRepo assignRepo;

	public List<Assets> getAllAssets() {
		return assetRepo.findAll();
	}

	public void assetAssign(Assignment assign) {
		assignRepo.save(assign);
	}

	public List<Assignment> getAllItems(Integer id) {
		List<Assignment> list= assignRepo.findByUserUserId(id);
		return list;
	}

	public long getCount() {
		return assetRepo.count();
	}

	public long getActiveCount() {
		return assetRepo.findAllActiveUsersNative();
	}

	public long getAssignCount() {
		return assetRepo.findAllAssignedUsersNative();
	}

	public List<Assets> getAvailableGadgets() {
		return assetRepo.getAvailableGadgets();
	}

	public void assetsAssign(Assets asset) {
		assetRepo.save(asset);
	}

}
