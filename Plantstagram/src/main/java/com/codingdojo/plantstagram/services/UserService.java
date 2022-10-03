package com.codingdojo.plantstagram.services;

import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.codingdojo.plantstagram.models.LoginUser;
import com.codingdojo.plantstagram.models.User;
import com.codingdojo.plantstagram.repositories.UserRepository;

@Service
public class UserService {
	@Autowired
	private UserRepository userRepo;
	
	public User register(User newUser, BindingResult results) {
		Optional<User> potentialUser = userRepo.findByEmail(newUser.getEmail());
		String passwordEntered = newUser.getPassword();
		String confirmPassEntered = newUser.getConfirm();
		if(potentialUser.isPresent()) {
			results.rejectValue("email", "Matches", "This Email Address is already registered!");
			return null;
		}
		if(!passwordEntered.equals(confirmPassEntered)) {
			results.rejectValue("email", "Matches",  "The Confirm Password must match Password!");
			return null;
		}
		
		if(results.hasErrors()) {
			return null;
		}
		String hashed = BCrypt.hashpw(passwordEntered, BCrypt.gensalt());
		User user = newUser;
		user.setPassword(hashed);
		
		userRepo.save(user);
		
		return user;
	}
	
	public User login(LoginUser loginUser, BindingResult results) {
		Optional<User> potentialUser = userRepo.findByEmail(loginUser.getEmail());
		
		if(results.hasErrors()) {
			return null;
		}
		
		if (potentialUser.isPresent()) {
			User realUser = potentialUser.get();
			Boolean isValid = BCrypt.checkpw(loginUser.getPassword(), realUser.getPassword());
			if(isValid) {
				return realUser;
			}
			else {
				results.rejectValue("password", "Matches", "Password Entered is not correct");
				return null;
			}
		}
		else {
			results.rejectValue("email", "Matches", "Email Address is not registered");
			return null;
		}
	}
	public User findUserById(Long id) {
		Optional<User> optNinja = userRepo.findById(id);
		if (optNinja.isPresent()) {
			return optNinja.get();
		}
		else {
			return null;
		}
	}
	
	public User getOneByEmail(LoginUser loginUser, BindingResult results) {
		Optional<User> optUser = userRepo.findByEmail(loginUser.getEmail());
		if (optUser.isPresent()) {
			return optUser.get();
		}
		else {
			
			return null;
		}
	}
	
	public boolean validate(Long id) {
		if (id == null) {
			return true;
		}
		else {
			return false;
		}
	}
 }
