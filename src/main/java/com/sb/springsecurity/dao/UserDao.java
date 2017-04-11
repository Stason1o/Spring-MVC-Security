package com.sb.springsecurity.dao;

import com.sb.springsecurity.model.User;

public interface UserDao {

	User findById(int id);
	
	User findBySSO(String sso);
	
}

