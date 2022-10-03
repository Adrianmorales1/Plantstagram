package com.codingdojo.plantstagram.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingdojo.plantstagram.models.Plant;
import com.codingdojo.plantstagram.repositories.PlantRepository;
import com.codingdojo.plantstagram.repositories.UserRepository;

@Service
public class PlantService {
	@Autowired
	private PlantRepository plantRepo;
	
	@Autowired
	private UserRepository userRepo;
	
	public Plant createPlant(Plant plant) {
		return plantRepo.save(plant);
	}
	
	public void updatePlant(Plant plant) {
		plantRepo.save(plant);
	}
	
	public Plant getPlantById(Long id) {
		Optional<Plant> optPlant = plantRepo.findById(id);
		if (optPlant.isEmpty()) {
			return null;
		}
		else {
			return optPlant.get();
		}
	}
	
	public void deletePlant(Long id) {
		plantRepo.deleteById(id);
	}
	
	public List<Plant> getAll() {
		return plantRepo.findAll();
	}
}
