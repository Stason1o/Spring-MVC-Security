package com.sb.springsecurity.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by sbogdanschi on 19/04/2017.
 */
@Controller
public class PageController {

    @RequestMapping(value = "/about", method = RequestMethod.GET)
    public String aboutPage(ModelMap modelMap) {
        return "about";
    }

    @RequestMapping(value = "/contact", method = RequestMethod.GET)
    public String contactPage(ModelMap modelMap){
        return "contact";
    }

    @RequestMapping(value = "/shop", method = RequestMethod.GET)
    public String shopPage(ModelMap modelMap){
        return "shop";
    }

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String indexPage(ModelMap modelMap){
        return "index";
    }
}
