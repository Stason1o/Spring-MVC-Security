package com.sb.springsecurity.controller;

import com.sb.springsecurity.model.CarPiece;
import com.sb.springsecurity.service.CarPieceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by sbogdanschi on 11/04/2017.
 */
@Controller
public class CarPieceController {

    private CarPieceService carPieceService;

    @Autowired()
    @Qualifier(value = "personService")
    public void setCarPieceService(CarPieceService carPieceService) {
        this.carPieceService = carPieceService;
    }

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String listPersons(Model model){
        model.addAttribute("person", new CarPiece());
        model.addAttribute("listPersons", this.carPieceService.listPersons());
        return "person";
    }

    //For add and update person both
    @RequestMapping(value= "/person/add", method = RequestMethod.POST)
    public String addPerson(@ModelAttribute("person") CarPiece p){
        if(p.getId() == 0){
            //new person, add it
            this.carPieceService.addPerson(p);
        }else{
            //existing person, call update
            this.carPieceService.updatePerson(p);
        }

        return "redirect:/";
    }

    @RequestMapping("/remove/{id}")
    public String removePerson(@PathVariable("id") int id){
        this.carPieceService.removePerson(id);
        return "redirect:/";
    }

    @RequestMapping("/edit/{id}")
    public String editPerson(@PathVariable("id") int id, Model model){
        System.out.println("Inside method PersonController.editPerson");
        model.addAttribute("person", this.carPieceService.getPersonById(id));
        System.out.println("Inside method PersonController.editPerson  AFTER getPersonById");
        model.addAttribute("listPersons", this.carPieceService.listPersons());
        System.out.println("Inside method PersonController.editPerson  AFTER listPersons");
        return "person";
    }

    @RequestMapping(value = "/person", method = RequestMethod.GET)
    public String adminPage(ModelMap model) {
        model.addAttribute("person", new CarPiece());
        model.addAttribute("listPersons", carPieceService.listPersons());
        return "person";
    }

    @RequestMapping(value = "/db", method = RequestMethod.GET)
    public String dbaPage(ModelMap model) {
        model.addAttribute("user", getPrincipal());
        return "dba";
    }
    //
    @RequestMapping(value = "/Access_Denied", method = RequestMethod.GET)
    public String accessDeniedPage(ModelMap model) {
        model.addAttribute("user", getPrincipal());
        return "accessDenied";
    }
    //
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String loginPage() {
        return "login";
    }
    //
    @RequestMapping(value="/logout", method = RequestMethod.GET)
    public String logoutPage (HttpServletRequest request, HttpServletResponse response) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null){
            new SecurityContextLogoutHandler().logout(request, response, auth);
        }
        return "redirect:/login?logout";
    }

    private String getPrincipal(){
        String userName = null;
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

        if (principal instanceof UserDetails) {
            userName = ((UserDetails)principal).getUsername();
        } else {
            userName = principal.toString();
        }
        return userName;
    }
}
