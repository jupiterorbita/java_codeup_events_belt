package com.john.codeup.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.john.codeup.models.User;
import com.john.codeup.services.UserService;

@Controller
public class UserController {
	@Autowired
	private UserService userService;
	
	@GetMapping("/user/{id}")
	public String userProfilePage(@PathVariable Long id, HttpSession s, Model x) {
//		ALWAYS CHECK LOGGED IN USER
		Long user_id = (Long) s.getAttribute("userId");
		if ((id != null) && (id == user_id)) {
//			this user
			User user = userService.findUserById(user_id);
			x.addAttribute("user", user);
			return "user/profile.jsp";
		}
		return "redirect:/";
	}
}
