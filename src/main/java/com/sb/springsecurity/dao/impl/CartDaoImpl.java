package com.sb.springsecurity.dao.impl;

import com.sb.springsecurity.dao.CartDao;
import com.sb.springsecurity.model.Cart;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by sbogdanschi on 23/05/2017.
 */
@Repository("cartDaoImpl")
public class CartDaoImpl implements CartDao {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public List<Cart> getAllOrdersById(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        List<Cart> list = session
                .createQuery("FROM Cart where user.id=" + id + " and isApproved=false").list();
//        for (Cart cart: list) {
//            Hibernate.initialize(cart.getUser());
//            Hibernate.initialize(cart.getProduct());
//        }
        System.out.println("==============================================================");
        for (Cart cart :
                list) {
//            System.out.println(cart.getId() + " -------- " + cart.getUser().getId() + "------" + cart.getProduct());
        }
        return list;
    }

    @Override
    public void saveOrder(Cart cart, int userId, int productId) {
        Session session = this.sessionFactory.getCurrentSession();
        session.createSQLQuery("INSERT INTO cart(user_id, piece_id) VALUES (:userId, :productId)")
                .setParameter("userId", userId)
                .setParameter("productId", productId).executeUpdate();
//        session.persist(cart);
    }

    @Override
    public void deleteOrderByUsername(String username) {
        sessionFactory.getCurrentSession()
                .createSQLQuery("DELETE FROM cart WHERE user_id = (Select id from app_user where sso_id="+ username +")")
                .executeUpdate();
    }

    @Override
    public void deleteRowById(int id) {
        sessionFactory.getCurrentSession()
                .createSQLQuery("DELETE FROM cart WHERE piece_id =" + id)
                .executeUpdate();
    }

    @Override
    public void updateCart(Cart cart) {
        sessionFactory.getCurrentSession().update(cart);
    }
}
