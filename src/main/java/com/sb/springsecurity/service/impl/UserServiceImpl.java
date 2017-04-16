package com.sb.springsecurity.service.impl;

import com.sb.springsecurity.dao.UserDao;
import com.sb.springsecurity.model.User;
import com.sb.springsecurity.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("userService")
@Transactional
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao dao;

    public User findById(int id) {
        return dao.findById(id);
    }

    public User findByUsername(String username) {
        System.out.println(dao.findByUsername(username) + "---------------------------------------------------------------USER_SERVICE_IMPL");
        return dao.findByUsername(username);
    }

    public void saveUser(User user) {
        this.dao.save(user);
    }

    public User findByEmail(String email) {
        return dao.findByEmail(email);
    }

}
