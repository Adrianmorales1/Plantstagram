package com.codingdojo.plantstagram.models;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;


@Entity
@Table(name="plants")
public class Plant {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@NotEmpty(message="Name of Plant is required!")
	@Size(min=3,max=30, message="Name of Plant must be between 3 and 30 characters")
	private String nameOfPlant;
	
	
	@NotEmpty(message="Nickname of Plant is required!")
	@Size(min=3,max=30, message="Nickname of Plant must be between 3 and 30 characters")
	private String nicknameOfPlant;
	
	
	@NotEmpty(message="Description is required!")
	@Size(min=8,max=100, message="Description must be between 8 and 100 characters")
	private String description;
	
	
	//check it out
	private String boxArt;
	
	@NotNull(message="Number is required!")
	@Min(value = 0, message = "Number must be greater than 0")
	@Max(value = 31, message = "Number must be less than 31")
	private int numberDate;
	
	
	private String nameDate;
	
	@Column(updatable=false)
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date createdAt;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date updatedAt;
	
	@OneToMany(mappedBy="plant", fetch = FetchType.LAZY)
	public List<Journal> journals; 
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="user_id")
   	private User user;
	
	public Plant() {}
	
	
	
	public Long getId() {
		return id;
	}



	public void setId(Long id) {
		this.id = id;
	}



	public String getNameOfPlant() {
		return nameOfPlant;
	}



	public void setNameOfPlant(String nameOfPlant) {
		this.nameOfPlant = nameOfPlant;
	}



	public String getNicknameOfPlant() {
		return nicknameOfPlant;
	}



	public void setNicknameOfPlant(String nicknameOfPlant) {
		this.nicknameOfPlant = nicknameOfPlant;
	}



	public String getDescription() {
		return description;
	}



	public void setDescription(String description) {
		this.description = description;
	}



	public int getNumberDate() {
		return numberDate;
	}



	public void setNumberDate(int numberDate) {
		this.numberDate = numberDate;
	}



	public String getNameDate() {
		return nameDate;
	}



	public void setNameDate(String nameDate) {
		this.nameDate = nameDate;
	}



	public Date getCreatedAt() {
		return createdAt;
	}



	public Date getUpdatedAt() {
		return updatedAt;
	}


	public List<Journal> getJournals() {
		return journals;
	}



	public void setJournals(List<Journal> journals) {
		this.journals = journals;
	}



	public User getUser() {
		return user;
	}



	public void setUser(User user) {
		this.user = user;
	}



	@PrePersist
    protected void onCreate(){
        this.createdAt = new Date();
    }
    @PreUpdate
    protected void onUpdate(){
        this.updatedAt = new Date();
    }
}
