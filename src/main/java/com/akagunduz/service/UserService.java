package com.akagunduz.service;

import java.util.List;

import com.akagunduz.model.User;

public interface UserService {	
	
	User create(User user); 
	
	  List<User> listUser();
	 
	  User update(User user); 
	 
	  void delete(String id); 
	  
	  User findById(String id);	  
	 
}
