package com.salemtech.asset_management_system.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.salemtech.asset_management_system.entity.RequestAsset;

@Repository
public interface RequestAssetRepo extends JpaRepository<RequestAsset, Integer>{

	RequestAsset findByRequestId(Integer id);
	
	@Query("SELECT COUNT(r) FROM RequestAsset r")
	long findCount();

}
