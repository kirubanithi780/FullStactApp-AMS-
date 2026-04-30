//package com.salemtechasset_management_system.utils;
//
//The error is occurring. because of a type mismatch in your repository method. 
//
//In your `Assignment` entity, the field `user` is of type **`Users`** (the entity class), but in your repository, you are passing an **`int`** to the `findByUser` method. Spring Data JPA expects the parameter type to match the field type in the entity.
//
//Here is how to fix it:
//
//### 1. Update the Repository Method
//You have two main ways to fix the naming convention so Spring Data JPA understands you want to filter by the **ID** of the user, not the whole user object.
//
//#### Option A: Use Property Traversal (Recommended)
//Assuming your `Users` entity has a primary key field named `userId` or `id`, change your repository method to:
//
//```java
//@Repository
//public interface AssignmentRepo extends JpaRepository<Assignment, Integer> {
//    // This tells JPA to look inside the 'user' entity for the 'id' field
//    List<Assignment> findByUserId(Integer id); 
//    
//    // OR if the field in Users.java is named 'userId':
//    // List<Assignment> findByUser_UserId(Integer userId);
//}
//```
//
//#### Option B: Pass the Entity Object
//If you keep the method name as `findByUser`, you must pass a `Users` object instead of an `int`.
//```java
//List<Assignment> findByUser(Users user);
//```
//
//---
//
//### 2. Fix the "Shadowing" Bug in your Entity
//While looking at your code, I noticed a common logic error in your constructor and setter. You are assigning the parameter to itself instead of the class field.
//
//**Current code (Incorrect):**
//```java
//public void setAssignId(Integer assignId) {
//    assignId = assignId; // This does nothing
//}
//```
//
//**Corrected code:**
//You must use the `this` keyword to refer to the class variable.
//
//```java
//public Assignment(Integer assignId, Date assignedDate, Users user, Assets asset) {
//    super();
//    this.assignId = assignId; // Added 'this'
//    this.assignedDate = assignedDate;
//    this.user = user;
//    this.asset = asset;
//}
//
//public void setAssignId(Integer assignId) {
//    this.assignId = assignId; // Added 'this'
//}
//```
//
//---
//
//### Summary of the Fix
//1.  **In `AssignmentRepo`**: Change `findByUser(int id)` to `findByUserId(Integer id)`.
//2.  **In `AssetService`**: Ensure you are calling the updated method name.
//3.  **In `Assignment` entity**: Add `this.` to your setters and constructors to ensure data is actually saved to the object.
//
//Does your `Users` entity use `userId` or just `id` as its primary key? Knowing that will help determine the exact method name for the repository.
