package com.john.codeup.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.john.codeup.models.Event;

@Repository
public interface EventRepository extends CrudRepository<Event, Long> {
	List<Event> findAll();
	List<Event> findAllByOrderByEventNameAsc();
	List<Event> findAllByOrderByEventNameDesc();
	
	List<Event> findAllByOrderByEventDateAsc();
	List<Event> findAllByOrderByEventDateDesc();
	
	List<Event> findByEventNameContaining(String search);

	Event findByEventName(String newEvent);
	
	
//	List<Event> findByEventNameEquals(String eventName);
	
	List<Event> findByEventLocationIs(String user_location);
	List<Event> findByEventLocationIsNot(String user_location);
	
	List<Event> findByOrderByEventDateAsc();
	
//	void removeByAttendeesIs(User u);
	
//	List<Person> findByAttendeesByIdIs(Person p)
	
//	return categories that a product is NOT in
//	List<Category> findByProductsNotContaining(Product product);
	
//	return categories of a product is in
//	List<Category> findByProductsContaining(Product product);
	
// 	  this method finds books with descriptions containing the search string
//    List<Book> findByDescriptionContaining(String search);
//    // this method counts how many titles contain a certain string
//    Long countByTitleContaining(String search);
//    // this method deletes a book that starts with a specific title
//    Long deleteByTitleStartingWith(String search);
//	  List<Person> findByLicenseIsNull();

}
