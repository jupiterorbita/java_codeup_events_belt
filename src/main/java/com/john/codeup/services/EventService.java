package com.john.codeup.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.john.codeup.models.Event;
import com.john.codeup.repositories.EventRepository;

@Service
public class EventService {

	@Autowired
	private EventRepository eventRepository;

//	return all events from string
//  Return all songs by an artist
	public List<Event> findByEventNameContaining(String search){
		return eventRepository.findByEventNameContaining(search);
	}
//	sameLocationAsUser
	public List<Event> findByEventLocationIs(String user_location) {
//		List<Event> e = eventRepository.findByEventLocationIs(user_location);

		return eventRepository.findByEventLocationIs(user_location);
	}
//	NOTsameLocationAsUser
	public List<Event> findByEventLocationIsNot(String user_location) {
		return eventRepository.findByEventLocationIsNot(user_location);
	}
////	REMOVE from attendees
//	public void removeByAttendeesIs(User u) {
//		eventRepository.removeByAttendeesIs(u);
//	}
//	READ ALL DATE ASC
	public List<Event> findAllByOrderByEventDateAsc(){
		return eventRepository.findAllByOrderByEventDateAsc();
	}
//	READ ALL NAME ASC
	public List<Event> findAllByOrderByEventNameAsc(){
		return eventRepository.findAllByOrderByEventNameAsc();
	}
//	find unique name
	public Event findByEventName(String newEventName) {
		return eventRepository.findByEventName(newEventName);
	}
	
//	READ ALL
	public List<Event> allEvents(){
		return eventRepository.findAll();
	}
//	CREATE
	public Event createEvent(Event e) {
		return eventRepository.save(e);
	}
//	UPDATE
	public Event updateEvent(Event e) {
		return eventRepository.save(e);
	}
//	READ ONE
	public Event findEvent(Long id) {
		Optional<Event> optionalDojo = eventRepository.findById(id);
		if (optionalDojo.isPresent()) {
			return optionalDojo.get();
		}
		return null;
	}
//	DELETE
	public void deleteEvent(Long id) {
		eventRepository.deleteById(id);
	}

}
