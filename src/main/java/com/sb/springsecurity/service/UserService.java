package com.sb.springsecurity.service;

import com.sb.springsecurity.model.User;

public interface UserService {

    User findById(int id);

    User findByUsername(String username);

    void saveUser(User user);

    User findByEmail(String email);

}