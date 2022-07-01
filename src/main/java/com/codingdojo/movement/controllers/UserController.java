package com.codingdojo.movement.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.codingdojo.movement.models.LoginUser;
import com.codingdojo.movement.models.User;
import com.codingdojo.movement.services.TrainerService;
import com.codingdojo.movement.services.UserService;
import com.codingdojo.movement.services.WorkoutService;


@Controller
@RequestMapping("/user")
public class UserController
{
	/* flash attribute redirect fix: */
	/* org.springframework.validation.BindingResult.model_name */
	
	@Autowired
	private UserService userService;
	
	@Autowired 
	private WorkoutService workoutService;
	
	@Autowired
	private TrainerService trainerService;

	@GetMapping("")
	public String login( Model model){
		model.addAttribute("newUser", new User());
		model.addAttribute("userLogin", new LoginUser());
		return "UserLoginAndRegister";
	}
	
	@PostMapping("/login")
	public String login(@Valid @ModelAttribute("userLogin") LoginUser tempUser, BindingResult res, Model model, HttpSession session) {
	
		if(res.hasErrors()) {
			model.addAttribute("newUser", new User());
//			model.addAttribute("userLogin", new LoginUser());
			return "UserLoginAndRegister";
		}
		User user=userService.login(tempUser, res);
		if(user==null) {
			model.addAttribute("newUser", new User());
//			model.addAttribute("userLogin", new LoginUser());
			return "UserLoginAndRegister";
		}
		session.setAttribute("user", user);
		return"redirect:/user/home";
	}
	
	@PostMapping("/register")
	public String registerUser(@Valid @ModelAttribute("newUser") User user, BindingResult res, Model model) {
		if(res.hasErrors()) {
			model.addAttribute("userLogin", new LoginUser());
			return "UserLoginAndRegister";
		}
		User dbUser= userService.register(user, res);
		if(dbUser == null) {
			model.addAttribute("userLogin", new LoginUser());
			return "UserLoginAndRegister";
		}
		
		return "redirect:/user";
	}
	
	
	@GetMapping("/home")
	public String showDashboard(Model model, HttpSession session) {
		
		if(session.getAttribute("user")==null) {
			return "redirect:/user";
		}
		User currentUser = (User) session.getAttribute("user");
		model.addAttribute("currentUser", currentUser );
		return "userHome";
	}
	
	@GetMapping("/logout")
		public String logout(HttpSession session) {
			
			userService.logout(session);
			return "redirect:/user";
	}
	
	@GetMapping("/viewInstructor/{id}")
	public String showTrainerDashboardUser(@PathVariable("id")Long id, Model model, HttpSession session) {
    	model.addAttribute("trainer", trainerService.findById(id));
    	return "userViewTrainerPage";
    	
//    	might need to add validation that either user or trainer is in session to view this page? 
    }
		
	
};
