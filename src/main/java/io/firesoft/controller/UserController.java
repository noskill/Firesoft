package io.firesoft.controller;

import io.firesoft.model.User;
import io.firesoft.service.UserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserController {
	
	@Autowired
	private UserService userservice;
	
	@ModelAttribute("user")
	public User construct() {
		return new User();
	}
	
	@RequestMapping("/users")
	public String users(Model model){
		model.addAttribute("users", userservice.findAll());
		return "users";
	}
	
	@RequestMapping("/users/{id}")
	public String detail(Model model, @PathVariable int id){
		model.addAttribute("user",userservice.findOne(id));
		return "user-detail";
	}
	

}
