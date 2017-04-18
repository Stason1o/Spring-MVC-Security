package com.sb.springsecurity.controller;

import com.sb.springsecurity.model.CarPiece;
import com.sb.springsecurity.service.CarPieceService;
import com.sb.springsecurity.validators.CarPieceValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
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

    @Autowired
    private CarPieceService carPieceService;
    @Autowired
    private CarPieceValidator carPieceValidator;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String listCarPieces(Model model){
        model.addAttribute("user", getPrincipal());
        model.addAttribute("carPiece", new CarPiece());
        model.addAttribute("listCarPieces", this.carPieceService.listCarPieces());
        return "welcome";
    }

    //For add and update person both
    @RequestMapping(value= "/carPiece", method = RequestMethod.POST)
    public String addCarPiece(@ModelAttribute("carPiece") CarPiece carPiece, BindingResult result, Errors errors, Model model){
        carPieceValidator.validate(carPiece, errors);
        if(result.hasErrors()){
            return "carPiece";
        }

        if(carPiece.getId() == 0){
            //new person, add it
            this.carPieceService.addCarPiece(carPiece);
        }else{
            //existing person, call update
            this.carPieceService.updateCarPiece(carPiece);
        }

        return "redirect:/carPiece";
    }

    @RequestMapping("/remove/{id}")
    public String removeCarPiece(@PathVariable("id") int id){
        this.carPieceService.removeCarPiece(id);
        return "redirect:/carPiece";
    }

    @RequestMapping("/edit/{id}")
    public String editCarPiece(@PathVariable("id") int id, Model model){
        model.addAttribute("user", getPrincipal());
        model.addAttribute("carPiece", this.carPieceService.getCarPieceById(id));
        model.addAttribute("listCarPieces", this.carPieceService.listCarPieces());
        return "carPiece";
    }

    @RequestMapping(value = "/carPiece", method = RequestMethod.GET)
    public String adminPage(ModelMap model) {
        model.addAttribute("user", getPrincipal());
        model.addAttribute("carPiece", new CarPiece());
        model.addAttribute("listCarPieces", carPieceService.listCarPieces());
        return "carPiece";
    }

    @RequestMapping(value = "/db", method = RequestMethod.GET)
    public String dbaPage(ModelMap model) {
        model.addAttribute("user", getPrincipal());
        return "dba";
    }

    @RequestMapping(value = "/Access_Denied", method = RequestMethod.GET)
    public String accessDeniedPage(ModelMap model) {
        model.addAttribute("user", getPrincipal());
        return "accessDenied";
    }

    @RequestMapping(value = "/welcome", method = RequestMethod.GET)
    public String helloPage(ModelMap modelMap){
        modelMap.addAttribute("user", getPrincipal());
        return "welcome";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String loginPage() {
        return "login";
    }

    @RequestMapping(value="/logout", method = RequestMethod.GET)
    public String logoutPage (HttpServletRequest request, HttpServletResponse response) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null){
            new SecurityContextLogoutHandler().logout(request, response, auth);
        }
        return "redirect:/login?logout";
    }

    private String getPrincipal(){
        String userName;
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

        if (principal instanceof UserDetails) {
            userName = ((UserDetails)principal).getUsername();
        } else {
            userName = principal.toString();
        }
        return userName;
    }
}
