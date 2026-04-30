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

import com.salemtech.asset_management_system.entity.Assets;
import com.salemtech.asset_management_system.entity.Assignment;
import com.salemtech.asset_management_system.service.AssetService;


//@CrossOrigin("*")
@RestController
@RequestMapping("/asset")
public class AssetController {
	@Autowired
	private AssetService assetService;
	@PostMapping("/assigns")
	public String assetsAssign(@RequestBody Assets asset) {
		assetService.assetsAssign(asset);
		return "Successfully Added";
		
	}
	@GetMapping("/get")
	public List<Assets> getAllAssets(){
		return assetService.getAllAssets();
	}
	
	@PostMapping("/assign")
	public String assetAssign(@RequestBody Assignment ass) {
		assetService.assetAssign(ass);	
		return "successfully assigned";
	}
	
	@GetMapping("/getitems/{id}")
	public List<Assignment> getAllItems(@PathVariable Integer id){
		return assetService.getAllItems(id);
		
	}
	@GetMapping("/count")
	public long getCount() {
		long data=assetService.getCount();
		System.out.println(data);
		return data;
	}
	@GetMapping("/active")
	public long getActiveCount() {
		return assetService.getActiveCount();
	}
	@GetMapping("/assign")
	public long getAssignCount() {
		return assetService.getAssignCount();
	}
	@GetMapping("/available")
	public List<Assets> getAvailableGadgets(){
		return assetService.getAvailableGadgets();
	}
}
