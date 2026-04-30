package com.salemtech.asset_management_system.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.salemtech.asset_management_system.entity.Assignment;
import com.salemtech.asset_management_system.service.AssignmentService;

//@CrossOrigin("*")
@RestController
@RequestMapping("/assign")
public class AssignmentController {
	@Autowired
	private AssignmentService assignService;
	@PostMapping("/add")
	public String addAssign(@RequestParam(name="user_id") Integer userId,@RequestParam(name="asset_id") Integer assetId) {
		assignService.addAssign(userId,assetId);
		return "added";
		
	}
	@GetMapping("/get/{userId}")
	public List<Assignment> getAssignById(@PathVariable(name="userId") Integer userId){
		return assignService.getAssignById(userId);
	}
	@DeleteMapping("/delete")
	public String removeAssign(@RequestParam("assignId") Integer assignId,@RequestParam("assetId") Integer assetId) throws Exception {
		assignService.removeAssign(assignId,assetId);
		return "deleted";
	}
}
