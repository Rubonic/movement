package com.codingdojo.movement.repositories;

import java.util.ArrayList;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.movement.models.Workout;


@Repository
public interface WorkoutRepository extends CrudRepository<Workout, Long> {

    ArrayList<Workout> findAll();
    public Optional<Workout> findById(Long id);
    
}
