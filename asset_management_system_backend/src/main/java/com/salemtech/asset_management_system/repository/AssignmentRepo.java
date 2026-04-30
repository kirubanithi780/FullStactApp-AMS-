package com.salemtech.asset_management_system.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.PathVariable;

import com.salemtech.asset_management_system.entity.Assignment;

@Repository
public interface AssignmentRepo extends JpaRepository<Assignment, Integer>{

	List<Assignment> findByUserUserId(Integer id);
	
	
//	@Query(value = "SELECT a.* FROM ASSIGNMENT a " +
//            "INNER JOIN assets ast ON a.asset_id = ast.asset_id " + 
//            "WHERE a.user_id = :userId", 
//    nativeQuery = true)
	
	
	@Query("SELECT a FROM Assignment a WHERE a.user.userId = :userId")
    List<Assignment> findAllByUserId(@Param("userId") Integer userId);
	
	
	
	
}
