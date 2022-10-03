package com.codingdojo.plantstagram.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingdojo.plantstagram.models.Journal;
import com.codingdojo.plantstagram.repositories.JournalRepository;
import com.codingdojo.plantstagram.repositories.UserRepository;

@Service
public class JournalService {
	@Autowired
	private JournalRepository journalRepo;
	
	@Autowired
	private UserRepository userRepo;
	
	public Journal createJournal(Journal journal) {
		return journalRepo.save(journal);
	}
	
	public void updateJournal(Journal journal) {
		journalRepo.save(journal);
	}
	
	public Journal getJournalById(Long id) {
		Optional<Journal> optJournal = journalRepo.findById(id);
		if (optJournal.isEmpty()) {
			return null;
		}
		else {
			return optJournal.get();
		}
	}
	
	public void deleteJournal(Long id) {
		journalRepo.deleteById(id);
	}
	
	public List<Journal> getAll() {
		return journalRepo.findAll();
	}
}
