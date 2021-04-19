package com.sara.java_belt.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.sara.java_belt.models.Idea;
import com.sara.java_belt.models.User;
import com.sara.java_belt.services.IdeaService;
import com.sara.java_belt.services.UserService;
import com.sara.java_belt.validator.UserValidator;

@Controller
public class UserController {
    private final UserService userService;
    private final UserValidator userValidator;

    public UserController(UserService userService, UserValidator userValidator) {
        this.userService = userService;
        this.userValidator = userValidator;

    }

    @Autowired
    private IdeaService ideaService;

    @RequestMapping("/")
    public String registerLogin(@ModelAttribute("user") User user, HttpSession session, Model model) {
        if (session.getAttribute("errorMessage") != null) {
            model.addAttribute("errorMessage ", session.getAttribute("errorMessage"));
            return "registration-login.jsp";
        } else
            return "registration-login.jsp";
    }

    @RequestMapping(value = "/registration", method = RequestMethod.POST)
    public String registerUser(@Valid @ModelAttribute("user") User user, BindingResult result, Model model,
            HttpSession session) {
        userValidator.validate(user, result);
        if (result.hasErrors()) {
            return "registration-login.jsp";
        }
        User u = userService.registerUser(user);
        session.setAttribute("userId", u.getId());
        return "redirect:/ideas";
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String loginUser(@RequestParam("email") String email, @RequestParam("password") String password, Model model,
            HttpSession session) {
        if (userService.authenticateUser(email, password)) {
            User u = userService.findByEmail(email);
            session.setAttribute("userId", u.getId());
            return "redirect:/ideas";
        } else {
            session.setAttribute("errorMessage", "Wrong Email or password!");
            return "redirect:/";
        }

    }

    @RequestMapping("/ideas")
    public String home(HttpSession session, Model model) {
        Long uID = (Long) session.getAttribute("userId");
        User user = userService.findUserById(uID);
        Iterable<Idea> ideas = ideaService.allIdeas();
        model.addAttribute("ideas", ideas);
        model.addAttribute("user", user);
        return "index.jsp";

    }

    @RequestMapping("/ideas/lowest")
    public String homeL(HttpSession session, Model model) {
        Long uID = (Long) session.getAttribute("userId");
        User user = userService.findUserById(uID);
        Iterable<Idea> ideas = ideaService.allIdeasL();
        model.addAttribute("ideas", ideas);
        model.addAttribute("user", user);
        return "index.jsp";

    }

    @RequestMapping("/ideas/highest")
    public String homeH(HttpSession session, Model model) {
        Long uID = (Long) session.getAttribute("userId");
        User user = userService.findUserById(uID);
        Iterable<Idea> ideas = ideaService.allIdeasH();
        model.addAttribute("ideas", ideas);
        model.addAttribute("user", user);
        return "index.jsp";

    }

    @RequestMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }

}
