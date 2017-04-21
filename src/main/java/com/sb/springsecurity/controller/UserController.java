package com.sb.springsecurity.controller;

import com.sb.springsecurity.model.User;
import com.sb.springsecurity.service.UserService;
import com.sb.springsecurity.validators.UserValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by Stanislav Bogdanschi on 16.04.2017.
 */
@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private UserValidator userValidator;


    @RequestMapping(value = "/user/registration", method = RequestMethod.GET)
    public String registrationPage(ModelMap modelMap) {
        modelMap.addAttribute("user", new User());
        return "register";
    }

    @RequestMapping(value = "/user/registration", method = RequestMethod.POST)
    public String registerNewUser(@ModelAttribute("user") User user, BindingResult result, Errors errors, Model model) {
        userValidator.validate(user, result);
        if (result.hasErrors()) {
            return "register";
        }
        userService.saveUser(user);

        return "redirect:/login";
    }

}
