package com.salemtech.asset_management_system.entity;

public class IssueReport {
	  private String reporterName;
	  private String reporterEmail;
	  private String description;
	  public String getReporterName() {
		  return reporterName;
	  }
	  public void setReporterName(String reporterName) {
		  this.reporterName = reporterName;
	  }
	  public String getReporterEmail() {
		  return reporterEmail;
	  }
	  public void setReporterEmail(String reporterEmail) {
		  this.reporterEmail = reporterEmail;
	  }
	  public String getDescription() {
		  return description;
	  }
	  public void setDescription(String description) {
		  this.description = description;
	  }
	  public IssueReport(String reporterName, String reporterEmail, String description) {
		super();
		this.reporterName = reporterName;
		this.reporterEmail = reporterEmail;
		this.description = description;
	  }
	  public IssueReport() {
		super();
	  }
	   
	
}
