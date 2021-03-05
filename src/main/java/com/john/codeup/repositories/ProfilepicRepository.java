package com.john.codeup.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.john.codeup.models.Profilepic;

@Repository
public interface ProfilepicRepository extends CrudRepository<Profilepic, Long>{
	List<Profilepic> findAll();
}
