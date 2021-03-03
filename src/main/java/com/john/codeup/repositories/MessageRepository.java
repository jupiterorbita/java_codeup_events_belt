package com.john.codeup.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.john.codeup.models.Message;

@Repository
public interface MessageRepository extends CrudRepository<Message, Long>{

	List<Message> findAll();

}