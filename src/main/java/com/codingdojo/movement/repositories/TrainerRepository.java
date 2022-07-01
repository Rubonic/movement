package com.codingdojo.movement.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.movement.models.Trainer;

@Repository
public interface TrainerRepository extends CrudRepository<Trainer, Long> {
    
    // ArrayList<Trainer> findAll();
    public Trainer findByEmail(String email);
//    public Optional<Trainer> findById(Long id);
    
}