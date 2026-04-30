package com.salemtech.asset_management_system.entity;

import java.sql.Date;
import java.time.LocalDate;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;

@Entity
public class Assignment {
	@Id
	@Column(name="assign_id")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer assignId;
	@Column(name = "assigned_date")
	private LocalDate assignedDate;

    @ManyToOne
    @JoinColumn(name = "user_id", nullable = false)
    private Users user;

    public Assignment() {
		super();
	}

	public Assignment(Integer assignId, LocalDate assignedDate, Users user, Assets asset) {
		super();
		this.assignId = assignId;
		this.assignedDate = assignedDate;
		this.user = user;
		this.asset = asset;
	}

	public Integer getAssignId() {
		return assignId;
	}

	public void setAssignId(Integer assignId) {
		this.assignId = assignId;
	}

	public LocalDate getAssignedDate() {
		return assignedDate;
	}

	public void setAssignedDate(LocalDate localDate) {
		this.assignedDate = localDate;
	}

	public Users getUser() {
		return user;
	}

	public void setUser(Users user) {
		this.user = user;
	}

	public Assets getAsset() {
		return asset;
	}

	public void setAsset(Assets asset) {
		this.asset = asset;
	}

	@ManyToOne
    @JoinColumn(name = "asset_id", nullable = false)
    private Assets asset;
}
