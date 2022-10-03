package com.codingdojo.plantstagram.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.plantstagram.models.Plant;

@Repository
public interface PlantRepository extends CrudRepository<Plant, Long>{
	List<Plant> findAll();
}
