package com.codingdojo.movement.models;

import java.util.List;

import javax.persistence.*;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

@Entity
@Table(name = "workouts")
public class Workout {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotEmpty(message= "Name is required!")
    @Size(min=3, max=20, message = "Must be at least 3-20 characters!")
    private String title;

    @NotEmpty(message= "Target area is required!")
    @Size(min=3, max=45, message = "Must be at least 3-20 characters!")
    private String target;

    @NotEmpty(message= "Details is required!")
    @Size(min=3, max=255, message = "Must be at least 25-255 characters!")
    private String details;

    @NotEmpty(message= "A selection from the dropdown is required!")
    private String difficulty;
    
//    @NotEmpty(message= "Playlist is required")
//    private String playlistId;

    @ManyToOne(fetch=FetchType.EAGER)
    @JoinColumn(name="trainer_id")
    private Trainer trainer;

    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(
        name = "users_workouts", 
        joinColumns = @JoinColumn(name = "workout_id"), 
        inverseJoinColumns = @JoinColumn(name = "user_id")
    )
    private List<User> users;

    public Long getId() {
        return id;
    }

    
   
   
    
//    public String getPlaylistId() {
//		return playlistId;
//	}
//
//	public void setPlaylistId(String playlistId) {
//		this.playlistId = playlistId;
//	}

	public void setId(Long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setName(String title) {
        this.title = title;
    }

    public String getTarget() {
        return target;
    }

    public void setTargetArea(String target) {
        this.target = target;
    }

    public String getDetails() {
        return details;
    }

    public void setDetails(String details) {
        this.details = details;
    }

    public String getDifficulty() {
        return difficulty;
    }

    public void setDifficulty(String difficulty) {
        this.difficulty = difficulty;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setTarget(String target) {
        this.target = target;
    }

    public Trainer getTrainer() {
        return trainer;
    }

    public void setTrainer(Trainer trainer) {
        this.trainer = trainer;
    }

    public List<User> getUsers() {
        return users;
    }

    public void setUsers(List<User> users) {
        this.users = users;
    }
    
    public int getUserLikes() {
    	int num=0;
    	num=users.size();
    	return num;
    }
    
    
}

