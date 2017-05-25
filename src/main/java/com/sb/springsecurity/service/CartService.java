package com.sb.springsecurity.service;

import com.sb.springsecurity.model.Cart;

import java.util.List;

/**
 * Created by sbogdanschi on 23/05/2017.
 */
public interface CartService {

    List<Cart> getAllOrdersById(int id);

    List<Cart> getPurchasedItemsById(int id);

    void saveOrder(Cart cart, int userId, int productId);

    void deleteOrderByUsername(String username);

    void deleteRowById(int id);

    void updateCart(Cart cart);
}
