package com.salemtech.asset_management_system.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.salemtech.asset_management_system.entity.IssueReport;

@Service
public class EmailService {
	@Autowired
    private JavaMailSender mailSender;

    public void sendIssueToAdmin(IssueReport request) {
        SimpleMailMessage message = new SimpleMailMessage();
     
        message.setTo("kirubanithik660@gmail.com"); 
        message.setSubject("New Issue Reported by " + request.getReporterName());
        message.setText("Asset Management System |  Trinity Axis Inc\n\n"
        		+ "Reporter Email: " + request.getReporterEmail() + 
                        "\n\nDescription: " + request.getDescription());
        
        mailSender.send(message);
        
        SimpleMailMessage message2 = new SimpleMailMessage();
        message2.setTo(request.getReporterEmail());
        message2.setSubject("Hello " + request.getReporterName() + ", thanks for submitting your report"); 
        message2.setText("Dear " + request.getReporterName() + ",\n\n" 
                + "We have received your report regarding: " + request.getDescription() + ".\n"
                + "Our team is working on it and will rectify it as soon as possible.\n"
                +"Asset Management System  |   Trinity Axis");
        
        mailSender.send(message2);
    }
}
