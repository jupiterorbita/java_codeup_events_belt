package com.john.codeup.controllers;

import java.util.Collections;
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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.john.codeup.models.Event;
import com.john.codeup.models.Message;
import com.john.codeup.models.User;
import com.john.codeup.services.EventService;
import com.john.codeup.services.MessageService;
import com.john.codeup.services.UserService;

@Controller
public class EventController {
	@Autowired
	private UserService userService;
	@Autowired
	private EventService eventService;
	@Autowired
	private MessageService messageService;
	
//	CREATE EVENT----------------------------------------------
	@PostMapping("/createEvent/")
	public String createEvent(@Valid @ModelAttribute("event") Event event,
						BindingResult result, HttpSession session, Model x,
						RedirectAttributes flash) {
		
//		******* BRENDAS WAY UNSTEAD OF HIDDEN INPUT ***********
//		Long id = (Long) session.getAttribute("userId");
//		User thisUser = userService.findUserById(id);
//
//		event.setHost(thisUser);
//		********************************************************
		
//      check event name unique
		if (eventService.findByEventName(event.getEventName()) != null) {
//								field	errorCode		defaultMessage
    	  	result.rejectValue("eventName", "error.event", "Can't use the same event name.");
		}
		if (result.hasErrors()) {			
			if (event.getEventLocation() == null) {
////										field	errorCode		defaultMessage
				result.rejectValue("eventLocation", "error.event", "select a location");
			}
			
			Long id = (Long) session.getAttribute("userId");
			User thisUser = userService.findUserById(id);
			x.addAttribute("user", thisUser);
			
//			List<Event> allEvents = eventService.allEvents();
			List<Event> allEvents = eventService.findAllByOrderByEventDateAsc();
			x.addAttribute("allEvents", allEvents);
			
			String user_location = thisUser.getLocation();
			List<Event> sameLocationAsUser = eventService.findByEventLocationIs(user_location);
			x.addAttribute("sameLocationAsUser", sameLocationAsUser);
			
			List<Event> notSameLocationAsUser = eventService.findByEventLocationIsNot(user_location);
			x.addAttribute("notSameLocationAsUser", notSameLocationAsUser);
			return "events.jsp";
		}
		
//		Long uId = (Long) session.getAttribute("userId");
//
//		User u = userService.findUserById(uId);
//		
//		Event e = eventService.createEvent(event);
//		u.addEvent(e);
//	
//		userService.updateUser(u);
		
		eventService.createEvent(event);
		return "redirect:/events";
	}
	
//	JOIN -----------------------------------
	@GetMapping("/join/{id}")
	public String join(@PathVariable Long id, HttpSession session) {
//  i want the user to join this event!
		Long user_id = (Long) session.getAttribute("userId");
		User u = userService.findUserById(user_id);
//		this event---
		Event e = eventService.findEvent(id);
		e.getAttendees().add(u);
		eventService.updateEvent(e);
		return "redirect:/events";
	}
//	CANCEL --- removed from attendees---------
	@GetMapping("/remove/{id}")
	public String remove(@PathVariable Long id, HttpSession session) {
		
//		get user from session
		Long user_id = (Long) session.getAttribute("userId");
		User u = userService.findUserById(user_id);
		
		Event e = eventService.findEvent(id);
//		List<User> attendees = e.getAttendees();
		
//		eventService.removeByAttendeesIs(u);
		
//	    for (int i = 0; i < attendees.size(); i++) {
//	        if (Objects.equals(u, attendees.get(i))) {
//	        	attendees.remove(i);
//	        }
//	    }
		e.getAttendees().remove(u);
//	    attendees.remove(u);
		
	    eventService.updateEvent(e);
	    
//		for(User x : attendees) {
//			System.out.println(x.getFirstName());
//			System.out.println("-----");
//		}
//		
//		System.out.println("this user to remove = " + u.getFirstName());
		return "redirect:/events";
	}
	
	
//	EDIT EVENT--------------------------------------
	@GetMapping("/edit/{id}")
	public String editPage(@PathVariable("id") Long id, Model x) {
//		edit this event
		Event e = eventService.findEvent(id);
		
		x.addAttribute("event", e);
		return "edit.jsp";
	}
	@PutMapping("/edit/{id}")
	public String update(@Valid @ModelAttribute Event event, 
						BindingResult result) {
		if (result.hasErrors()) {
			return "/edit.jsp";
		}
		eventService.updateEvent(event);
		return "redirect:/events";
	}
	
//	SHOW EVENT --------- MESSAGES -----------------------
	@GetMapping("/show/{id}")
	public String show(@ModelAttribute("message") Message message, @PathVariable Long id, Model x) {
		
//		ArrayUtils.reverse(int[] array)
//
//
//		Collections.reverse(Arrays.asList(yourArray));
		
		Event e = eventService.findEvent(id);
		
		List<Message> messagesTextArr = e.getEventMessages();
		Collections.reverse(messagesTextArr);
		
		x.addAttribute("event", e);
		x.addAttribute("allEventAttendees", e.getAttendees());
		x.addAttribute("messagesTextArr", messagesTextArr);
		return "show.jsp";
	}
	
//	DELETE ------------------------------------
	@RequestMapping(value="/delete/{id}", method=RequestMethod.DELETE)
	public String destoy(@PathVariable Long id,
						RedirectAttributes rA) {
		rA.addFlashAttribute("deleted", "you deleted an event!");
		
		eventService.deleteEvent(id);
		return "redirect:/events";
	}
	@GetMapping("/delete_url/{id}")
	public String del(@PathVariable Long id, RedirectAttributes rA) {
		rA.addFlashAttribute("deleted", "you deleted an event!");
		eventService.deleteEvent(id);
		return "redirect:/events";
	}
	
	
}
