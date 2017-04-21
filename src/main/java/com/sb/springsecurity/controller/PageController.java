package com.sb.springsecurity.controller;

import com.sb.springsecurity.service.CarPieceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by sbogdanschi on 19/04/2017.
 */
@Controller
public class PageController {
    private static final String ANONYMOUS_USER = "anonymousUser";

    @Autowired
    private CarPieceService carPieceService;

    @RequestMapping(value = "/about", method = RequestMethod.GET)
    public String aboutPage(ModelMap modelMap) {
        if(getPrincipal().equals(ANONYMOUS_USER))
            return "redirect:/login";
        modelMap.addAttribute("user", getPrincipal());
        return "about";
    }

    @RequestMapping(value = "/contact", method = RequestMethod.GET)
    public String contactPage(ModelMap modelMap){
        if(getPrincipal().equals(ANONYMOUS_USER))
            return "redirect:/login";
        modelMap.addAttribute("user", getPrincipal());
        return "contact";
    }

    @RequestMapping(value = "/shop", method = RequestMethod.GET)
    public String shopPage(ModelMap modelMap){
        if(getPrincipal().equals(ANONYMOUS_USER))
            return "redirect:/login";
        modelMap.addAttribute("listCarPieces", carPieceService.listCarPieces());
        return "shop";
    }

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String indexPage(ModelMap modelMap){
        if(getPrincipal().equals(ANONYMOUS_USER))
            return "redirect:/login";
        modelMap.addAttribute("user", getPrincipal());
        return "index";
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
