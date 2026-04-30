package com.salemtech.asset_management_system.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.salemtech.asset_management_system.entity.RequestAsset;
import com.salemtech.asset_management_system.entity.Users;
import com.salemtech.asset_management_system.repository.RequestAssetRepo;
import com.salemtech.asset_management_system.repository.UserRepo;

import jakarta.persistence.EntityNotFoundException;
import jakarta.transaction.Transactional;

@Service
public class RequestAssetService {
	@Autowired
	private RequestAssetRepo requestAssetRepo;
	@Autowired
	private UserRepo userRepo;

	public void requestAssets(RequestAsset request) {
		 requestAssetRepo.save(request);
	}


	public List<RequestAsset> getAllRequests() {
		return requestAssetRepo.findAll();
	}


	@Transactional
	public void updateStatus(Integer id, String status) {
	    RequestAsset req = requestAssetRepo.findById(id)
	        .orElseThrow(() -> new EntityNotFoundException("RequestAsset with id " + id + " not found"));
	    req.setStatus(status);
	    requestAssetRepo.save(req);
	}


	public void rejectRequest(Integer id) {
		 requestAssetRepo.deleteById(id);
	}


	public long getTotalCount(){
		return requestAssetRepo.count();
	}


	public String getName(Integer id) {
		Users req = userRepo.findById(id)
		        .orElseThrow(() -> new EntityNotFoundException("RequestAsset with id " + id + " not found"));
		
		return req.getUserName();
	}
	
}
