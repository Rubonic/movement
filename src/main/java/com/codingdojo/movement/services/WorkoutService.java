package com.codingdojo.movement.services;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingdojo.movement.models.Workout;
import com.codingdojo.movement.repositories.WorkoutRepository;


@Service
public class WorkoutService {
    
    @Autowired
    private WorkoutRepository workoutRepository;

    public void create(Workout workout){
        workoutRepository.save(workout);
    }

    public Workout findById(Long id){
        return workoutRepository.findById(id).orElse(null);
    }

//    public ArrayList<Workout> findByTrainer(Long trainer_id){
//        return workoutRepository.findByTrainer_id(trainer_id).orElse(null);
//    }

    public ArrayList<Workout> findAll(){
        return workoutRepository.findAll();
    }
    
    public void updateWorkout(Workout workout){
        workoutRepository.save(workout);
    }

    public void delete(Long id) {
        workoutRepository.deleteById(id);
    }


}
