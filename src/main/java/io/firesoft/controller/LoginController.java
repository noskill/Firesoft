package io.firesoft.controller;



import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class LoginController {
	
	@RequestMapping(value="/user", method=RequestMethod.GET)
	public String mainPage() {
		return "user";
	}
	
	@RequestMapping(value="/admin", method=RequestMethod.GET)
	public String adminPage() {
		return "admin";
	}
	
/*	@RequestMapping(value="/#modal", method=RequestMethod.GET)
	public String login(ModelMap model){
		System.out.println("In the login method");
		return "login";
	}*/

    @RequestMapping(value="/?error", method=RequestMethod.GET)
	public String loginFailed(ModelMap model){
		System.out.println("login failed");
		model.addAttribute("error", "true");
		return "index";
	}
	
	@RequestMapping(value="loggedout", method=RequestMethod.GET)
	public String logout(ModelMap model){
		System.out.println("logout....");
		return "logout";
	}
}
