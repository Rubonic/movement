package com.codingdojo.movement.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.codingdojo.movement.models.Trainer;
import com.codingdojo.movement.models.User;
import com.codingdojo.movement.models.Workout;
import com.codingdojo.movement.services.TrainerService;
import com.codingdojo.movement.services.UserService;
import com.codingdojo.movement.services.WorkoutService;

@Controller
@RequestMapping("/workout")
public class WorkoutController {
    
    public WorkoutController(){};

    @Autowired
    private WorkoutService workoutService;
    
    @Autowired 
    private TrainerService trainerService;
    
    @Autowired 
    private UserService userService;
    
//    add a new workout page 

    @GetMapping("/new/{trainer_id}")
    public String showAddWorkout(@PathVariable("trainer_id") Long trainer_id, Model model, HttpSession session){
        if(session.getAttribute("sessionTrainer")==null){
            return "UserLoginAndRegister";
        }
        model.addAttribute("addWorkout", new Workout());
        return "newWorkout";
    }

    @PostMapping("/new/{trainer_id}")
    public String addWorkout(@PathVariable("trainer_id") Long trainer_id,@Valid @ModelAttribute("addWorkout") Workout workout, BindingResult res, Model model, HttpSession session){
        if (res.hasErrors()){
            return "newWorkout";
        }
//        if (SpotifyController.getPlaylist(workout.getPlaylistId()) == null) {
//        	res.rejectValue("playlistId","Playlist_error","Playlist NOT FOUND");
//        	return "newWorkout";
//        }
        workoutService.create(workout);
        String returnStatement = String.format("redirect:/trainer/home/%s", trainer_id);
        return returnStatement; 
    }
    
    
//    Show all the workouts page

    @GetMapping("/showAll")
    public String showAllWorkouts(Model model, HttpSession session){
        if(session.getAttribute("user")==null){
            return "redirect:/";
        }
        model.addAttribute("workout", workoutService.findAll() );
        return "showAllWorkouts";
    }
    
    @GetMapping("/likeWorkout/{id}")
    public String likeWorkout(@PathVariable("id") Long id, Model model, HttpSession session) {
    	Workout workout = workoutService.findById(id);
    	User user = (User) session.getAttribute("user");
    	List <User> UserList = workout.getUsers();
    	List <Workout> WorkoutList = user.getWorkouts();
    	UserList.add(user);
    	WorkoutList.add(workout);
    	user.setWorkouts(WorkoutList);
    	workout.setUsers(UserList);
    	workoutService.updateWorkout(workout);
    	userService.updateUser(user);
    	return "redirect:/workout/showAll";
    }

    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, Model model, HttpSession session) {
        Workout workout = workoutService.findById(id);
        model.addAttribute("oneWorkout", workout);

        if(session.getAttribute("sessionTrainer") == null) {
            return "redirect:/logout";
        }

        return "editWorkout";
    }

    @PostMapping("/edit/{id}")
    public String editWorkout(@PathVariable("id") Long id, @Valid @ModelAttribute("oneWorkout") Workout workout, BindingResult result, HttpSession session) {

        if(session.getAttribute("sessionTrainer") == null) {
            return "redirect:/logout";
        }
        if (result.hasErrors()) {
            return "editWorkout";
        }
        workout.setId(id);
        workoutService.updateWorkout(workout);
        Trainer currentTrainer = (Trainer) session.getAttribute("sessionTrainer");
        String returnStatement = String.format("redirect:/trainer/home/%s", currentTrainer.getId());
        return returnStatement;

    }

    @DeleteMapping("/delete/{id}")
    public String destroy(@PathVariable("id") Long id, HttpSession session) {
     	workoutService.delete(id);
        Trainer currentTrainer = (Trainer) session.getAttribute("sessionTrainer");
     	String returnStatement = String.format("redirect:/trainer/home/%s", currentTrainer.getId());
        return returnStatement;
    	
    }


    @GetMapping("/{id}")
    public String showOneWorkout(@PathVariable("id") Long id, Model model, HttpSession session){
    	Workout workout = workoutService.findById(id);
        model.addAttribute("workout", workout);
//        model.addAttribute("playlist", SpotifyController.getPlaylist(workout.getPlaylistId()));
        return "showOneWorkout";
    }

	public TrainerService getTrainerService() {
		return trainerService;
	}

	public void setTrainerService(TrainerService trainerService) {
		this.trainerService = trainerService;
	}
    
    
}

