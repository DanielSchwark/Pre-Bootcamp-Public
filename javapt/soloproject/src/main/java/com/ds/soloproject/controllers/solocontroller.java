package com.ds.soloproject.controllers;

import java.util.stream.Collectors;

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
import org.springframework.web.bind.annotation.DeleteMapping;

import com.ds.soloproject.models.Entry;
import com.ds.soloproject.models.LoginUser;
import com.ds.soloproject.models.User;
import com.ds.soloproject.services.EntryService;
import com.ds.soloproject.services.UserService;


@Controller
public class solocontroller {
	@Autowired
	private UserService users;
	@Autowired
	private EntryService entries;

	@GetMapping("/")
	public String index(Model model) {
	    model.addAttribute("newUser", new User());
	    model.addAttribute("newLogin", new LoginUser());
	    return "index.jsp";
	}
	 
	@PostMapping("/register")
	public String register(@Valid @ModelAttribute("newUser") User newUser, BindingResult result, Model model, HttpSession session) {
	     
		User user = users.register(newUser, result);
		
	    if(result.hasErrors()) {
	        model.addAttribute("newLogin", new LoginUser());
	        return "index.jsp";
	    }
	    session.setAttribute("userId", user.getId());
	    return "redirect:/dashboard";
	}
	 
	@PostMapping("/login")
	public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin, BindingResult result, Model model, HttpSession session) {
		User user = users.login(newLogin, result);
	    if(result.hasErrors() || user==null) {
	        model.addAttribute("newUser", new User());
	        return "index.jsp";
	    }
	    session.setAttribute("userId", user.getId());
	    return "redirect:/dashboard";
	}
	
	@GetMapping("/dashboard")
	public String dashboard(@ModelAttribute("entry") Entry entry, HttpSession session, Model model) {
		if(session.getAttribute("userId") == null) {
			return "redirect:/logout";
		}
		Long userId = (Long) session.getAttribute("userId");
		User user = users.findById(userId);
		model.addAttribute("user", user);
		model.addAttribute("entries", entries.all().stream().filter(e-> e.getUser() == user).collect(Collectors.toList()));
	    return "dashboard.jsp";
	}
	
	@PostMapping("/entries")
    public String createEntry(@Valid @ModelAttribute("entry") Entry entry, BindingResult result) {

    	if (result.hasErrors()) {
    		return "dashboard.jsp";
    	}
    	
    	entries.create(entry);
    	
    	return "redirect:/dashboard";
    }

	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.setAttribute("userId", null);
	    return "redirect:/";
	}

	@GetMapping("/entries/{id}/edit")
    public String editPage(Model model, @PathVariable("id") Long id, HttpSession session) {
    	
    	if(session.getAttribute("userId") == null) {
    		return "redirect:/dashboard";
    	}
    	
    	Entry entry = entries.findById(id);
    	model.addAttribute("entry", entry);
    	
    	return "editPage.jsp";
    
    }
    
    @PutMapping("/entries/{id}")
    public String updateEntry(@Valid @ModelAttribute("entry") Entry entry, BindingResult result, Model model) {
    	
    	if (result.hasErrors()) {
    		return "editPage.jsp";
    	}
    	

        entries.update(entry);
        
    	
    	return "redirect:/dashboard";
    }
	
    @DeleteMapping("/entries/{id}")
    public String destroy(@ModelAttribute("entry") Entry entry) {
        entries.delete(entry);
        return "redirect:/dashboard";
    }
}
