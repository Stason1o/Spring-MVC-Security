package com.sb.springsecurity.dao;

import com.sb.springsecurity.model.User;

public interface UserDao {

    User findById(int id);

    User findByUsername(String sso);

    void save(User user);

    User findByEmail(String email);
}

