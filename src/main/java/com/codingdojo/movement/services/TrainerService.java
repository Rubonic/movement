package com.codingdojo.movement.services;

import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.codingdojo.movement.models.LoginTrainer;
import com.codingdojo.movement.models.Trainer;
import com.codingdojo.movement.repositories.TrainerRepository;


@Service
public class TrainerService {
    
    @Autowired 
    private TrainerRepository trainerRepository;
    
    
//    public void create(Trainer trainer) {
//        trainerRepository.save(trainer);
//    }
    
//    public Trainer findByEmail(String email) {
//        return trainerRepository.findByEmail(email).orElse(null);
//    }

    public Trainer findById(Long id){
        return trainerRepository.findById(id).orElse(null);
    }
    
    public Trainer create(Trainer trainer, BindingResult res) {
		if(trainerRepository.findByEmail(trainer.getEmail())!=null) {
			res.rejectValue("email","email invalid","A user with this email already exists");
			return null;
		}
		if(!trainer.getPassword().equals(trainer.getConfirm())) {
			res.rejectValue("password","pass doesnt match","Password and confirmation must match eachother");
			res.rejectValue("confirm","pass doesnt match","Password and confirmation must match eachother");
			return null;
		}
		trainer.setPassword(BCrypt.hashpw(trainer.getPassword(), BCrypt.gensalt(8)));	
		trainerRepository.save(trainer);
		return trainer;
	}
    
    public Trainer login(LoginTrainer loginTrainer, BindingResult res) {
		
		Trainer dbTrainer=trainerRepository.findByEmail(loginTrainer.getEmail());
		if(dbTrainer==null) {
			res.rejectValue("email","email invalid","Invalid Email");
			return null;
		}
		
		boolean isMatch= BCrypt.checkpw(loginTrainer.getPassword(), dbTrainer.getPassword());
		if(!isMatch) {
			res.rejectValue("password","password bad","password is invalid");
			return null;
		}
		return dbTrainer;
		
		
	}
    public void logout(HttpSession session) {
		if (session.getAttribute("sessionTrainer")!=null) {
			session.removeAttribute("sessionTrainer");
		}
	}
    
}