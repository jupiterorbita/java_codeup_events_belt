package com.john.codeup.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.john.codeup.models.Event;
import com.john.codeup.models.User;
import com.john.codeup.services.EventService;
import com.john.codeup.services.UserService;

@Controller
public class MainController {
	@Autowired
	private UserService userService;
	@Autowired
	private EventService eventService;
	
//--- this route can be in any controller to check login -------------------
	@GetMapping("/events")
	public String home(HttpSession session, Model x,
			@ModelAttribute("event") Event event) {
	// get user from session, save them in the model and return the home page
	Long id = (Long) session.getAttribute("userId");
	if (id != null ) {
		User thisUser = userService.findUserById(id);
		x.addAttribute("user", thisUser);
		
		
//		add ALL events to model
//		List<Event> allEvents = eventService.allEvents();
//		List<Event> allEvents = eventService.findAllByOrderByEventNameAsc();
		List<Event> allEvents = eventService.findAllByOrderByEventDateAsc();
		x.addAttribute("allEvents", allEvents);
		
//		add all SAME LOCATION events as USER
		String user_location = thisUser.getLocation();
		List<Event> sameLocationAsUser = eventService.findByEventLocationIs(user_location);
		x.addAttribute("sameLocationAsUser", sameLocationAsUser);
		
//		NOT the same location
		List<Event> notSameLocationAsUser = eventService.findByEventLocationIsNot(user_location);
		x.addAttribute("notSameLocationAsUser", notSameLocationAsUser);
		return "events.jsp";
	}
	return "redirect:/";
}
	
	
	
}
