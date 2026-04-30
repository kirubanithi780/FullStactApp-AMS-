package com.salemtech.asset_management_system.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.salemtech.asset_management_system.entity.RequestAsset;
import com.salemtech.asset_management_system.service.RequestAssetService;

//@CrossOrigin("*")
@RestController
@RequestMapping("/request")
public class RequestAssetController {
	@Autowired
	private RequestAssetService requestAssetService;
	@PostMapping("/asset")
	public String requestAssets(@RequestBody RequestAsset request) {
		requestAssetService.requestAssets(request);
		return "success";
	}
	@GetMapping("/getall")
	public List<RequestAsset> getAllRequests(){
		return requestAssetService.getAllRequests();
	}
	@PutMapping("/assign/{id}")
	public String updateStatus(@PathVariable Integer id,@RequestBody String status) throws Exception {
		requestAssetService.updateStatus(id,status);
		return "assigned";
	}
	@DeleteMapping("/reject/{id}")
	public String rejectRequest(@PathVariable Integer id) {
		requestAssetService.rejectRequest(id);
		return "deleted";
	}
	@GetMapping("/getcount")
	public long getTotalCount() {
		return requestAssetService.getTotalCount();
	}
	@GetMapping("/getname/{id}")
	public String getName(@PathVariable Integer id) {
		return requestAssetService.getName(id);
	}
}
