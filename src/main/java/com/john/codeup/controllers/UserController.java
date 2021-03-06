package com.john.codeup.controllers;

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
import org.springframework.web.bind.annotation.PutMapping;

import com.john.codeup.models.Event;
import com.john.codeup.models.User;
import com.john.codeup.services.EventService;
import com.john.codeup.services.UserService;

@Controller
public class UserController {
	@Autowired
	private UserService userService;
	@Autowired
	private EventService eventService;
	
	
//	profile page -------------------------------------------------
	@GetMapping("/user/{id}")
	public String userProfilePage(@PathVariable Long id, HttpSession s, Model x) {
//		ALWAYS CHECK LOGGED IN USER
		Long user_id = (Long) s.getAttribute("userId");
		if ((id != null) && (id == user_id)) {
//			this user
			User user = userService.findUserById(user_id);
			x.addAttribute("user", user);
			
			List<Event> userEvents = user.getEvents();
			x.addAttribute("userEvents", userEvents);
			return "user/profile.jsp";
		}
		return "redirect:/";
	}
	
//	show edit user page ------------------------------------------
	@GetMapping("/user/edit/{id}")
	public String showUserEditPage(@PathVariable Long id, Model x,
								HttpSession s) {
		Long user_id = (Long) s.getAttribute("userId");
		if ((id != null) && (id == user_id)) {
//			this user
			User user = userService.findUserById(user_id);
			x.addAttribute("user", user);
			return "user/edit_user.jsp";
		}
		return "redirect:/";
	}
//	edit user method ---------------------------------------------
	@PutMapping("/editUser/{id}")
	public String editUser(@Valid @ModelAttribute User user, BindingResult result,
						@PathVariable Long id){
		if (result.hasErrors()) {
			return "user/edit_user.jsp";
		}
//		find this users' pass
//		very dangerous!!!!!
		User u = userService.findUserById(id);
		String tempP = u.getPassword();
		user.setPassword(tempP);
		
//		re add that users' events they are going to
		List<Event> thisUserEvents = u.getEvents();
		user.setEvents(thisUserEvents);
		
		userService.updateUser(user);
		return "redirect:/user/" + id;
	}
	
	
	
	
}
