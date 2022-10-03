package com.codingdojo.plantstagram.controllers;

import java.util.List;

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
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.codingdojo.plantstagram.models.Journal;
import com.codingdojo.plantstagram.models.Plant;
import com.codingdojo.plantstagram.models.User;
import com.codingdojo.plantstagram.services.JournalService;
import com.codingdojo.plantstagram.services.PlantService;
import com.codingdojo.plantstagram.services.UserService;

@Controller
@RequestMapping("/plant")
public class PlantController {
	
	@Autowired
	private UserService userServ;
	
	@Autowired
	private PlantService plantServ;
	
	@Autowired
	private JournalService journalServ;
	
	@GetMapping("/create") 
	public String plantPage(Model model){
		model.addAttribute("plant", new Plant());
		return "createPlant.jsp";
	}
	
	@PostMapping("/create") 
	public String createPlant(@Valid @ModelAttribute("plant") Plant plant, BindingResult results, HttpSession session) {
		if (userServ.validate((Long) session.getAttribute("userId"))) {
			return "redirect:/login";
		}
		if(results.hasErrors()) {
			return "createPlant.jsp";
		}
		
		User loggedUser = userServ.findUserById((Long) session.getAttribute("userId"));
		plant.setUser(loggedUser);
		plantServ.createPlant(plant);
		return "redirect:/dashboard";
		
	}
	
	@GetMapping("/{id}")
	public String showPlant(@PathVariable("id") Long id, HttpSession session, Model model) {
		session.setAttribute("page", "show");
		Plant plant = plantServ.getPlantById(id);
		model.addAttribute("plant", plant);
		model.addAttribute("userId", session.getAttribute("userId"));
		return "showPlant.jsp";
	}
	
	@GetMapping("/delete/{id}")
	public String delete(@PathVariable("id") Long id, HttpSession session) {
		if (userServ.validate((Long) session.getAttribute("userId"))) {
			return "redirect:/login";
		}
		
		Plant plant = plantServ.getPlantById(id);
		if (session.getAttribute("userId") != plant.getUser().getId()) {
			return "redirect:/dashboard";
		}

		if (plant.getJournals() != null) {
			List<Journal> allJournals = plant.getJournals();
			for (Journal journal : allJournals) {
				journalServ.deleteJournal(journal.getId());
			}
		}
		plantServ.deletePlant(id);
		String page = (String) session.getAttribute("page");
		if (page.equals("profile")) {
			return "redirect:/profile";
		}
		else {
			return "redirect:/dashboard";
		}
	}
	
	@GetMapping("/edit/{id}")
	public String edit(@PathVariable("id") Long id, Model model, HttpSession session) {
		if (userServ.validate((Long) session.getAttribute("userId"))) {
			return "redirect:/login";
		}
		
		Plant plant = plantServ.getPlantById(id);
		User user = plant.getUser();
		if (session.getAttribute("userId") != user.getId()) {
			return "redirect:/dashboard";
		}
		model.addAttribute("plant", plant);
		return "editPlant.jsp";
	}
	
	@PutMapping("/edit/{id}")
	public String update(@Valid @ModelAttribute("plant") Plant plant, BindingResult result, HttpSession session) {
		if (result.hasErrors()) {
			return "editPlant.jsp";
		}
		else {
			Long userId = (Long) session.getAttribute("userId");
			User loggedUser = userServ.findUserById(userId);
			plant.setUser(loggedUser);
			plantServ.updatePlant(plant);
			
			String page = (String) session.getAttribute("page");
			if (page.equals("profile")) {
				return "redirect:/profile";
			}
			else if (page.equals("show")) {
				return "redirect:/plant/" + plant.getId();
			}
			else {
				return "redirect:/dashboard";
			}
		}
	}
}
