package io.firesoft.controller;

import io.firesoft.model.Post;
import io.firesoft.model.RegistrationType;
import io.firesoft.model.User;
import io.firesoft.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class UserController {
	
	@Autowired
	private UserService userservice;
	
	@ModelAttribute("user")
	public User constructUser() {
		return new User();
	}
	
	@ModelAttribute("blog")
	public Post constructPost() {
		return new Post();
	}
	@RequestMapping("/users")
	public String users(Model model){
		model.addAttribute("users", userservice.findAll());
		return "users";
	}
	
	@RequestMapping("/users/{id}")
	public String detail(Model model, @PathVariable int id){
		model.addAttribute("user",userservice.findOneWithPosts(id));
		return "user-detail";
	}
	

	 @RequestMapping(value="/index", method=RequestMethod.POST)
	   public String doRegister(@ModelAttribute("user") User user){
		   user.setRegType(RegistrationType.Local);
		   userservice.save(user);
		   return "redirect:/index.html?success=true";
	 }	 
	
}
