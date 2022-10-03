package com.codingdojo.plantstagram.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.codingdojo.plantstagram.models.LoginUser;
import com.codingdojo.plantstagram.models.User;
import com.codingdojo.plantstagram.services.JournalService;
import com.codingdojo.plantstagram.services.UserService;

@Controller
public class MainController {
	
	@Autowired
	private UserService userServ;
	
	@Autowired
	private JournalService journalServ;
	
	@GetMapping("/") 
	public String slash(){
		return "redirect:/login";
	}
	
	@GetMapping("/login")
	public String index(Model model) {
		model.addAttribute("newUser", new User());
		model.addAttribute("newLogin", new LoginUser());
		return "login.jsp";
	}
	
	@GetMapping("/register")
	public String register(Model model) {
		model.addAttribute("newUser", new User());
		return "register.jsp";
	}
	
	@PostMapping("/register")
	public String reg(@Valid @ModelAttribute("newUser") User newUser, BindingResult result, HttpSession session, Model model ) {
		User loggedUser = userServ.register(newUser, result);
		
		if (result.hasErrors()) {
			return "register.jsp";
		}
		else {
			session.setAttribute("userId", loggedUser.getId());
			return "redirect:/dashboard";
		}
	}
	
	@PostMapping("/login")
	public String log(@Valid @ModelAttribute("newLogin") LoginUser loginUser, BindingResult result, HttpSession session, Model model) {
		User loggedUser = userServ.login(loginUser, result);
		
		if(result.hasErrors()) {
			return "login.jsp";
		}
		else {
			session.setAttribute("userId", loggedUser.getId());
			return "redirect:/dashboard";
		}
	}
	
	@GetMapping("/dashboard")
	public String dashboard(Model model, HttpSession session) {
		if (userServ.validate((Long) session.getAttribute("userId"))) {
			return "redirect:/login";
		}
		User loggedUser = userServ.findUserById((Long) session.getAttribute("userId"));
		model.addAttribute("user", loggedUser);
		model.addAttribute("allJournals", journalServ.getAll());
		return "dashboard.jsp";
	}
	
	@GetMapping("/profile")
	public String profile(Model model, HttpSession session){
		if (userServ.validate((Long) session.getAttribute("userId"))) {
			return "redirect:/login";
		}
		User loggedUser = userServ.findUserById((Long) session.getAttribute("userId"));
		model.addAttribute("user", loggedUser);
		session.setAttribute("page", "profile");
		return "showUser.jsp";
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("userId");
		session.removeAttribute("page");
		return "redirect:/login";
	}
}
