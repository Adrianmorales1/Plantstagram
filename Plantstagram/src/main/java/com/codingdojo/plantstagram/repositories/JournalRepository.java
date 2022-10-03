package com.codingdojo.plantstagram.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.plantstagram.models.Journal;

@Repository
public interface JournalRepository extends CrudRepository<Journal, Long> {
	List<Journal> findAll();
}
