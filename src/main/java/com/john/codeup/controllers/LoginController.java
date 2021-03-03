package com.john.codeup.controllers;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.Year;
import java.util.Date;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.john.codeup.models.User;
import com.john.codeup.services.UserService;
import com.john.codeup.validators.UserValidator;

@Controller
public class LoginController {
	@Autowired
	private UserService userService;
	@Autowired
	private UserValidator userValidator;
	
//	date calculation
	public static int age(Date birthday, Date date) {
	    DateFormat formatter = new SimpleDateFormat("yyyyMMdd");
	    int d1 = Integer.parseInt(formatter.format(birthday));
	    int d2 = Integer.parseInt(formatter.format(date));
	    int age = (d2-d1)/10000;
	    return age;
	}
	
////--- this route can be in any controller to check login -------------------
//	@GetMapping("/")
//	public String home(HttpSession session, Model model) {
//	// get user from session, save them in the model and return the home page
//	Long id = (Long) session.getAttribute("userId");
//	if (id != null ) {
//		User thisUser = userService.findUserById(id);
//		model.addAttribute("user", thisUser);
//		return "events.jsp";
//	}
//	return "redirect:/";
//}
	
	
    @GetMapping("/")
    public String index() {
        return "index.jsp";
    }
    
    @GetMapping("/login")
    public String loginPage() {
    	return "login.jsp";
    }
    @GetMapping("/register")
    public String registerPage(@ModelAttribute User user) {
    	return "register.jsp";
    }
    
//  ============= REGISTER METHOD ============================
    @PostMapping("/register")
    public String registerUser(@Valid @ModelAttribute("user") User user,
    							BindingResult result, HttpSession session,
    							RedirectAttributes flash) {
    	userValidator.validate(user, result);
    	System.out.println(user.getFirstName());
    	System.out.println(user.getLastName());
    	System.out.println(user.getLocation());
    	System.out.println(user.getDob());
    	System.out.println(user.getEmail());
    	System.out.println(user.getPassword());
    	System.out.println(user.getPasswordConfirmation());
//    	if (userService.findByEmail(user.getEmail()) != null) {
////    							field	errorCode		defaultMessage
//    		result.rejectValue("email", "error.user", "Can't register this email.");
//    		return "index.jsp";
//    	}

    	if (user.getDob() == null) {
    		user.setDob(new Date());
    	}
    	System.out.println("--------------");    	
    	int aa = age(user.getDob(), new Date());
    	System.out.println(aa);
    	if (aa < 18) {
//								field	errorCode		defaultMessage
			result.rejectValue("dob", "error.dob", "must be over 18 to join");
			return "register.jsp";
    	}
    	System.out.println("--------------");
    	
    	if (result.hasErrors()) {
    		return "register.jsp";
    	}
    	User u = userService.registerUser(user);
    	session.setAttribute("userId", u.getId());
    	return "redirect:/events";
    }
//  =========== LOGIN METHOD ==================================
    @PostMapping("/login")
    public String loginUser(@RequestParam("email") String email, 
    						@RequestParam("password") String password, 
    						Model model, HttpSession session, 
    						RedirectAttributes flash) {
    	if (userService.authenticateUser(email, password)) {
    		User thisUser = userService.findByEmail(email);
    		session.setAttribute("userId", thisUser.getId());
    		return "redirect:/events";
    	}
    	flash.addFlashAttribute("loginError", "failed to login, try again");
    	return "redirect:/login";
    }
//    ========== LOG OUT = EXIT ================================
    @RequestMapping("/logout")
    public String logout(HttpSession session, RedirectAttributes flash) {
    	session.invalidate();
    	flash.addFlashAttribute("loggedOut", ">>> You have Logged Out! <<<");
    	return "redirect:/";
    }
    
}
