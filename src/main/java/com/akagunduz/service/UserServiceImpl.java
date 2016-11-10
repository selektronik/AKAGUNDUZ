package com.akagunduz.service;

import java.util.List;
import java.util.UUID;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.akagunduz.controller.UserController;
import com.akagunduz.model.User;
import com.akagunduz.repository.UserRepository;

@Service
public class UserServiceImpl implements UserService {

	final static Logger logger = Logger.getLogger(UserController.class);
	
	@Autowired
	private UserRepository userRepository;
	
	
	public User create(User user) {
		user.setId(UUID.randomUUID().toString());
		logger.info("User was created.");		
		
		return userRepository.save(user);
	}

	
	
	 public List<User> listUser() {
	        return userRepository.findAll();
	    }
	 
	 public User update(User user) {
		 User existingUser = userRepository.findById(user.getId());
			
			if (existingUser == null) {
				return null;
			}
			logger.info("User was updated.");
			existingUser.setName(user.getName());
			existingUser.setSurname(user.getSurname());
			existingUser.setPhone_number(user.getPhone_number());
			
			return userRepository.save(existingUser);
		}
	 
	 public void delete(String id) {
		 logger.info("User was deleted.");			
		 userRepository.delete(id);
			
		}
	 
		
	 public User findById(String id) {
		 logger.info("User was found.");   
		 return userRepository.findById(id);
	    }
	
}
