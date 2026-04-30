package com.salemtech.asset_management_system.entity;

import java.time.LocalDate;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class RequestAsset {
	@Id
	@Column(name = "request_id")
	private Integer requestId;
	@Column(name = "asset_type")
	private String assetType;
	@Column(name = "status")
	private String status;
	@Column(name = "request_date")
	private LocalDate requestDate;
	@Column(name = "reason")
	private String reason;
	public RequestAsset() {
		super();
	}
	public Integer getRequestId() {
		return requestId;
	}
	public void setRequestId(Integer requestId) {
		this.requestId = requestId;
	}
	public String getAssetType() {
		return assetType;
	}
	public void setAssetType(String assetType) {
		this.assetType = assetType;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public LocalDate getRequestDate() {
		return requestDate;
	}
	public void setRequestDate(LocalDate requestDate) {
		this.requestDate = requestDate;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public RequestAsset(Integer requestId, String assetType, String status, LocalDate requestDate, String reason) {
		super();
		this.requestId = requestId;
		this.assetType = assetType;
		this.status = status;
		this.requestDate = requestDate;
		this.reason = reason;
	}
	
	
}
