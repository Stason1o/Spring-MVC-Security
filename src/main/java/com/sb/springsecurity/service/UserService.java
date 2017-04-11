package com.sb.springsecurity.service;

import com.sb.springsecurity.model.User;

public interface UserService {

	User findById(int id);
	
	User findBySso(String sso);
	
}