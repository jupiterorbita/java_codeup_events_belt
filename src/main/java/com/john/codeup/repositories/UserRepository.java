package com.john.codeup.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.john.codeup.models.User;

@Repository
public interface UserRepository extends CrudRepository<User, Long>{
	User findByEmail(String email);
	
	List<User> findAll();
	
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
