package com.salemtech.asset_management_system.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.salemtech.asset_management_system.entity.IssueReport;
import com.salemtech.asset_management_system.service.EmailService;

@RestController
//@CrossOrigin("*")
@RequestMapping("/email")
public class EmailController {
	@Autowired
	private EmailService emailService;
	
	@PostMapping("/report")
	public String reportMail(@RequestBody IssueReport issueReport) {
		emailService.sendIssueToAdmin(issueReport);
		return "reported";
	}
}
