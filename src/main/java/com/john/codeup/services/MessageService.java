package com.john.codeup.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.john.codeup.models.Message;
import com.john.codeup.repositories.MessageRepository;

@Service
public class MessageService {
	@Autowired MessageRepository messageRepository;
	
//	READ ALL
	public List<Message> allMessages(){
		return messageRepository.findAll();
	}
//	CREATE
	public Message createMessage(Message m) {
		return messageRepository.save(m);
	}
//	UPDATE
	public Message updateMessage(Message m) {
		return messageRepository.save(m);
	}
//	READ ONE
	public Message findMessage(Long id) {
		Optional<Message> optionalDojo = messageRepository.findById(id);
		if (optionalDojo.isPresent()) {
			return optionalDojo.get();
		}
		return null;
	}
//	DELETE
	public void deleteMessage(Long id) {
		messageRepository.deleteById(id);
	}
}
