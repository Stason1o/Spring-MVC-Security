package com.sb.springsecurity.controller;

import com.sb.springsecurity.model.User;
import com.sb.springsecurity.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.validation.Valid;

/**
 * Created by Stanislav Bogdanschi on 16.04.2017.
 */
@Controller
public class UserController {

    private UserService userService;

    @Autowired
    @Qualifier(value = "userService")
    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    @RequestMapping(value = "/user/registration", method = RequestMethod.GET)
    public String registrationPage(ModelMap modelMap) {
        modelMap.addAttribute("user", new User());
        return "register";
    }

    @RequestMapping(value = "/user/registration/add", method = RequestMethod.POST)
    public String registerNewUser(@ModelAttribute("user") @Valid User user, BindingResult result, Errors errors) {

        if(user != null)
            userService.saveUser(user);
//        if (!checkIfEmailExists(user, result)) {
//            userService.saveUser(user);
//        }
//
//        if (checkIfEmailExists(user, result)) {
//            result.rejectValue("email", "Email is already used. Try another one");
//        }

        return "redirect:/login";
    }

//    private boolean checkIfEmailExists(User user, BindingResult result) {
//        return userService.isEmailInDatabase(user.getEmail());
//    }
}
