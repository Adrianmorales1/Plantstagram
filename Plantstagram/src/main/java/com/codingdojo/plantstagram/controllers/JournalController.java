package com.codingdojo.plantstagram.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.codingdojo.plantstagram.models.Journal;
import com.codingdojo.plantstagram.models.Plant;
import com.codingdojo.plantstagram.models.User;
import com.codingdojo.plantstagram.services.JournalService;
import com.codingdojo.plantstagram.services.PlantService;
import com.codingdojo.plantstagram.services.UserService;

@Controller
@RequestMapping("/journal")
public class JournalController {
	@Autowired
	private UserService userServ;
	
	@Autowired
	private PlantService plantServ;
	@Autowired
	private JournalService journalServ;
	
	@GetMapping("/create/{id}") 
	public String journalPage(@PathVariable("id") Long id, Model model, HttpSession session){
		if (userServ.validate((Long) session.getAttribute("userId"))) {
			return "redirect:/login";
		}
		Plant plant = plantServ.getPlantById(id);
		
		if (session.getAttribute("userId") != plant.getUser().getId()) {
			return "redirect:/dashboard";
		}
		
		model.addAttribute("plant", plant);
		model.addAttribute("journal", new Journal());
		return "createJournal.jsp";
	}
	
	@PostMapping("/create/{id}") 
	public String createJournal(@Valid @ModelAttribute("journal") Journal journal, BindingResult results, @PathVariable("id") Long id, HttpSession session) {
		if(results.hasErrors()) {
			return "createJournal.jsp";
		}
		Plant underPlant = plantServ.getPlantById(id);
		journal.setPlant(underPlant);
		journalServ.createJournal(journal);
		return "redirect:/plant/" + id;
	}
	
	@GetMapping("/{id}")
	public String showJournal(@PathVariable("id") Long id, HttpSession session, Model model) {
		if (userServ.validate((Long) session.getAttribute("userId"))) {
			return "redirect:/login";
		}
		Journal journal = journalServ.getJournalById(id);
		model.addAttribute("journal", journal);
		Plant plant = plantServ.getPlantById(journal.getPlant().getId());
		model.addAttribute("plant", plant);
		model.addAttribute("userId", session.getAttribute("userId"));
		return "showJournal.jsp";
	}
	
	@GetMapping("/delete/{id}")
	public String delete(@PathVariable("id") Long id, HttpSession session) {
		if (userServ.validate((Long) session.getAttribute("userId"))) {
			return "redirect:/login";
		}
		Journal journal = journalServ.getJournalById(id);
		Plant plant = journal.getPlant();
		if (session.getAttribute("userId") != plant.getUser().getId()) {
			return "redirect:/dashboard";
		}
		Long plantId = plant.getId();
		journalServ.deleteJournal(id);
		return "redirect:/plant/" + plantId;
	}
}
