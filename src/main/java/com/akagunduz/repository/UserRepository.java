package com.akagunduz.repository;

import org.springframework.data.mongodb.repository.MongoRepository;

import com.akagunduz.model.User;

public interface UserRepository extends MongoRepository<User, String> {
	
	User findById(String id);

}
