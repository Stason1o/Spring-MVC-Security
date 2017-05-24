package com.sb.springsecurity.service.impl;

import com.sb.springsecurity.dao.CartDao;
import com.sb.springsecurity.model.Cart;
import com.sb.springsecurity.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by sbogdanschi on 23/05/2017.
 */
@Repository("cartServiceImpl")
@Transactional
public class CartServiceImpl implements CartService {

    @Autowired
    private CartDao cartDao;

    @Override
    public List<Cart> getAllOrdersById(int id) {
        List<Cart> carts = cartDao.getAllOrdersById(id);

        carts.forEach(System.out::println);

//        for (Cart cart: carts) {
//            Hibernate.initialize(cart.getUser());
//            Hibernate.initialize(cart.getProduct());
//        }
        return carts;
    }

    @Override
    public void saveOrder(Cart cart, int userId, int productId) {
        System.out.println(cart.getProduct() + "----------------------------------service");
        System.out.println(cart.getUser() + "-----------------------------------service");
        cartDao.saveOrder(cart, userId, productId);
    }

    @Override
    public void deleteOrderByUsername(String username) {
        cartDao.deleteOrderByUsername(username);
    }

    @Override
    public void deleteRowById(int id) {
        cartDao.deleteRowById(id);
    }

    @Override
    public void updateCart(Cart cart) {
        cartDao.updateCart(cart);
    }
}
