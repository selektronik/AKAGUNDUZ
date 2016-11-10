package com.akagunduz.controller;

import java.util.List;
import java.util.Locale;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.akagunduz.model.User;
import com.akagunduz.service.UserService;

@Controller
@RequestMapping(value = "/protected/users")
public class UserController {

	final static Logger logger = Logger.getLogger(UserController.class);
	
	@Autowired
	private UserService userService;

	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView userList() {
		return new ModelAndView("userList");
	}

	@RequestMapping(method = RequestMethod.GET, produces = "application/json")
	public ResponseEntity<?> listAll() {

		List<User> userList = userService.listUser();
		return new ResponseEntity<List<User>>(userList, HttpStatus.OK);
	}

	@RequestMapping(value = "/findUserById/{id}", method = RequestMethod.GET, produces = "application/json")
	public ResponseEntity<?> findUserById(@PathVariable String id) {

		User selectedUser = userService.findById(id);
		return new ResponseEntity<User>(selectedUser, HttpStatus.OK);
	}

	@RequestMapping(value = "/addUser", method = RequestMethod.POST)
	public ResponseEntity<?> addUser(@ModelAttribute("user") User user, Locale locale) {
		logger.info("Create user method was run.");
		User createdUser = userService.create(user);
		return new ResponseEntity<String>(createdUser.getId(), HttpStatus.OK);
	}

	@RequestMapping(value = "/deleteUser/{id}", method = RequestMethod.POST)
	public ResponseEntity<?> deleteUser(@PathVariable String id) {

		userService.delete(id);
		return new ResponseEntity<Boolean>(HttpStatus.OK);
	}

	@RequestMapping(value = "/updateUser", method = RequestMethod.POST)
	public ResponseEntity<?> updateUser(@ModelAttribute("user") User user, Locale locale) {

		User updatedUser = userService.update(user);
		return new ResponseEntity<User>(updatedUser, HttpStatus.OK);

	}

}
