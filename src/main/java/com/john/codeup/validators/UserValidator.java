package com.john.codeup.validators;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.john.codeup.models.User;
import com.john.codeup.services.UserService;

@Component
public class UserValidator implements Validator{
	@Autowired
	private UserService userService;
	
    // 1
    @Override
    public boolean supports(Class<?> clazz) {
        return User.class.equals(clazz);
    }
    
    // 2
    @Override
    public void validate(Object target, Errors errors) {
        User user = (User) target;
        
        if (!user.getPasswordConfirmation().equals(user.getPassword())) {
            // 3
            errors.rejectValue("passwordConfirmation", "Match");
        }
        
//        check email unique
        if (userService.findByEmail(user.getEmail()) != null) {
//								field	errorCode		defaultMessage
			errors.rejectValue("email", "error.user", "Can't register this email.");
			}
    	}
}
