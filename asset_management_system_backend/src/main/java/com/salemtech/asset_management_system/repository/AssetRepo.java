package com.salemtech.asset_management_system.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.salemtech.asset_management_system.entity.Assets;

@Repository
public interface AssetRepo extends JpaRepository<Assets, Integer>{
	
	    @Query(value = "SELECT COUNT(*) FROM assets WHERE status = 'available'", nativeQuery = true)
	   long findAllActiveUsersNative();
	    
	    @Query(value = "SELECT COUNT(*) FROM assets WHERE status = 'assigned'", nativeQuery = true)
		long findAllAssignedUsersNative();

	    
	    @Query(value = "SELECT * FROM assets WHERE status = 'available'", nativeQuery = true)
		List<Assets> getAvailableGadgets();
	

}
