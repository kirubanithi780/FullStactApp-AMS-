package com.salemtech.asset_management_system.entity;

import java.util.List;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;


@Entity
public class Assets {
	@Id
	@Column(name = "asset_id")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer assetId;
	@Column(name = "item_name")
	private String itemName;
	@Column(name = "tag_number")
	private Integer tagNumber;
	@Column(name = "status")
	private String status;
	
	@OneToMany(mappedBy = "asset", cascade = CascadeType.ALL)
	private List<Assignment> assignments;

	public Assets() {
		super();
	}

	public Assets(Integer assetId, String itemName, Integer tagNumber, String status) {
		super();
		this.assetId = assetId;
		this.itemName = itemName;
		this.tagNumber = tagNumber;
		this.status = status;
	}

	public Integer getAssetId() {
		return assetId;
	}

	public void setAssetId(Integer assetId) {
		this.assetId = assetId;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public Integer getTagNumber() {
		return tagNumber;
	}

	public void setTagNumber(Integer tagNumber) {
		this.tagNumber = tagNumber;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}


}
