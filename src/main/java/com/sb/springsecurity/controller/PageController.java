package com.sb.springsecurity.controller;

import com.sb.springsecurity.model.CarPiece;
import com.sb.springsecurity.model.Cart;
import com.sb.springsecurity.model.User;
import com.sb.springsecurity.service.CarPieceService;
import com.sb.springsecurity.service.CartService;
import com.sb.springsecurity.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

/**
 * Created by sbogdanschi on 19/04/2017.
 */
@Controller
public class PageController {
    private static final String ANONYMOUS_USER = "anonymousUser";

    @Autowired
    private UserService userService;

    @Autowired
    private CarPieceService carPieceService;

    @Autowired
    private CartService cartService;

    @RequestMapping(value = "/about", method = RequestMethod.GET)
    public String aboutPage(ModelMap modelMap) {
        modelMap.addAttribute("user", getPrincipal());
        return "about";
    }

    @RequestMapping(value = "/contact", method = RequestMethod.GET)
    public String contactPage(ModelMap modelMap){
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

    @RequestMapping(value = "/shop", method = RequestMethod.POST)
    public String shopPagePost(@RequestParam(value = "carPieceId", required = false)Integer carPieceId){
        Cart cart = new Cart();
        User user = userService.findByUsername(getPrincipal());
        System.out.println(user + "------------------------shop.post");
        if(carPieceId != null){
            CarPiece carPiece = carPieceService.getCarPieceById(carPieceId);
            System.out.println(carPiece + "------------------------shop.post");
             cart.setUser(user);
             cart.setProduct(carPiece);
            cartService.saveOrder(cart, user.getId(), carPieceId);
            return "redirect:/cart";
        }
        return "shop";
    }

    @RequestMapping(value = "/cart", method = RequestMethod.GET)
    public String showCartPage(ModelMap modelMap){
        if(getPrincipal().equals(ANONYMOUS_USER)){
            return "redirect:/login";
        }
        User loggedUser = userService.findByUsername(getPrincipal());
        modelMap.addAttribute("loggedUser", loggedUser);
        modelMap.addAttribute("listCartContent", cartService.getAllOrdersById(loggedUser.getId()));
        return "cart";
    }

    @RequestMapping(value = "/cart", method = RequestMethod.POST)
    public String executeBuy(@RequestParam(value = "carPieceIdToDelete", required = false) Integer carPieceIdToDelete,
                             @RequestParam(value = "totalPrice" ,required = false)Integer totalPrice,
                             RedirectAttributes redirectAttributes){
        if(carPieceIdToDelete != null){
            cartService.deleteRowById(carPieceIdToDelete);
            return "redirect:/cart";
        }

        if(totalPrice != null){
            redirectAttributes.addAttribute("totalPrice", totalPrice);
            return "redirect:/confirmPage/{totalPrice}";
        }
        return "redirect:/index";
    }

    @RequestMapping(value = "/confirmPage/{totalPrice}", method = RequestMethod.GET)
    public String displayConfirmPage(@PathVariable(value = "totalPrice") int totalPrice,
                                     ModelMap modelMap){
        if(getPrincipal().equals(ANONYMOUS_USER)){
            return "redirect:/login";
        }
        User loggedUser = userService.findByUsername(getPrincipal());
        modelMap.addAttribute("totalPrice", totalPrice);
        modelMap.addAttribute("loggedUser", loggedUser);
        modelMap.addAttribute("listCartContent", cartService.getAllOrdersById(loggedUser.getId()));
        return "confirmPage";
    }

    @RequestMapping(value = "/confirmPage/{totalPrice}", method = RequestMethod.POST)
    public String executeOrder(@PathVariable("totalPrice") Integer totalPrice){
        System.out.println("/CONFIRAMPAGE/TOTALPRICE POST");
        User loggedUser = userService.findByUsername(getPrincipal());
        List<Cart> list = cartService.getAllOrdersById(loggedUser.getId());
            for (Cart cart: list) {
                cart.setApproved(true);
                cartService.updateCart(cart);
            }
        return "redirect:/index";
    }

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String indexPage(ModelMap modelMap){
        modelMap.addAttribute("user", getPrincipal());
        return "index";
    }

    @RequestMapping(value = "/history", method = RequestMethod.GET)
    public String showHistoryPage(ModelMap modelMap){
        if(getPrincipal().equals(ANONYMOUS_USER)){
            return "redirect:/login";
        }

        User loggedUser = userService.findByUsername(getPrincipal());
        modelMap.addAttribute("loggedUser", loggedUser);
        modelMap.addAttribute("listPurchasedProducts", cartService.getPurchasedItemsById(loggedUser.getId()));
        return "history";
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
