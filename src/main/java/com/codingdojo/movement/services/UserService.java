package com.codingdojo.movement.services;


import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.codingdojo.movement.models.LoginUser;
import com.codingdojo.movement.models.User;
import com.codingdojo.movement.models.Workout;
import com.codingdojo.movement.repositories.UserRepository;


@Service
public class UserService {
	
	@Autowired
	private UserRepository userRepository;
	
	public User login(LoginUser tempUser, BindingResult res) {
		
		User dbUser=userRepository.findByEmail(tempUser.getEmail());
		if(dbUser==null) {
			res.rejectValue("email","email invalid","Invalid Email");
			return null;
		}
		
		boolean isMatch= BCrypt.checkpw(tempUser.getPassword(), dbUser.getPassword());
		if(!isMatch) {
			res.rejectValue("password","password bad","password is invalid");
			return null;
		}
		return dbUser;
		
		
	}
	
	public User register(User user, BindingResult res) {
		if(userRepository.findByEmail(user.getEmail())!=null) {
			res.rejectValue("email","email invalid","A user with this email already exists");
			return null;
		}
		if(!user.getPassword().equals(user.getConfirm())) {
			res.rejectValue("password","pass doesnt match","Password and confirmation must match eachother");
			res.rejectValue("confirm","pass doesnt match","Password and confirmation must match eachother");
			return null;
		}
		user.setPassword(BCrypt.hashpw(user.getPassword(), BCrypt.gensalt(8)));	
		userRepository.save(user);
		return user;
	}
	
	public void logout(HttpSession session) {
		if (session.getAttribute("user")!=null) {
			session.removeAttribute("user");
		}
	}
	
	 public User findById(Long id){
	        return userRepository.findById(id).orElse(null);
	    }
	
	 public User updateUser(User user) {
		 return userRepository.save(user);
	 }
	
	

}
